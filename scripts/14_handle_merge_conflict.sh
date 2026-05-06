git checkout -b iss53

### 

echo "print('Hello Earth')" > main.py

###

git add main.py
git commit -m "Translation to english [issue 53]"
git status -s

###

git checkout master
git branch hotfix
git checkout hotfix

###

echo "print('Hola mundo!')" > main.py

###

git add main.py
git commit -m "hotfix: now greeting is happier :)"
git status -s

###

git checkout master
git merge hotfix
git --no-pager log --all --decorate --oneline --graph

###
git checkout iss53

### 

echo -e "print('Hello world')" > main.py

###

git add main.py
git commit -m "Fix english mistranslation [issue 53]"
git status -s

###

git checkout master
git merge iss53
git status

###

cat main.py

### 

echo -e "print('Hello world!')" > main.py

###

git status

###


git add main.py
git status


### 

git commit -m "Merge branch iss53"

###

git --no-pager log --all --decorate --oneline --graph 

### 

git checkout testing
git merge master

### 

git --no-pager log --all --decorate --oneline --graph 


###

git branch -d iss53
git branch -d hotfix

###

git --no-pager log --all --decorate --oneline --graph 