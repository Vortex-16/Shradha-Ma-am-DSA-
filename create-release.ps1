# GitHub Release Script
# This script creates a GitHub release with your executable files

param(
    [Parameter(Mandatory=$true)]
    [string]$Version,
    [string]$ReleaseNotes = "DSA Programs Release"
)

Write-Host "Creating GitHub Release v$Version..." -ForegroundColor Green

# Check if GitHub CLI is installed
if (!(Get-Command "gh" -ErrorAction SilentlyContinue)) {
    Write-Host "❌ GitHub CLI not found!" -ForegroundColor Red
    Write-Host "Please install GitHub CLI: https://cli.github.com/"
    exit 1
}

# Check if executables exist
if (!(Test-Path "executables")) {
    Write-Host "❌ Executables folder not found!" -ForegroundColor Red
    Write-Host "Run the build script first to create JAR files." -ForegroundColor Yellow
    exit 1
}

# Create release notes
$releaseNotesContent = @"
# DSA Programs Release v$Version

This release contains executable JAR files for various programming demos and utilities.

## 📦 Contents

### Demo Programs
- **SumTwoNumbers.jar** - Calculate sum of two numbers
- **Calculator.jar** - Simple calculator with basic operations (+, -, *, /)
- **NumberGuess.jar** - Number guessing game (1-100)

## 🚀 How to Run

### Prerequisites
- Java 8 or higher installed on your system
- Command line access

### Running Programs
```bash
# Download any JAR file from the release
# Run with Java
java -jar ProgramName.jar

# Examples:
java -jar SumTwoNumbers.jar
java -jar Calculator.jar
java -jar NumberGuess.jar
```

## 📚 Features

### SumTwoNumbers.jar
- Interactive input for two numbers
- Displays the sum result
- Perfect for basic arithmetic demo

### Calculator.jar
- Supports +, -, *, / operations
- Handles division by zero
- Decimal number support
- Error handling for invalid operations

### NumberGuess.jar
- Random number generation (1-100)
- 7 attempts to guess
- High/low hints
- Win/lose scenarios

## 🛠️ Technical Details
- Built with Java
- Standalone JAR files (no external dependencies)
- Cross-platform compatible
- Source code available in repository

$ReleaseNotes
"@

$releaseNotesFile = "release-notes.md"
$releaseNotesContent | Out-File -FilePath $releaseNotesFile -Encoding UTF8

# Create GitHub release
Write-Host "Creating GitHub release..." -ForegroundColor Yellow

$releaseCommand = "gh release create v$Version executables/*.jar --title 'DSA Demo Programs v$Version' --notes-file '$releaseNotesFile'"

try {
    Invoke-Expression $releaseCommand
    Write-Host "✅ GitHub release created successfully!" -ForegroundColor Green
    Write-Host "🔗 Visit your repository's releases page to see the release." -ForegroundColor Cyan
    Write-Host "📁 Release URL: https://github.com/vikashgupta16/Shradha-Ma-am-DSA-/releases" -ForegroundColor Cyan
} catch {
    Write-Host "❌ Failed to create GitHub release: $_" -ForegroundColor Red
    Write-Host "Make sure you're logged in to GitHub CLI: gh auth login" -ForegroundColor Yellow
}

# Clean up
Remove-Item $releaseNotesFile -ErrorAction SilentlyContinue

Write-Host "`nRelease Summary:" -ForegroundColor Cyan
Write-Host "- Version: v$Version" -ForegroundColor White
Write-Host "- Files: $(Get-ChildItem executables/*.jar | Measure-Object | Select-Object -ExpandProperty Count) JAR files" -ForegroundColor White
Write-Host "- Total Size: $([math]::Round((Get-ChildItem executables/*.jar | Measure-Object -Property Length -Sum).Sum / 1KB, 2)) KB" -ForegroundColor White
Write-Host "- Location: GitHub Releases" -ForegroundColor White
