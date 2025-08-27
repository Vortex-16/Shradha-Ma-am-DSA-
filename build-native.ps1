# Script to create native executables using GraalVM
# First, you need to install GraalVM and native-image

Write-Host "Creating native executables with GraalVM..." -ForegroundColor Green

# Check if GraalVM is installed
if (!(Get-Command "native-image" -ErrorAction SilentlyContinue)) {
    Write-Host "❌ GraalVM native-image not found!" -ForegroundColor Red
    Write-Host "Please install GraalVM and add it to PATH:" -ForegroundColor Yellow
    Write-Host "1. Download GraalVM from: https://www.graalvm.org/downloads/"
    Write-Host "2. Install native-image: gu install native-image"
    Write-Host "3. Add GraalVM/bin to your PATH"
    exit 1
}

# Create output directory
$outputDir = "native-executables"
if (!(Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir
}

# Function to create native executable
function Create-NativeExecutable {
    param(
        [string]$javaFile,
        [string]$className,
        [string]$outputName
    )
    
    Write-Host "Processing: $javaFile" -ForegroundColor Yellow
    
    # Compile Java file
    javac "$javaFile"
    
    if ($LASTEXITCODE -eq 0) {
        $javaDir = Split-Path $javaFile -Parent
        
        # Create native executable
        Push-Location $javaDir
        native-image --no-fallback -cp "." $className "..\..\$outputDir\$outputName"
        Pop-Location
        
        # Clean up class files
        Remove-Item (Join-Path $javaDir "*.class") -ErrorAction SilentlyContinue
        
        Write-Host "✅ Created native executable: $outputName" -ForegroundColor Green
    }
}

# Build native executables for key programs
Create-NativeExecutable "ALPHA5\Array\largest.java" "Array.largest" "largest.exe"
Create-NativeExecutable "ALPHA5\Array\linearSearch.java" "Array.linearSearch" "linearSearch.exe"

Write-Host "`n🎉 Native executables created in 'native-executables' folder!" -ForegroundColor Green
