#!/usr/bin/env bash

function Update() {
  git fetch origin
  git pull origin master
}

echo "Ready?"
echo "Enter '1' for yes and anything else to Exit"
read -r temp
if [[ ${temp} = "1" ]]; then
  cd "python" || exit
  echo "Pulling Programs from my GitHub"
  echo ""
  Update
  echo ""
  echo "Installing Dependency, please wait!"
  echo ""
  pip install --upgrade pip
  pip install -r requirements.txt
  sleep 3
  bash build.sh
else
    echo ""
    echo "Uh-Huh! Wrong Input"
    echo "Exiting!"
    sleep 2
    clear
    exit
fi
