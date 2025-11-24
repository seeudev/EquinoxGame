#!/bin/bash
# Equinox Game - Compilation Script
# Compiles all Java files and copies assets to output directory

echo "=== Compiling Equinox Game ==="

# Create output directory if it doesn't exist
mkdir -p out

# Compile all Java source files
echo "Compiling Java files..."
find src -name "*.java" -print | xargs javac -d out -cp out

# Check compilation status
if [ $? -eq 0 ]; then
    echo "✓ Compilation successful"
    
    # Copy assets to output directory
    echo "Copying assets..."
    cp -r src/assets out/
    
    if [ $? -eq 0 ]; then
        echo "✓ Assets copied"
        echo ""
        echo "=== Build Complete ==="
        echo "Run the game with: java -cp out com.equinox.game.core.EquinoxGame"
    else
        echo "✗ Failed to copy assets"
        exit 1
    fi
else
    echo "✗ Compilation failed"
    exit 1
fi
