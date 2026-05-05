git checkout -b iss53

### 

echo -e """
print("Hello mundo")

""" >> main.py

###

git add main.py
git commit -m "Translation to english, half done [issue 53]"
git status -s

###

git checkout master
git branch hotfix
git checkout hotfix

###

echo -e """
print("Hola mundo!")

""" >> main.py

###

git add main.py
git commit -m "hotfix: now greeting is happier :)"
git status -s

###

git checkout master
git merge hotfix
git --no-pager --all --decorate --oneline --graph

###
git checkout iss53

### 

echo -e """
print("Hello world")

""" >> main.py

###

git add main.py
git commit -m "Completed english translation [issue 53]"
git status -s

###


git merge iss53
git status


###

cat main.py

### 

echo -e """
print("Hello world!")

""" >> main.py

###

git status

