#!/bin/bash

display_usage() { 
	echo "This script make folder - resources, and make file - main.adoc \
    in the specified folder or current folder.\n" 
	echo -e "\nUsage:\n $0 [argument1 = specified folder] \n"
    echo "If no specified folder, ask - will it make in current folder?" 
	} 

if [  $# -le 1 ] 
	then 
		display_usage
		exit 1
	fi 

if [[ ( $# == "--help") ||  $# == "-h" ]] 
	then 
		display_usage
		exit 0
	fi 

specifiedDirectory = $1

if [[ -d $specifiedDirectory ]]
    then
        echo "Create resources folder and main.adoc file in this directory - $specifiedDirectory."
        makedir $specifiedDirectory/resources
        touch $specifiedDirectory/main.adoc
        ls -l
    else
        echo "Argument is not directory! Abort script."
        exit 1
fi

if [[ $# -eq 0 ]]
    then
      read -p "Do some magic right here? [Yes or No]" -n 1 -r
      echo # (optional) move to a new line
        if [[ $REPLY =~ ^[Yy]$ ]]
        then
            echo "Create resources folder and main.adoc file in this directory - $PWD."
            makedir $PWD/resources
            touch $PWD/main.adoc
            ls -l
        else
            echo "Abort!"
            exit 0
        fi

    



