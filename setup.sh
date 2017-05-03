for i in bash_profile gitconfig tmux.conf vim vimrc gitignore eslintrc.json; do
	if [ ! -e ~/.$i ]; then
		ln -fs "$(pwd)/.$i" ~/.$i
	fi
done

SUDO=
case $(uname | tr A-Z a-z) in
	*cygwin*) ;;
	*) SUDO=sudo ;;
esac

cd bin
for i in *; do
	if [ ! -e /usr/local/bin/$i ]; then
		$SUDO ln -fs "$(pwd)/$i" /usr/local/bin/$i
	fi
done

touch ~/.bash_local
