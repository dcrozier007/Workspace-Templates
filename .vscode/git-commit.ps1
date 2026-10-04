#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Interactive git commit for template updates with version tracking

.DESCRIPTION
    Prompts for commit message and creates a git commit of all staged changes
    
.EXAMPLE
    .\.vscode\git-commit.ps1
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Write-Host "╔═══════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║         Template Git Commit                                  ║" -ForegroundColor Cyan
Write-Host "╚═══════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# Show what's being committed
Write-Host "Changes to commit:" -ForegroundColor Yellow
git status --short
Write-Host ""

# Get commit message
$message = Read-Host "Enter commit message"

if ([string]::IsNullOrWhiteSpace($message)) {
    Write-Host "Commit cancelled - no message provided" -ForegroundColor Yellow
    exit 0
}

# Ask for confirmation
$confirm = Read-Host "Proceed with commit? (Y/n)"
if ($confirm -eq "n" -or $confirm -eq "N") {
    Write-Host "Commit cancelled" -ForegroundColor Yellow
    exit 0
}

# Commit
git commit -m $message

if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Commit successful" -ForegroundColor Green
    Write-Host ""
    Write-Host "Next: Run 'Git: Push to GitHub' task or use:" -ForegroundColor Cyan
    Write-Host "  git push" -ForegroundColor Gray
} else {
    Write-Host "✗ Commit failed" -ForegroundColor Red
}
