#!/bin/bash

TARGET_DIRS=" .ssh .gnupg .config .password-store Code Desktop Documents Library Media Backups "

# TODO: Improve

echo "Compressing files into tar archive.."
(cd ~ && tar -cf /tmp/backup.tar `echo $TARGET_DIRS`)
if [ $? -ne 0 ]; then
    echo "Failed to compress files. Aborting.."
    rm -rf /tmp/backup.tar
    exit 1
fi

echo "Encrypting tar archive with gpg key A0E82F96608DFE16.."
gpg -r A0E82F96608DFE16 --encrypt /tmp/backup.tar
if [ $? -ne 0]; then
    echo "Failed to encrypt tar archive. Aborting.."
    rm -rf /tmp/backup.tar
    exit 1
fi

echo "Copying encrypted archive into /media/pietro/Backup/"
sudo cp /tmp/backup.tar.gpg /media/pietro/Backup/
if [ $? -ne 0]; then
    echo "Failed to copy encrypted archive. Aborting.."
    rm -rf /tmp/backup.tar
    exit 1
fi

echo "Success!"
echo "The following files were copied (tree -L 2)"
(cd ~ && tree -L 2 `echo $TARGET_DIRS`)

echo "Removing /tmp/backup.tar"
rm -rf /tmp/backup.tar 

echo "Nothing to do."
