for i in bash_profile gitconfig tmux.conf vim vimrc; do
	ln -s $(pwd)/.$i ~/.$i
done

cd bin
for i in *; do
	sudo ln -s $(pwd)/$i /usr/local/bin/$i
done
