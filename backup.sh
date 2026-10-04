#!/bin/bash

<< readme 

This is a script for backup with 5 day rotation 

Usages:
./backup.sh <path to your source> <path to backup folder>

readme

function check_usage {
	echo "Usages: ./backup.sh <path to your source> <path to backup folder>"
}

if [ $# -eq 0 ]; then 
       check_usage
fi

source_dir=$1
timestamp=$(date '+%Y-%m-%d-%H-%M-%S')
backup_dir=$2

function create_backup {
	tar -czf "${backup_dir}/backup_${timestamp}.tar.gz" "${source_dir}" > /dev/null
	
	if [ $? -eq 0 ]; then
		echo "Backup generated successfully for ${timestamp}"
	fi
}

function perform_rotation {
	backups=($(ls -t "${backup_dir}/backup_"*.tar.gz 2>/dev/null))

	if [ "${#backups[@]}" -gt 5 ]; then
		echo "Performing rotation for five days"
		backups_to_remove=("${backups[@]:5}")

		for backup in "${backups_to_remove[@]}";
		do
			rm -f "${backup}"
			echo "Deleted old backup: $backup"
		done
	fi


}

create_backup
perform_rotation
