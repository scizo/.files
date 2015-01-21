if exists("g:loaded_maze")
  finish
endif
let g:loaded_maze = 1

augroup maze_file_type
  autocmd!
  autocmd BufNewFile,BufReadPost *.mz setfiletype maze
augroup END

function! Maze_setup()
  nmap <buffer> <up> :call Maze_move_up()<cr>
  nmap <buffer> <down> :call Maze_move_down()<cr>
  nmap <buffer> <left> :call Maze_move_left()<cr>
  nmap <buffer> <right> :call Maze_move_right()<cr>
endfunction

function! Maze_move_up()
  echo ""
  let l:nline = line(".")
  let l:destination = getline(l:nline-1)[col(".")-1]
  if l:destination == " "
    normal k
  end
endfunction

function! Maze_move_down()
  echo ""
  let l:nline = line(".")
  let l:ncol = col(".")
  let l:current = getline(l:nline)[l:ncol-1]
  let l:destination = getline(l:nline+1)[l:ncol-1]
  if l:current != "_" && l:destination != "|"
    normal j
  end
endfunction

function! Maze_move_left()
  echo ""
  let l:ncol = col(".")
  let l:destination = getline(".")[l:ncol-2]
  if l:destination == " " || l:destination == "_"
    normal h
  end
endfunction

function! Maze_move_right()
  echo ""
  let l:ncol = col(".")
  let l:destination = getline(".")[l:ncol]
  if l:destination == " " || l:destination == "_"
    normal l
  end
endfunction

augroup maze_movement
  autocmd!
  autocmd Filetype maze call Maze_setup()
augroup END

augroup mz_file_type
  autocmd!
  autocmd BufNewFile,BufReadPost *.mzz setfiletype mazze
augroup END

function! Mz_setup()
  nmap <buffer> <up> :call Mz_move_up()<cr>
  nmap <buffer> <down> :call Mz_move_down()<cr>
  nmap <buffer> <left> :call Mz_move_left()<cr>
  nmap <buffer> <right> :call Mz_move_right()<cr>
endfunction

function! Mz_move_up()
  echo ""
  let l:nline = line(".")
  let l:destination = getline(l:nline-1)[col(".")-1]
  if l:destination == " "
    normal k
  end
endfunction

function! Mz_move_down()
  echo ""
  let l:nline = line(".")
  let l:destination = getline(l:nline+1)[col(".")-1]
  if l:destination == " "
    normal j
  end
endfunction

function! Mz_move_left()
  echo ""
  let l:nline = line(".")
  let l:destination = getline(l:nline)[col(".")-2]
  if l:destination == " "
    normal h
  end
endfunction

function! Mz_move_right()
  echo ""
  let l:nline = line(".")
  let l:destination = getline(l:nline)[col(".")]
  if l:destination == " "
    normal l
  end
endfunction

augroup mz_movement
  autocmd!
  autocmd Filetype mazze call Mz_setup()
augroup END
