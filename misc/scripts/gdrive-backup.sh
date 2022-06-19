#!/bin/bash

# By default, backup only the 'Code', 'Desktop' and 'Documents' directories.
# Use the options below to add other (heavier) directories to the backup:
#
# --with-library-dir: Also backup the Library directory
# --with-media-dir: Also backup the Media directory
#

## TODO: Improve impl. Extend target dirs list.

TARGET_DIRS=(Code Desktop Documents)
for arg
do
    case "$arg" in
        --with-library-dir)
            TARGET_DIRS+=( Library )
            ;;
        --with-media-dir)
            TARGET_DIRS+=( Media )
            ;;
        *)
            echo "Only the '--with-library-dir' and '--with-media-dir' options are supported. Aborting.."
            exit 1 ;;
    esac
done

# CryFS:
# Mount the backup directory into an encrypted directory,
# Only the encrypted directory will be pushed to the cloud storage.
# The encryption algorithm is AES-256-GCM.
CRYFS_BASE_DIR=~/Backup.crypt
CRYFS_MOUNT_DIR=~/Backup
mkdir -p $CRYFS_BASE_DIR
mkdir -p $CRYFS_MOUNT_DIR
CRYFS_FRONTEND=noninteractive cryfs $CRYFS_BASE_DIR $CRYFS_MOUNT_DIR

# Recursively copy all wanted files into the backup directory.
# (CryFS automatically syncs these files into the encrypted directory)
for dir in $TARGET_DIRS
do
    echo "Recursively copying backup files into ${CRYFS_MOUNT_DIR}. This step can take several minutes.."
    cp -R ~/$dir $CRYFS_MOUNT_DIR
done

# Push CRYFS_BASE_DIR's contents to the cloud (sync mode).
for dir in $TARGET_DIRS
do
    rclone --drive-client-id=$GDRIVE_CLIENT_ID \
           --drive-client-secret=$GDRIVE_CLIENT_SECRET \
           sync $CRYFS_BASE_DIR GDrive:

    if [ $? -eq 0 ]; then
        echo "Success! Unmounting ${CRYFS_MOUNT_DIR}.."
    else
        echo "Failed to sync changes with the cloud."
        echo "Leaving the ${CRYFS_MOUNT_DIR} directory mounted. Use 'fusermount -u ${CRYFS_MOUNT_DIR}' to unmount it."
        exit 1
    fi
done

# Lastly: unmount the encrypted directory.
fusermount -u $CRYFS_MOUNT_DIR
echo "Done."
