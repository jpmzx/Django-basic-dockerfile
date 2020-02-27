#!/bin/bash

# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

USER_NAME="djangodocker"
GROUP_NAME="pymis"


echo "Starting with user: $USER_NAME"

adduser -s /bin/bash -D $USER_NAME
addgroup $GROUP_NAME

addgroup $USER_NAME $GROUP_NAME

export HOME=/home/$USER_NAME

chmod 770 -R /app/
chown $USER_NAME:$GROUP_NAME -R /app/

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
  else
    exec gosu $USER_NAME:$GROUP_NAME "$@"
fi
