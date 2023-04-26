#!/bin/bash

if [ "$EUID" != 0 ]
then
  echo "Error: This script must be run as root"
  exit 1
fi

PS3='Please enter your choice: '
options=("Create User" "Create Group" "Create and share directory" "List Secrets" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Create User")
            read -rp "Enter username: " username
            adduser "$username"
            ;;
        "Create Group")
            read -rp "Enter group name: " groupname
            groupadd "$groupname" && echo "Group $groupname with ID $(getent group "$groupname" | awk -F: '{print $3}') successfully created."
            ;;
        "Create and share directory")
            read -rp "Enter directory path: " dirpath
            mkdir -p "$dirpath"
            read -rp "Enter user or group to share with: " sharewith
            sudo chown "$sharewith" "$dirpath"
            sudo chmod -R g+rwx,g+s "$dirpath"
            ;;
        "List Secrets")
            echo "List of created users:"
            cat /etc/passwd
            echo "List of created groups:"
            cat /etc/group
            ;;
        "Quit")
            break
            ;;
        *) echo "Invalid option. Please try again.";;
    esac
done