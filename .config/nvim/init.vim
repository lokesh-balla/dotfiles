call plug#begin('~/.local/share/nvim/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'

"For ncm2"
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
Plug 'ncm2/ncm2-cssomni'
Plug 'ncm2/ncm2-jedi'
Plug 'ObserverOfTime/ncm2-jc2', {'for': ['java', 'jsp']}
Plug 'artur-shaik/vim-javacomplete2', {'for': ['java', 'jsp']}
Plug 'ncm2/ncm2-syntax' | Plug 'Shougo/neco-syntax'
Plug 'ncm2/ncm2-pyclang'
"end ncm2"

call plug#end()


syntax on
set number

map <C-n> :NERDTreeToggle<CR>

let g:dracula_italic = 0
colorscheme dracula
highlight Normal ctermbg=None


" enable ncm2 for all buffers"
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information"
set completeopt=noinsert,menuone,noselect

let g:ncm2_pyclang#library_path = '/usr/lib64/libclang.so.8'

