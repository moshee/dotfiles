SUDO=
case $(uname | tr A-Z a-z) in
	*cygwin*) ;;
	*) SUDO=sudo ;;
esac

for i in bash_profile gitconfig tmux.conf vim vimrc gitignore eslintrc.json; do
	if [ ! -e ~/.$i ]; then
		ln -fs "$(pwd)/.$i" ~/.$i
	fi
done

PREFIX=/usr/local

sudo mkdir -p $PREFIX/bin
cd bin
for i in *; do
	if [ ! -e /usr/local/bin/$i ]; then
		$SUDO ln -fs "$(pwd)/$i" $PREFIX/bin/$i
	fi
done

touch ~/.bash_local
