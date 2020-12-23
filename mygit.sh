# DON'T TOUCH THE IF SENTENCE. Validating the number of parameters. You have to edit nothing
if [ $# -lt 2 ]; then
   echo Invalid number of parameters
   exit 1
fi

# Run a command on the left to check that the folder .git exists
 git rev-parse --is-inside-work-tree &> /dev/null

# DON'T TOUCH THE IF SENTENCE. Validating that we are in a git folder
if [ $? -gt 0 ]; then
   echo Your current folder does not contain a Git repository
   exit 2
fi

# Run a command between `` to get the URL of your remote GitHub repository
url=`git config --get remote.origin.url`


# DON'T TOUCH THE IF SENTENCE. Validating that your repository is synchronized with GitHub
if [ -z "$url" ]; then
   echo No remote URL from GitHub
   exit 3
fi

# Variables to store the arguments
main=$1
new_branch=$2

# Run a command on the left to check out your main/master branch
git checkout main &> /dev/null

# DON'T TOUCH THE IF SENTENCE. Validating the main or master exists
if [ $? -gt 0 ]; then
   echo Your main/master branch does not exist
   exit 4
fi

# Then, continue with the following requirements

git checkout -b $2

mkdir $2

cd $2

touch testfile.txt

git add testfile.txt

MESSAGE="New  branch  called " 
git commit -m MESSAGE

Host github.com HostName github.com User rblaper IdentityFile ~/.ssh/id_ed25519.pub

git push origin $2