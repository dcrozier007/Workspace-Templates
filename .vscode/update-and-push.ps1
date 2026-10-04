#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Complete workflow for updating templates and pushing to GitHub

.DESCRIPTION
    1. Shows git status
    2. Stages changes
    3. Prompts for commit message
    4. Commits changes
    5. Pushes to GitHub
    6. Verifies success

.EXAMPLE
    .\.vscode\update-and-push.ps1
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Write-Host "╔═══════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║         Template Update & Push Workflow                      ║" -ForegroundColor Cyan
Write-Host "╚═══════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# Step 1: Status
Write-Host "Step 1: Checking git status..." -ForegroundColor Yellow
$status = git status --porcelain
if ([string]::IsNullOrEmpty($status)) {
    Write-Host "✓ No changes to commit" -ForegroundColor Green
    exit 0
}

Write-Host "✓ Found changes:" -ForegroundColor Green
$status | ForEach-Object { Write-Host "  $_" -ForegroundColor Gray }
Write-Host ""

# Step 2: Stage changes
Write-Host "Step 2: Staging changes..." -ForegroundColor Yellow
git add .
Write-Host "✓ Changes staged" -ForegroundColor Green
Write-Host ""

# Step 3: Commit message
Write-Host "Step 3: Creating commit..." -ForegroundColor Yellow
$message = Read-Host "Enter commit message"
if ([string]::IsNullOrEmpty($message)) {
    $message = "Update: Template files"
}

git commit -m $message
if ($LASTEXITCODE -ne 0) {
    Write-Host "✗ Commit failed" -ForegroundColor Red
    exit 1
}
Write-Host "✓ Commit created" -ForegroundColor Green
Write-Host ""

# Step 4: Push
Write-Host "Step 4: Pushing to GitHub..." -ForegroundColor Yellow
git push
if ($LASTEXITCODE -ne 0) {
    Write-Host "✗ Push failed" -ForegroundColor Red
    exit 1
}
Write-Host "✓ Changes pushed to GitHub" -ForegroundColor Green
Write-Host ""

# Step 5: Verify
Write-Host "Step 5: Verifying push..." -ForegroundColor Yellow
$log = git log -1 --oneline
Write-Host "✓ Latest commit: $log" -ForegroundColor Green
Write-Host ""

Write-Host "╔═══════════════════════════════════════════════════════════════╗" -ForegroundColor Green
Write-Host "║         Update workflow complete!                           ║" -ForegroundColor Green
Write-Host "╚═══════════════════════════════════════════════════════════════╝" -ForegroundColor Green
