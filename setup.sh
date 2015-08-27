for i in bash_profile gitconfig tmux.conf vim vimrc gitignore; do
	if [ ! -e ~/.$i ]; then
		ln -s $(pwd)/.$i ~/.$i
	fi
done

cd bin
for i in *; do
	if [ ! -e /usr/local/bin/$i ]; then
		sudo ln -s $(pwd)/$i /usr/local/bin/$i
	fi
done

touch ~/.bash_local
