for i in bash_profile gitconfig tmux.conf vim vimrc; do
	ln -s .$i ~/.$i
done

cd bin
for i in *; do
	ln -s $i /usr/local/bin/$i
done
