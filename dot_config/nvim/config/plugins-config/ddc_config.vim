" Customize global settings

" You must set the pum ui.
call ddc#custom#patch_global('ui', 'pum')

" Use around source.
call ddc#custom#patch_global('sources', ['vim-lsp', 'around'])

" Change source options
call ddc#custom#patch_global('sourceOptions', #{
	\	vim-lsp: #{
	\		matchers: ['matcher_head'],
	\   	mark: 'lsp'
	\	},
	\	around: #{
	\		mark: 'around'
	\	},
	\	_: #{
    \   	matchers: ['matcher_head'],
    \   	sorters: ['sorter_rank'],
	\		converters: ['converter_remove_overlap']
	\	}
    \ })

call ddc#custom#patch_global('sourceParams', #{
	\	around: #{ maxSize: 500 },
	\	ignoreCompleteProvider: v:true
	\ })

" Mappings
inoremap <silent><expr> <TAB>
      \ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
      \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
      \ '<TAB>' : ddc#map#manual_complete()
inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-n>   <Cmd>call pum#map#select_relative(+1)<CR>
inoremap <C-p>   <Cmd>call pum#map#select_relative(-1)<CR>
inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
inoremap <C-e>   <Cmd>call pum#map#cancel()<CR>

" Use ddc.
call ddc#enable()

call popup_preview#enable()

" if you use with vim-lsp, disable vim-lsp's signature help feature
let g:lsp_signature_help_enabled = 0
call signature_help#enable()
