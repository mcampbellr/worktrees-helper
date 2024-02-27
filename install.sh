#!/bin/bash

# Define where to download the script from
SCRIPT_URL="https://raw.githubusercontent.com/mcampbellr/worktrees-helper/HEAD/bin/gwt"
TEMP_DIR=$(mktemp -d)
SCRIPT_NAME="gwt"
FINAL_INSTALL_LOCATION="/usr/local/bin/$SCRIPT_NAME"

# Ensure curl is installed
if ! command -v curl &> /dev/null; then
    echo "curl is required but not installed. Please install curl and try again."
    exit 1
fi

# Download script to temporary location
echo "Downloading $SCRIPT_NAME..."
if ! curl -fsSL "$SCRIPT_URL" -o "$TEMP_DIR/$SCRIPT_NAME"; then
    echo "Failed to download $SCRIPT_NAME from $SCRIPT_URL."
    exit 1
fi

# Move script to final location
echo "Installing $SCRIPT_NAME to $FINAL_INSTALL_LOCATION..."
if [ -w $(dirname "$FINAL_INSTALL_LOCATION") ] || [ "$EUID" -eq 0 ]; then
    mv "$TEMP_DIR/$SCRIPT_NAME" "$FINAL_INSTALL_LOCATION" || {
        echo "Failed to move $SCRIPT_NAME to $FINAL_INSTALL_LOCATION."
        exit 1
    }
else
    sudo mv "$TEMP_DIR/$SCRIPT_NAME" "$FINAL_INSTALL_LOCATION" || {
        echo "Failed to move $SCRIPT_NAME to $FINAL_INSTALL_LOCATION using sudo."
        exit 1
    }
fi

# Make the script executable
chmod +x "$FINAL_INSTALL_LOCATION" || {
    echo "Failed to make $SCRIPT_NAME executable."
    exit 1
}

echo "$SCRIPT_NAME installed successfully. You can now use it by typing '$SCRIPT_NAME' in your terminal."

# Clean up temporary directory
rm -rf "$TEMP_DIR"

