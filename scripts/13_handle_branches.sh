git branch testing
git branch
git  --no-pager log --all --decorate --oneline --graph

###

git checkout testing
git branch
git  --no-pager log --all --decorate --oneline --graph

###

echo "import matlab.unittest.TestCase
tc = TestCase.forInteractiveUse;
tc.verifyEqual(1+1, 2);
" >> tests.m



### 

git add tests.m
git commit -m "init commit for tests"


###

git  --no-pager log --all --decorate --oneline --graph

###

git checkout master
ls
git  --no-pager log --all --decorate --oneline --graph

###

git merge testing
git  --no-pager log --all --decorate --oneline --graph

###

