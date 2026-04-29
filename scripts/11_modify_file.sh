echo "Repo mantainer: Malu" >> README.md

###

git status
git status -s

###

git add README.md
git commit -m "Added mantainers list to README.md"
git status
git status -s

###

echo "print('Hola mundo')" > main.py

###

git add main.py
git status

###

echo -e "import numpy as np\n\nprint('Hola mundo')" > main.py

###

git status
git status -s

###

git --no-pager diff
git --no-pager diff --cached


###

git commit -m "Added main.py with hello world"
git status

###

git --no-pager diff
git --no-pager diff --cached


###
git status
git checkout -- main.py
git status -s