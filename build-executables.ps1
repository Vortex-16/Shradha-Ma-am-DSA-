# PowerShell script to create executable JAR files from Java programs
# This will compile Java files and create executable JARs for GitHub releases

Write-Host "Building executable JAR files for DSA programs..." -ForegroundColor Green

# Create output directory for executables
$outputDir = "executables"
if (!(Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir
}

# Function to create executable JAR
function Create-ExecutableJar {
    param(
        [string]$javaFile,
        [string]$className,
        [string]$outputName
    )
    
    Write-Host "Processing: $javaFile" -ForegroundColor Yellow
    
    # Get the directory of the Java file and the base directory
    $javaDir = Split-Path $javaFile -Parent
    $baseDir = "ALPHA5"  # Base directory for compilation
    
    # Compile Java file from the base directory to handle packages properly
    Push-Location $baseDir
    javac "$($javaFile.Replace('ALPHA5\', ''))"
    
    if ($LASTEXITCODE -eq 0) {
        # Create manifest file
        $manifestContent = @"
Main-Class: $className
"@
        $manifestFile = "MANIFEST.MF"
        $manifestContent | Out-File -FilePath $manifestFile -Encoding ASCII
        
        # Create JAR file with all class files
        $jarName = "$outputName.jar"
        $jarPath = "..\$outputDir\$jarName"
        
        jar cfm $jarPath $manifestFile **/*.class
        
        # Clean up
        Remove-Item $manifestFile -ErrorAction SilentlyContinue
        Get-ChildItem -Recurse -Filter "*.class" | Remove-Item
        
        Pop-Location
        Write-Host "✅ Created: $outputDir\$jarName" -ForegroundColor Green
    } else {
        Pop-Location
        Write-Host "❌ Failed to compile: $javaFile" -ForegroundColor Red
    }
}

# Array Programs
Write-Host "`nBuilding Array Programs..." -ForegroundColor Cyan
Create-ExecutableJar "ALPHA5\Array\largest.java" "Array.largest" "FindLargestSmallest"
Create-ExecutableJar "ALPHA5\Array\linearSearch.java" "Array.linearSearch" "LinearSearch"
Create-ExecutableJar "ALPHA5\Array\binary.java" "Array.binary" "BinarySearch"
Create-ExecutableJar "ALPHA5\Array\buySellStock.java" "Array.buySellStock" "BuySellStock"
Create-ExecutableJar "ALPHA5\Array\kadane.java" "Array.kadane" "KadaneAlgorithm"

# Sorting Programs
Write-Host "`nBuilding Sorting Programs..." -ForegroundColor Cyan
Create-ExecutableJar "ALPHA5\Sorting\Bubble.java" "Sorting.Bubble" "BubbleSort"
Create-ExecutableJar "ALPHA5\Sorting\insertion.java" "Sorting.insertion" "InsertionSort"
Create-ExecutableJar "ALPHA5\Sorting\selessctionSort.java" "Sorting.selessctionSort" "SelectionSort"

# String Programs
Write-Host "`nBuilding String Programs..." -ForegroundColor Cyan
Create-ExecutableJar "ALPHA5\String\palindrome.java" "String.palindrome" "PalindromeChecker"
Create-ExecutableJar "ALPHA5\String\compress.java" "String.compress" "StringCompression"

Write-Host "`n🎉 Build completed! Check the 'executables' folder for JAR files." -ForegroundColor Green
Write-Host "To run any JAR file, use: java -jar filename.jar" -ForegroundColor Yellow
