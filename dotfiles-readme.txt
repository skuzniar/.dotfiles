Setup instructions for tracking configuration in a Git repository. See
https://www.atlassian.com/git/tutorials/dotfiles

1. Create git alias to be used for the special configuration repository.
    alias gitdot='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
 
2. Add folder name to the ignore file.
    echo ".dotfiles" >> .gitignore
 
3. Clone the repository.
    git clone --bare https://github.com/skuzniar/.dotfiles.git $HOME/.dotfiles
 
4. Checkout the content into home directory.
    gitdot checkout

