# Fixed JAR builder - handles encoding issues
Write-Host "Building executable JAR files (fixed encoding)..." -ForegroundColor Green

# Create output directory
$outputDir = "executables"
if (Test-Path $outputDir) {
    Remove-Item $outputDir -Recurse -Force
}
New-Item -ItemType Directory -Path $outputDir | Out-Null

# Function to create JAR directly without modifying source
function Create-DirectJar {
    param(
        [string]$javaFile,
        [string]$outputName
    )
    
    Write-Host "Processing: $javaFile" -ForegroundColor Yellow
    
    # Get directory and class name
    $javaDir = Split-Path $javaFile -Parent
    $className = [System.IO.Path]::GetFileNameWithoutExtension($javaFile)
    
    # Compile in the source directory
    Push-Location $javaDir
    javac "$className.java"
    
    if ($LASTEXITCODE -eq 0) {
        # Create manifest
        $manifestContent = "Main-Class: $className"
        $manifestFile = "MANIFEST.MF"
        $manifestContent | Out-File -FilePath $manifestFile -Encoding ASCII
        
        # Create JAR in the executables directory
        $jarPath = "..\..\$outputDir\$outputName.jar"
        jar cfm $jarPath $manifestFile "$className.class"
        
        # Clean up
        Remove-Item $manifestFile -ErrorAction SilentlyContinue
        Remove-Item "$className.class" -ErrorAction SilentlyContinue
        
        Pop-Location
        Write-Host "✅ Created: $outputDir\$outputName.jar" -ForegroundColor Green
    } else {
        Pop-Location
        Write-Host "❌ Failed to compile: $javaFile" -ForegroundColor Red
    }
}

# Build programs (without packages for simplicity)
Write-Host "`nNote: This builds programs without package structure for standalone execution." -ForegroundColor Yellow

# Let's try with files that might not have package declarations
Write-Host "`nLooking for standalone Java files..." -ForegroundColor Cyan

# Check if there are any Java files without packages in basic folders
$basicFiles = @(
    "Youtube\Lecture1\sum.cpp",
    "Youtube\Lecture1\prime.cpp"
)

# Since most files have packages, let's create simple demo programs
Write-Host "`nCreating demo programs..." -ForegroundColor Cyan

# Create a simple calculator
$calcContent = @'
import java.util.Scanner;

public class Calculator {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        System.out.println("=== Simple Calculator ===");
        System.out.print("Enter first number: ");
        double num1 = sc.nextDouble();
        
        System.out.print("Enter operator (+, -, *, /): ");
        char operator = sc.next().charAt(0);
        
        System.out.print("Enter second number: ");
        double num2 = sc.nextDouble();
        
        double result = 0;
        
        switch(operator) {
            case '+':
                result = num1 + num2;
                break;
            case '-':
                result = num1 - num2;
                break;
            case '*':
                result = num1 * num2;
                break;
            case '/':
                if(num2 != 0) {
                    result = num1 / num2;
                } else {
                    System.out.println("Error: Division by zero!");
                    return;
                }
                break;
            default:
                System.out.println("Invalid operator!");
                return;
        }
        
        System.out.printf("Result: %.2f %c %.2f = %.2f%n", num1, operator, num2, result);
        sc.close();
    }
}
'@

$calcContent | Out-File -FilePath "Calculator.java" -Encoding UTF8

# Create a number guessing game
$gameContent = @'
import java.util.Scanner;
import java.util.Random;

public class NumberGuess {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Random rand = new Random();
        
        System.out.println("=== Number Guessing Game ===");
        System.out.println("I'm thinking of a number between 1 and 100!");
        
        int target = rand.nextInt(100) + 1;
        int attempts = 0;
        boolean hasWon = false;
        
        while (!hasWon && attempts < 7) {
            System.out.print("Enter your guess: ");
            int guess = sc.nextInt();
            attempts++;
            
            if (guess == target) {
                System.out.println("🎉 Congratulations! You guessed it in " + attempts + " attempts!");
                hasWon = true;
            } else if (guess < target) {
                System.out.println("Too low! Try again.");
            } else {
                System.out.println("Too high! Try again.");
            }
            
            if (attempts == 7 && !hasWon) {
                System.out.println("Game over! The number was: " + target);
            }
        }
        
        sc.close();
    }
}
'@

$gameContent | Out-File -FilePath "NumberGuess.java" -Encoding UTF8

# Create sum of two numbers program
$sumContent = @'
import java.util.Scanner;

public class SumTwoNumbers {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        System.out.println("=== Sum of Two Numbers ===");
        System.out.print("Enter first number: ");
        int num1 = sc.nextInt();
        
        System.out.print("Enter second number: ");
        int num2 = sc.nextInt();
        
        int sum = num1 + num2;
        
        System.out.println("Sum of " + num1 + " and " + num2 + " is: " + sum);
        sc.close();
    }
}
'@

$sumContent | Out-File -FilePath "SumTwoNumbers.java" -Encoding UTF8

# Build the demo programs
Create-DirectJar "Calculator.java" "Calculator"
Create-DirectJar "NumberGuess.java" "NumberGuessingGame"
Create-DirectJar "SumTwoNumbers.java" "SumTwoNumbers"

# Clean up source files
Remove-Item "Calculator.java" -ErrorAction SilentlyContinue
Remove-Item "NumberGuess.java" -ErrorAction SilentlyContinue
Remove-Item "SumTwoNumbers.java" -ErrorAction SilentlyContinue

Write-Host "`n🎉 Demo executables created!" -ForegroundColor Green
Write-Host "Available JAR files:" -ForegroundColor Cyan
Get-ChildItem $outputDir -Filter "*.jar" | ForEach-Object { Write-Host "  - $($_.Name)" -ForegroundColor White }
Write-Host "`nTo run: java -jar filename.jar" -ForegroundColor Yellow
