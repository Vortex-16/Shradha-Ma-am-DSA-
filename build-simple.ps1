# Simple JAR builder - removes packages for standalone executables
Write-Host "Building standalone executable JAR files..." -ForegroundColor Green

# Create output directory
$outputDir = "executables"
if (Test-Path $outputDir) {
    Remove-Item $outputDir -Recurse -Force
}
New-Item -ItemType Directory -Path $outputDir | Out-Null

# Function to create standalone JAR
function Create-StandaloneJar {
    param(
        [string]$javaFile,
        [string]$outputName
    )
    
    Write-Host "Processing: $javaFile" -ForegroundColor Yellow
    
    # Read the original file
    $content = Get-Content $javaFile -Raw
    
    # Remove package declaration and adjust imports
    $content = $content -replace "package\s+[^;]+;", ""
    $content = $content -replace "import\s+java\.util\.\*;", "import java.util.*;"
    
    # Get class name from file
    $className = [System.IO.Path]::GetFileNameWithoutExtension($javaFile)
    
    # Create temporary standalone file
    $tempFile = "temp_$className.java"
    $content | Out-File -FilePath $tempFile -Encoding UTF8
    
    # Compile standalone file
    javac $tempFile
    
    if ($LASTEXITCODE -eq 0) {
        # Create manifest
        $manifestContent = "Main-Class: $className"
        $manifestFile = "MANIFEST.MF"
        $manifestContent | Out-File -FilePath $manifestFile -Encoding ASCII
        
        # Create JAR
        $jarName = "$outputName.jar"
        $jarPath = Join-Path $outputDir $jarName
        jar cfm $jarPath $manifestFile "$className.class"
        
        # Clean up
        Remove-Item $manifestFile -ErrorAction SilentlyContinue
        Remove-Item "$className.class" -ErrorAction SilentlyContinue
        Remove-Item $tempFile -ErrorAction SilentlyContinue
        
        Write-Host "✅ Created: $jarPath" -ForegroundColor Green
    } else {
        Write-Host "❌ Failed to compile: $javaFile" -ForegroundColor Red
        Remove-Item $tempFile -ErrorAction SilentlyContinue
    }
}

# Build programs
Write-Host "`nBuilding Array Programs..." -ForegroundColor Cyan
Create-StandaloneJar "ALPHA5\Array\largest.java" "FindLargestSmallest"
Create-StandaloneJar "ALPHA5\Array\linearSearch.java" "LinearSearch"
Create-StandaloneJar "ALPHA5\Array\binary.java" "BinarySearch"
Create-StandaloneJar "ALPHA5\Array\buySellStock.java" "BuySellStock"

Write-Host "`nBuilding Sorting Programs..." -ForegroundColor Cyan
Create-StandaloneJar "ALPHA5\Sorting\Bubble.java" "BubbleSort"
Create-StandaloneJar "ALPHA5\Sorting\insertion.java" "InsertionSort"

Write-Host "`nBuilding String Programs..." -ForegroundColor Cyan
Create-StandaloneJar "ALPHA5\String\palindrome.java" "PalindromeChecker"

Write-Host "`n🎉 Build completed! Check the 'executables' folder." -ForegroundColor Green
Write-Host "To run: java -jar filename.jar" -ForegroundColor Yellow
