function! myspacevim#before() abort
    function! s:cargo_task() abort
    if filereadable('Cargo.toml')
        let commands = ['build', 'run', 'test']
        let conf = {}
        for cmd in commands
            call extend(conf, {
                        \ cmd : {
                        \ 'command': 'cargo',
                        \ 'args' : [cmd],
                        \ 'isDetected' : 1,
                        \ 'detectedName' : 'cargo:'
                        \ }
                        \ })
        endfor
        return conf
    else
        return {}
    endif
  endfunction
  call SpaceVim#plugins#tasks#reg_provider(funcref('s:cargo_task'))
endfunction

function! myspacevim#after() abort
  let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
  function! s:cargo_task() abort
    if filereadable('Cargo.toml')
        let commands = ['build', 'run', 'test']
        let conf = {}
        for cmd in commands
            call extend(conf, {
                        \ cmd : {
                        \ 'command': 'cargo',
                        \ 'args' : [cmd],
                        \ 'isDetected' : 1,
                        \ 'detectedName' : 'cargo:'
                        \ }
                        \ })
        endfor
        return conf
    else
        return {}
    endif
  endfunction
  call SpaceVim#plugins#tasks#reg_provider(funcref('s:cargo_task'))
  let g:neomake_tex_enabled_makers = []
  map <F1> :NERDTreeToggle<CR>
  nnoremap <silent> <F3> :call SpaceVim#plugins#runner#open('make')<CR>
  nnoremap <silent> <F4> :call SpaceVim#plugins#runner#open('make run')<CR>
  nnoremap <silent> <F5> :call SpaceVim#plugins#runner#open('make clean')<CR>
  " UltiSnips Snippet keys
  let g:UltiSnipsExpandTrigger = "<Tab>"
  let g:UltiSnipsJumpForwardTrigger = "<Tab>"
  let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"
  nnoremap <leader>U :call UltiSnips#RefreshSnippets()<CR>
  let g:vimtex_quickfix_open_on_warning = 0
  let g:vimtex_quickfix_ignore_filters = [
      \ 'Underfull \\hbox',
      \ 'Overfull \\hbox',
      \ 'LaTeX Warning: .\+ float specifier changed to',
      \ 'LaTeX hooks Warning',
      \ 'Package siunitx Warning: Detected the "physics" package:',
      \ 'Package hyperref Warning: Token not allowed in a PDF string',
      \]
  let g:vimtex_view_skim_sync = 1 
"  let g:vimtex_view_skim_activate = 1
  let g:vimtex_view_method = 'zathura' 
endfunction
