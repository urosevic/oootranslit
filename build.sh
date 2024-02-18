#!/bin/sh

# Set the path to the source directory.
source_dir="source"

# Set the path to the dist directory.
dist_dir="dist"

# Check if the 'dist' directory exists, and create it if not.
if [ ! -d "$dist_dir" ]; then
  mkdir -p "$dist_dir"
fi

# Change to the source directory.
cd "$source_dir"

# Get the version value from the description.xml file.
version=$(grep -oP '(?<=<version value=")[^"]+' description.xml)

# Set the ZIP filename without path.
zip_filename="OOoTranslit-$version.oxt"

# Zip all files in the source directory to a file named OOoTranslit-VERSION.oxt
zip -9 -X -o -r "../$dist_dir/$zip_filename" . && \
echo "--> Zip file created: $zip_filename" && \
cd "../$dist_dir" && \
# Create an MD5 hash file for the compressed zip archive
md5sum "$zip_filename" > "$zip_filename.md5" && \
echo "--> MD5 hash file created: $zip_filename.md5"
