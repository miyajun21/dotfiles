DOTFILES_EXCLUDES := .DS_Store .git .gitmodules .travis.yml
DOTFILES_TARGET   := $(wildcard .??*) bin
DOTFILES_DIR      := $(PWD)
DOTFILES_FILES    := $(filter-out $(DOTFILES_EXCLUDES), $(DOTFILES_TARGET))
LOCAL_DIR         := local

deploy:
	@echo 'Start deploy dotfiles current directory.'
	@echo 'If this is "dotdir", curretly it is ignored and copy your hand.'
	@echo ''
	@$(foreach val, $(DOTFILES_FILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

deploy_dev: deploy
	ln -sfnv $(PWD)/$(LOCAL_DIR)/.zshrc_local_dev $(HOME)/.zshrc_local
	ln -sfnv $(PWD)/$(LOCAL_DIR)/.vimrc_dev       $(HOME)/.vimrc_local
	ln -sfnv $(PWD)/.vim/colors/                  $(HOME)/.vim/colors

deploy_miniy: deploy
	ln -sfnv $(PWD)/$(LOCAL_DIR)/.zshrc_local_miniy $(HOME)/.zshrc_local

deploy_beta: deploy
	ln -sfnv $(PWD)/$(LOCAL_DIR)/.zshrc_local_beta $(HOME)/.zshrc_local
