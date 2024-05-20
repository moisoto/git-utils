#!/bin/zsh    

echo "This will undo any uncommited changes to files."
read -q "REPLY?Do you want to continue? (y/n): "
echo  # move to a new line
if [[ ! "$REPLY" =~ ^[Yy]$ ]] ; then
   echo "Aborting..."
   exit
fi
echo "Dropping changes..."
git stash && git stash drop
