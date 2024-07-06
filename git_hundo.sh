#!/bin/zsh    

echo "WARNING!!! This will undo the last commit and reset the working directory and stage area."
echo "This means any changes to files will be reverted! You will lose the changes made on the last commit and any changes after it."
echo "" # Skip a Line
echo "WARNING!!! DO NOT USE THIS COMMAND IF THE COMMIT YOU ARE UNDOING IS ALREADY PUSHED TO A REMOTE!!!"
read -q "REPLY?Do you want to continue? (y/n): "
echo  # move to a new line
if [[ ! "$REPLY" =~ ^[Yy]$ ]] ; then
   echo "Aborting..."
   exit
fi
echo "Dropping changes..."
git reset --hard HEAD~
