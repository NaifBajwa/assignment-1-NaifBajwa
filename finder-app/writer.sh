#!/bin/sh

# Check that exactly 2 arguments were provided.
# $1 = full path to the file to create/write
# $2 = string to write into the file
if [ $# -ne 2 ]; then
    echo "Error: expected 2 arguments"
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

# Store arguments in readable variable names.
writefile="$1"
writestr="$2"

# Get the directory path from the full file path.
# Example:
# writefile="/tmp/aesd/assignment1/sample.txt"
# dirname "$writefile" gives "/tmp/aesd/assignment1"
writedir=$(dirname "$writefile")

# Create the directory path if it does not already exist.
# -p means create parent directories as needed and do not fail if they already exist.
mkdir -p "$writedir"

# Check whether mkdir failed.
if [ $? -ne 0 ]; then
    echo "Error: could not create directory path: $writedir"
    exit 1
fi

# Write the string to the file.
# > overwrites the file if it already exists.
# If the file does not exist, it creates it.
echo "$writestr" > "$writefile"

# Check whether writing to the file failed.
if [ $? -ne 0 ]; then
    echo "Error: could not create file: $writefile"
    exit 1
fi

# Exit successfully.
exit 0
