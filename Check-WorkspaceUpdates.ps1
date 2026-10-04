#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Check for and manage updates to workspace files from templates (GitHub + Local Fallback).

.DESCRIPTION
    Hybrid Template Management System with Three-Tier Fallback:
    1. GitHub (Primary): https://github.com/dcrozier007/Workspace-Templates
    2. COPilot_Template (Secondary): D:\COPilot Workspaces\COPilot_Template
    3. Local Template (Tertiary): Default template folder in workspace
    
    Script compares workspace files with template files and offers updates.

.PARAMETER WorkspacePath
    Path to your workspace. Defaults to current directory.

.PARAMETER AutoUpdate
    If specified, automatically update files without prompting.

.PARAMETER BackupFiles
    If specified, create .backup.md files before updating. Default: true

.PARAMETER SkipGitHub
    If specified, skip GitHub and use local templates only.

.EXAMPLE
    # Check for updates (GitHub first, then fallback)
    .\Check-WorkspaceUpdates-v2.ps1

.EXAMPLE
    # Skip GitHub, use local only
    .\Check-WorkspaceUpdates-v2.ps1 -SkipGitHub -AutoUpdate

.EXAMPLE
    # Check a specific workspace
    .\Check-WorkspaceUpdates-v2.ps1 -WorkspacePath "d:\COPilot Workspaces\Generate Demo Scripts"
#>

param(
    [string]$WorkspacePath = (Get-Location).Path,
    [switch]$AutoUpdate,
    [switch]$BackupFiles = $true,
    [switch]$SkipGitHub
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# Configuration
$GitHubRepo = "https://github.com/dcrozier007/Workspace-Templates.git"
$CopilotTemplateDir = "D:\COPilot Workspaces\COPilot_Template"
$LocalTemplateDir = "template"
$TempGitCloneDir = Join-Path $env:TEMP "Workspace-Templates-$(Get-Random)"

# Validate workspace path
if (-not (Test-Path $WorkspacePath)) {
    Write-Error "Workspace not found: $WorkspacePath"
}

if (-not (Test-Path $env:TEMP)) {
    Write-Error "Temp directory not found: $env:TEMP"
}

Write-Host "========================================================================" -ForegroundColor Cyan
Write-Host "  Workspace Update Checker v2.0 (Hybrid Template System)" -ForegroundColor Cyan
Write-Host "========================================================================" -ForegroundColor Cyan
Write-Host ""

# ==================== HYBRID TEMPLATE SOURCE RESOLUTION ====================
function Get-TemplateSource {
    param(
        [bool]$SkipGitHub = $false
    )
    
    $templateSource = @{
        Path = $null
        Source = "Unknown"
        IsTemporary = $false
        TempDir = $null
    }
    
    Write-Host "Resolving template source..." -ForegroundColor Yellow
    
    # Priority 1: GitHub (unless skipped)
    if (-not $SkipGitHub) {
        Write-Host "  [1] Attempting GitHub..." -ForegroundColor Gray
        try {
            # Ensure Git is in PATH
            if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
                $gitPath = "C:\Program Files\Git\bin"
                if (Test-Path $gitPath) {
                    $env:PATH = "$gitPath;" + $env:PATH
                }
            }
            
            # Clone from GitHub
            Write-Host "      Cloning from $GitHubRepo" -ForegroundColor Gray
            $gitOutput = & git clone --quiet $GitHubRepo $TempGitCloneDir 2>&1
            
            if (Test-Path "$TempGitCloneDir\agents") {
                Write-Host "      [OK] GitHub source acquired" -ForegroundColor Green
                $templateSource.Path = $TempGitCloneDir
                $templateSource.Source = "GitHub (Primary)"
                $templateSource.IsTemporary = $true
                $templateSource.TempDir = $TempGitCloneDir
                return $templateSource
            }
        } catch {
            Write-Host "      [SKIP] GitHub unavailable: $($_.Exception.Message)" -ForegroundColor Yellow
        }
    }
    
    # Priority 2: COPilot_Template workspace
    if (Test-Path "$CopilotTemplateDir\agents") {
        Write-Host "  [2] Using COPilot_Template workspace fallback" -ForegroundColor Gray
        Write-Host "      [OK] COPilot_Template source acquired" -ForegroundColor Green
        $templateSource.Path = $CopilotTemplateDir
        $templateSource.Source = "COPilot_Template (Fallback)"
        $templateSource.IsTemporary = $false
        return $templateSource
    }
    
    # Priority 3: Local template folder
    $localTemplatePath = Join-Path $WorkspacePath $LocalTemplateDir
    if (Test-Path "$localTemplatePath\agents") {
        Write-Host "  [3] Using local template folder fallback" -ForegroundColor Gray
        Write-Host "      [OK] Local template source acquired" -ForegroundColor Green
        $templateSource.Path = $localTemplatePath
        $templateSource.Source = "Local Template (Fallback)"
        $templateSource.IsTemporary = $false
        return $templateSource
    }
    
    # No templates found
    Write-Error "No template source available! Checked: GitHub, COPilot_Template, Local"
}

# Get the template source using hybrid approach
$templateSource = Get-TemplateSource -SkipGitHub $SkipGitHub
$TemplatePath = $templateSource.Path

Write-Host ""
Write-Host "Template Source: $($templateSource.Source)" -ForegroundColor Cyan
Write-Host "Template Path:   $TemplatePath" -ForegroundColor Gray
Write-Host "Workspace Path:  $WorkspacePath" -ForegroundColor Gray
Write-Host ""

# Define files to check (relative to template root)
$filesToCheck = @(
    # Agent files
    "agents\SQL-Server-admin.agent.md",
    "agents\powershell-dev.agent.md",
    "agents\windows-server-admin.agent.md",
    "agents\communications-recruiter.agent.md",
    
    # Instruction files
    "instructions\SQL-Server-admin.instructions.md",
    "instructions\powershell-dev.instructions.md",
    "instructions\windows-server-admin.instructions.md",
    "instructions\communications-recruiter.instructions.md",
    "instructions\T-SQL-Coding-Style-Guide.md"
)

Write-Host "Comparing files..." -ForegroundColor Yellow

$updatesAvailable = @()
$allCurrent = $true

# Check each file
foreach ($file in $filesToCheck) {
    $templateFile = Join-Path $TemplatePath $file
    $workspaceFile = Join-Path $WorkspacePath $file
    
    # Skip if template file doesn't exist
    if (-not (Test-Path $templateFile)) {
        continue
    }
    
    # If workspace file doesn't exist, it needs to be created
    if (-not (Test-Path $workspaceFile)) {
        $updatesAvailable += @{
            File = $file
            Status = "Missing"
            TemplatePath = $templateFile
            WorkspacePath = $workspaceFile
        }
        $allCurrent = $false
        continue
    }
    
    # Compare file modification times
    $templateFileInfo = Get-Item $templateFile
    $workspaceFileInfo = Get-Item $workspaceFile
    
    if ($templateFileInfo.LastWriteTime -gt $workspaceFileInfo.LastWriteTime) {
        $timeDiff = $templateFileInfo.LastWriteTime - $workspaceFileInfo.LastWriteTime
        $updatesAvailable += @{
            File = $file
            Status = "Update Available"
            TemplatePath = $templateFile
            WorkspacePath = $workspaceFile
            LastWriteTime = $templateFileInfo.LastWriteTime
            TimeDifference = $timeDiff
        }
        $allCurrent = $false
    }
}

# Report results
Write-Host ""
if ($allCurrent) {
    Write-Host "[OK] Your workspace is up to date!" -ForegroundColor Green
    exit 0
}

Write-Host "[!] Updates are available:" -ForegroundColor Yellow
Write-Host ""

foreach ($update in $updatesAvailable) {
    $status = $update.Status
    $file = $update.File
    
    if ($status -eq "Update Available") {
        $timeDiff = $update.TimeDifference
        Write-Host "  [*] $file" -ForegroundColor Cyan
        Write-Host "       Status: Update available ($(($timeDiff).TotalDays) days old)" -ForegroundColor Yellow
    } else {
        Write-Host "  [*] $file" -ForegroundColor Cyan
        Write-Host "       Status: $status" -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "Files with updates: $($updatesAvailable.Count)"
Write-Host ""

# Prompt for update if not auto-updating
if ($AutoUpdate) {
    $response = "Yes"
} else {
    Write-Host "Would you like to update these files? (Yes/No/Show Details)" -ForegroundColor Cyan
    $response = Read-Host "Your choice"
}

if ($response -eq "Yes" -or $response -eq "Y") {
    Write-Host ""
    Write-Host "Updating files..." -ForegroundColor Green
    
    $updatedCount = 0
    foreach ($update in $updatesAvailable) {
        $file = $update.File
        $templatePath = $update.TemplatePath
        $workspacePath = $update.WorkspacePath
        
        try {
            # Create backup if requested and file exists
            if ($BackupFiles -and (Test-Path $workspacePath)) {
                $backupPath = "$workspacePath.backup"
                Copy-Item $workspacePath $backupPath -Force
                Write-Host "  [OK] $file (backed up to .backup)" -ForegroundColor Green
            } else {
                Write-Host "  [OK] $file" -ForegroundColor Green
            }
            
            # Create directory if needed
            $directory = Split-Path $workspacePath
            if (-not (Test-Path $directory)) {
                New-Item -ItemType Directory -Path $directory -Force | Out-Null
            }
            
            # Copy file
            Copy-Item $templatePath $workspacePath -Force
            $updatedCount++
        } catch {
            Write-Host "  [ERROR] $file - Error: $_" -ForegroundColor Red
        }
    }
    
    Write-Host ""
    Write-Host "[OK] Updated $updatedCount file(s)" -ForegroundColor Green
    Write-Host ""
    Write-Host "Tip: Reload your VS Code window for changes to take effect" -ForegroundColor Cyan
    Write-Host "     Ctrl+Shift+P, then type 'Reload Window'" -ForegroundColor Cyan
    
} elseif ($response -eq "Show Details" -or $response -eq "D") {
    Write-Host ""
    Write-Host "Detailed Change Information:" -ForegroundColor Yellow
    Write-Host ""
    
    foreach ($update in $updatesAvailable) {
        Write-Host "File: $($update.File)" -ForegroundColor Cyan
        Write-Host "  Template: $($update.TemplatePath)"
        Write-Host "  Workspace: $($update.WorkspacePath)"
        
        if ($update.Status -eq "Update Available") {
            Write-Host "  Template LastWriteTime: $($update.LastWriteTime)"
            
            $workspaceFile = Get-Item $update.WorkspacePath -ErrorAction SilentlyContinue
            if ($workspaceFile) {
                Write-Host "  Workspace LastWriteTime: $($workspaceFile.LastWriteTime)"
            }
        }
        Write-Host ""
    }
} else {
    Write-Host "Update cancelled. Your workspace was not modified." -ForegroundColor Yellow
}

# ==================== CLEANUP ====================
# Clean up temporary GitHub clone if used
if ($templateSource.IsTemporary -and (Test-Path $templateSource.TempDir)) {
    Write-Host ""
    Write-Host "Cleaning up temporary files..." -ForegroundColor Gray
    try {
        Remove-Item $templateSource.TempDir -Recurse -Force -ErrorAction SilentlyContinue
        Write-Host "[OK] Temporary files cleaned up" -ForegroundColor Gray
    } catch {
        Write-Host "[WARN] Could not clean up temp directory: $_" -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "Template source used: $($templateSource.Source)" -ForegroundColor Cyan
Write-Host ""
