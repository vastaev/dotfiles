#!/usr/bin/env zsh
#

# for debugging
set -x

if [ "$#" -ne 1 ]
then
    echo "Usage:"
    echo "  ./homebrew_backup.sh <backup folder>"
    exit 1
fi

PREFIX=${1}
mkdir -p ${PREFIX}

NUM_TO_KEEP=10
# Remove all but the ${NUM_TO_KEEP} newest Brewfiles in the backup area
# https://stackoverflow.com/a/34862475
(cd ${PREFIX} && ls -tp | grep -v '/$' | tail -n +${NUM_TO_KEEP} | xargs -I {} rm -- {})

# Create the manifest, and move it into the backup location, timestamped with the current time
brew bundle dump
mv Brewfile ${PREFIX}/Brewfile.$(date +%s)

exit 0

