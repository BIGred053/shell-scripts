#!/bin/zsh
# A simple shell script to create a new secret key for a new app and store it in an environment variable
# Can optionally also generate and include a pepper for password hashing

# This script can be used as follows: generate_new_app_secrets.sh <APP_NAME> <PEPPER (optional)>
# If you want a pepper, you can just use that word- the unique app name is important for prefixing env variables

APP_NAME=${1:u}
APP_NAME=${APP_NAME//[-]/_}

export LC_CTYPE=C

if [[ $( printenv | grep "${APP_NAME}_SECRET" ) ]]; then
  echo "Sorry, a secret already exists for that app name!"
else
  echo "export ${APP_NAME}_SECRET=$(cat /dev/urandom | tr -dc '0-9a-zA-Z' | head -c100)" >> ~/.bash_profile
fi;

if [[ ( -n $2 ) ]]; then
  if [[ ( ${2:u} = "PEPPER" ) ]]; then
    if [[ $( printenv | grep "${APP_NAME}_PEPPER" ) ]]; then
      echo "Sorry, that app name already has a pepper"
    else
      echo "export ${APP_NAME}_PEPPER=$(cat /dev/urandom | tr -dc '0-9a-zA-Z' | head -c100)" >> ~/.bash_profile
    fi;
  fi;
fi;