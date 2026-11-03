#Requires -Version 5.1
<#
    Personalises README.md + assets/banner.svg for your GitHub profile.
    Usage:  .\setup.ps1
#>

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $MyInvocation.MyCommand.Path

function Read-Answer {
    param([string]$Prompt, [string]$Default = '')
    $hint = if ($Default) { " [$Default]" } else { '' }
    $value = Read-Host "$Prompt$hint"
    if ([string]::IsNullOrWhiteSpace($value)) { return $Default }
    return $value.Trim()
}

Write-Host ""
Write-Host "  GitHub profile setup" -ForegroundColor Cyan
Write-Host "  --------------------" -ForegroundColor DarkGray

$username   = Read-Answer "GitHub username (required)"
if ([string]::IsNullOrWhiteSpace($username)) {
    Write-Host "A username is required. Nothing was changed." -ForegroundColor Red
    exit 1
}

$fullName   = Read-Answer "Display name" "Your Name"
$email      = Read-Answer "Email" "you@example.com"
$linkedin   = Read-Answer "LinkedIn slug (in/...)" $username
$x          = Read-Answer "X handle" $username
$portfolio  = Read-Answer "Portfolio URL (optional)" ""

# The README already writes the scheme, so store the host only.
if ([string]::IsNullOrWhiteSpace($portfolio)) { $portfolio = "github.com/$username" }
else { $portfolio = $portfolio -replace '^https?://', '' }

$map = [ordered]@{
    'YOUR_USERNAME' = $username
    'Your Name'     = $fullName
    'YOUR_EMAIL'    = $email
    'YOUR_LINKEDIN' = $linkedin
    'YOUR_X'        = $x
    'YOUR_PORTFOLIO' = $portfolio
}

$files = @(
    (Join-Path $root 'README.md'),
    (Join-Path $root 'assets\banner.svg')
)

foreach ($file in $files) {
    if (-not (Test-Path $file)) { continue }
    $text = [System.IO.File]::ReadAllText($file)
    foreach ($key in $map.Keys) {
        $text = $text.Replace($key, $map[$key])
    }
    [System.IO.File]::WriteAllText($file, $text, (New-Object System.Text.UTF8Encoding($false)))
    Write-Host "  updated $([System.IO.Path]::GetFileName($file))" -ForegroundColor Green
}

Write-Host ""
Write-Host "  Remaining placeholders to fill by hand:" -ForegroundColor Yellow
$readme = [System.IO.File]::ReadAllText((Join-Path $root 'README.md'))
$leftover = [regex]::Matches($readme, 'PROJECT_(ONE|TWO|THREE|FOUR)') | ForEach-Object { $_.Value } | Sort-Object -Unique
if ($leftover) { Write-Host ("   - featured repo names: " + ($leftover -join ', ')) }
if ($readme -match 'YOUR_PORTFOLIO') { Write-Host "   - portfolio URL" }
Write-Host ""
Write-Host "  Next: push this folder to a repo named '$username'." -ForegroundColor Cyan
Write-Host "  See SETUP.md for the exact git commands." -ForegroundColor DarkGray
Write-Host ""
