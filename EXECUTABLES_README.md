# DSA Programs - Executable Releases

This repository provides executable versions of Data Structures and Algorithms programs for easy testing and demonstration.

## 📦 Available Programs

### Array Operations
- **FindLargestSmallest.jar** - Find largest and smallest elements
- **LinearSearch.jar** - Search element in array
- **BinarySearch.jar** - Binary search in sorted array
- **BuySellStock.jar** - Stock trading problem
- **KadaneAlgorithm.jar** - Maximum subarray sum

### Sorting Algorithms
- **BubbleSort.jar** - Bubble sort implementation
- **InsertionSort.jar** - Insertion sort algorithm
- **SelectionSort.jar** - Selection sort algorithm

### String Algorithms
- **PalindromeChecker.jar** - Check palindrome strings
- **StringCompression.jar** - Compress strings

## 🚀 How to Run

### Prerequisites
- Java 8 or higher installed
- Command line access

### Running Programs
```bash
# Download any JAR file from releases
# Run with Java
java -jar ProgramName.jar

# Example:
java -jar FindLargestSmallest.jar
```

## 📁 Build Your Own

### Method 1: Build JAR Files
```powershell
# Run the build script
.\build-executables.ps1
```

### Method 2: Build Native Executables (Requires GraalVM)
```powershell
# Install GraalVM first
.\build-native.ps1
```

### Method 3: Create GitHub Release
```powershell
# Create and upload release
.\create-release.ps1 -Version "1.0.0" -ReleaseNotes "Initial release"
```

## 🛠️ Development

### File Structure
```
├── ALPHA5/
│   ├── Array/          # Array programs
│   ├── Sorting/        # Sorting algorithms
│   └── String/         # String programs
├── executables/        # Generated JAR files
└── scripts/           # Build scripts
```

### Adding New Programs
1. Add your Java file to appropriate folder
2. Update `build-executables.ps1` to include new program
3. Run build script
4. Create new release

## 📝 Notes

- All programs are interactive and will prompt for input
- JAR files are platform-independent
- Source code available in respective folders
- Each program includes error handling and validation

## 🤝 Contributing

1. Fork the repository
2. Add your DSA program
3. Update build scripts
4. Create pull request

## 📞 Support

If you encounter any issues:
- Check Java installation: `java -version`
- Ensure JAR file is not corrupted
- Run from command line to see error messages

---
Made with ❤️ for DSA learning
