#!/bin/bash

# Exit on any error
set -e

# inc version and build number , format code , fix lint issues
sh inc.sh

echo "Building..."
fvm flutter build ipa  