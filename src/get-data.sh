#!/usr/bin/env bash

# Usage: get-data <url> <file>

# Uses curl to download data of interest from <url>
# and save it to <file>

# Arguments:
#	<url>	A url to a data file to be downloaded.		
# 	<file>	The directory and filename in which to
#			save and name the file respectively.
#			Example: path/to/file.dat

curl -o $2 $1