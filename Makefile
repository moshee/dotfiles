DOTFILES := \
	~/.bash_profile \
	~/.eslintrc.json \
	~/.gitconfig \
	~/.gitignore \
	~/.tmux.conf \
	~/.vimrc \
	~/.vim

install: $(DOTFILES)

~/.%: ./.%
	ln -fs $(PWD)/$< 
