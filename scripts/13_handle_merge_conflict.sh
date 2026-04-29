git checkout -b iss53

### 

echo -e """
print("Hello world")

""" >> main.py

###

git add main.py
git commit -m "Translation to english [issue 53]"
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

git merge iss53
git status
