echo "# My New Repository" > README.md
echo In this repository I will put all the code for my project  >> README.md

###

ls -la
cat README.md

###

git status
git status -s

###

git add README.md
git status
git status -s

###

git commit -m "Added README"
git status
git status -s

###

git --no-pager log