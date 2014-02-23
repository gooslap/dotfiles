#!/bin/bash
#
# Installs dotfiles into target location.
#


usage()
{
cat <<-'EOF'
Usage: bash setup.sh install_target

Params:
    install_target: Directory to install the dotfiles. Ideally this
                    should be $HOME.
EOF
}

main()
{
    local install_target=$1

    if [[ -z $install_target ]]; then 
        usage
        exit 1
    fi

    [[ ! -d $install_target ]] \
        && "install_target $install_target is not a directory."

    cp ./bashrc $install_target/.bashrc
    cp ./vimrc $install_target/.vimrc
}

main "$@"
