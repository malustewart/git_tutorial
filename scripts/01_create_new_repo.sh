repo_name="${1:-mynewrepo}"

mkdir -p "$repo_name"
cd "$repo_name"
git init
git status


