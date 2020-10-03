call plug#begin('~/.local/share/nvim/plugged')

Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'

" NCM2
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-syntax'

call plug#end()

" NerdTree Toggle
map <C-n> :NERDTreeToggle<CR>

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" Normal Vim Settings
syntax on
set number
set relativenumber
set autoindent
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
set paste
