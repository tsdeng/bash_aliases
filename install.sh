if [ -f ~/.bash_aliases ]; then
    echo "~/.bash_aliases already exists, will do nothing."
    exit
fi
ln -Fs $(pwd)/bash_aliases ~/.bash_aliases

function insert_to_file() {
    CONTENT=$1
    TARGET_FILE=$2
    # -F means fixed string, -x means exactly match whole line. -q means quiet.
    if ! grep -Fxq "$CONTENT" $TARGET_FILE; then
        echo "updating $TARGET_FILE with: $CONTENT"
        # using printf here because BSD's echo does not recognize \n.
        # https://lists.freebsd.org/pipermail/freebsd-questions/2011-December/236645.html
        printf "$CONTENT\n$(cat $TARGET_FILE)" > $TARGET_FILE
    fi
}



if [[ "$OSTYPE" == "darwin"* ]]; then
    # In OSX all shells are logins shells and they all read ~/.bash_profile.
    echo "Your system is OSX, updating ~/.bash_profile to source ~/.bash_aliases"
    insert_to_file 'source ~/.bash_aliases' ~/.bash_profile

elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    # In linux, the recommendation is to put setting in ~/.bashrc(read for
    # non-login shells) and then let ~/.bash_profile(for login shells)
    # source ~/.bashrc.
    echo "Your system is linux-gnu, the .bashrc file should source ~/.bash_aliases automatically."

fi
