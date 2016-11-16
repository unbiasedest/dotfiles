if exists("b:did_context_synctex_plugin")
    finish
endif
let b:did_context_synctex_plugin = 1

function! SynctexShow()
    let synctex = glob("*.synctex.gz")
    if strlen(synctex) == 0
        echo "no synctex file found"
    else
        let pdffile = substitute(synctex,"synctex.gz","pdf","")
        let execline = printf(":!okular --unique '%s#src:%d %s'", shellescape(pdffile), line("."),shellescape(bufname("%")))
        exec execline
    end
endfunction

map <buffer> <leader>v :call SynctexShow()<Enter><Enter>