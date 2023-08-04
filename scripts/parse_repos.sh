#!/bin/bash
# ls \
#     | xargs cd \
#     | git config --get remote.origin.url \
#     | xargs -I @ yq e '.git_repos += [{"repo":"https://github.com/Fomiller/@","dest":"$HOME/Projects/@"}]' -i $HOME/Projects/ansible-test/inputs.yml \
#     | cd ..
#!/bin/bash

# store the current dir
CUR_DIR=$(pwd)
ANSIBLE_INPUTS_FILE=$HOME/Projects/ansible-test/inputs.yml
EXLUDE_DIR = [".terraform", ".terragrunt-cache", ".vanderbilt", ".practice"]

echo "Finding all git origins..."

# Find all git repositories and get origins
for i in $(find . -name ".git" | cut -c 3-); do
    echo "";

    
    # We have to go to the .git parent directory to call the pull command
    cd "$i";
    cd ..;

    # get origin of git repo
    origin=$(git config --get remote.origin.url);
    echo "$origin"
    
    if [[ "$(pwd)" == *".terragrunt-cache"* || "$(pwd)" == *".practice"* || "$(pwd)" == *".vanderbilt"* ]]; then
        continue
    fi
    # case $(pwd) in 
    #     *"terragrunt-cache"*|*".vanderbilt"*|*".practice") continue;;
    # esac
    
    # set repo and dest to env vars to workaround nested quotes
    repo=$origin \
    dest=$(pwd) \
    yq e '.git_repos += [{"repo":env(repo),"dest":env(dest)}]' -i $ANSIBLE_INPUTS_FILE
            # 
    # lets get back to the CUR_DIR
    cd $CUR_DIR
done

echo "Complete!"
yq e '.git_repos' $ANSIBLE_INPUTS_FILE
