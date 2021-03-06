#!/bin/bash
# https://github.com/janis-rullis/shell-scripts

# Do a complete docker cleanup if there is only 1 dockerized project. Can be set - `./setup.sh 1`.
ONLY_PROJECT=false
if [[ -n $1 ]]; then
  ONLY_PROJECT=true
fi

function init() {
  # TODO: Add some notification about causes when executed multiple times.

  echo "Define error reporting level, file seperator, and init direcotry."
  set -e # set -o xtrace;
  # https://unix.stackexchange.com/a/164548 You can preserve newlines in the .env.
  IFS=$''
  DIR=$PWD
  # ROOT_DIR="$(dirname "${DIR}")"
  ENV_FILE=".env"
}

function checkRequirements() {
  echo "Checking if the '.env' file exists ..."

  # #17 https://github.com/janis-rullis/shell-scripts/blob/master/learn-basics/if-conditions.sh#L124
  if [[ ! -r $ENV_FILE ]]; then
    echo "'.env' file is missing!"
    echo -e "* Copy the .env.example to .env.\n* Open .env and fill values in FILL_THIS."
    exit
  fi
}

function stopDocker() {

  echo "Stop any running container from this project"
  docker-compose down --remove-orphans

  if [[ $ONLY_PROJECT = true ]]; then
    echo "Remove any dangling part."
    echo y | docker network prune
    echo y | docker image prune
    echo y | docker volume prune
  fi
}

init
checkRequirements
stopDocker

echo "Setup is completed."
echo "Starting the project.."
echo "If this is the first time then it will download and setup Docker containers."
chmod a+x start.sh
./start.sh