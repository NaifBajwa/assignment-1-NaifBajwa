#!/bin/sh

# Check that exactly 2 arguments were provided.
# $#: number of arguments passed to the script.
if [ $# -ne 2 ]; then
    echo "Error: expected 2 arguments"
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

# Store the first argument as the directory to search in.
filesdir="$1"

# Store the second argument as the string to search for.
searchstr="$2"

# Check whether filesdir is actually a directory.
# -d checks if the path is a directory.
# ! means NOT.
if [ ! -d "$filesdir" ]; then
    echo "Error: $filesdir does not represent a directory on the filesystem"
    exit 1
fi

# Count all regular files inside filesdir and its subdirectories.
# find "$filesdir" -type f lists all files recursively.
# wc -l counts how many lines were output, i.e. how many files.
num_files=$(find "$filesdir" -type f | wc -l)

# Count all lines that contain searchstr inside filesdir recursively.
# grep -r searches recursively.
# wc -l counts the number of matching lines.
# 2>/dev/null hides grep error messages, for example permission errors.
num_matching_lines=$(grep -r "$searchstr" "$filesdir" 2>/dev/null | wc -l)

# Print the result in the exact format required by the assignment.
echo "The number of files are $num_files and the number of matching lines are $num_matching_lines"

# Exit successfully.
exit 0
