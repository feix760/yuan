if exists('loaded_autospace')
    finish
endif
let loaded_autospace = 1
let enable_autospace = 1

au CursorMovedI * call s:Main()

function! s:GetBufferLen()
    return line2byte(line("$")+1)
endfunction

let s:count =0 
function s:Main()
    let s:count += 1
    echo 'move' s:count
    if !g:enable_autospace
        let b:buffer_len = s:GetBufferLen()
        return
    endif
    if !exists("b:buffer_len")
        let b:buffer_len = s:GetBufferLen()
    endif
    let l:curr_len = s:GetBufferLen()
    let l:diff_len=l:curr_len-b:buffer_len
    if l:diff_len > 0 && l:diff_len <= 3
       call s:TypingHandler()
    endif
    let b:buffer_len = s:GetBufferLen()
endfunction

function s:TypingHandler()
    if &filetype == "javascript"
        call s:JsTypingHandler()
    endif
endfunction

let s:jsVarExp = '[a-zA-Z0-9_\$#@]'

function! s:CursorSubLine(count)
    let l:pos = col('.') - 1
    let l:preStr=strpart(getline('.'), 0, l:pos)
    let l:currLine = line('.')
    if a:count > 0 && l:currLine > 1
        let l:beg = l:currLine - a:count
        let l:end = l:currLine - 1
        if l:beg < 1
            let l:beg = 1
        endif
        let l:lines = getline(l:beg, l:end)
    else
        let l:lines = []
    endif
    call add(l:lines, l:preStr)
    return join(l:lines, "\n")
endfunction

function s:JsTypingHandler()
    let l:pos = col('.') - 1
    let l:preStr=strpart(getline('.'), 0, l:pos)
    let l:note = s:IsInNote()
    if l:note != ''
        if l:note == '"'
            call s:CurrentLineReplace(l:pos - 1, l:pos, '"双')
        endif
        return
    endif
    let l:prev = s:IsPrev(l:preStr, '[；：，。‘’”“？（）！]')
    if strlen(l:prev) > 0
        let l:beg = l:pos - strlen(l:prev)
        let l:rep = printf('%s全角', l:prev)
        call s:CurrentLineReplace(l:beg, l:pos, l:rep)
        return
    endif

    let l:prev = s:IsPrev(l:preStr, '< =\|> =\|= =\|! =\|== =\|& &\|| |\|/ /\|!= =\|+ +\|- -')
    if strlen(l:prev) > 0
        let l:beg = l:pos - strlen(l:prev)
        let l:rep = substitute(l:prev, '\s\+', '', 'g')
        let l:rep = printf('%s ', l:rep)
        call s:CurrentLineReplace(l:beg, l:pos, l:rep)
        return
    endif
    
    let l:exp = printf('%s\([+*%><=&/|?-]\)', s:jsVarExp)
    let l:prev = s:IsPrev(l:preStr, l:exp, 1)
    if strlen(l:prev) > 0
        let l:beg = l:pos - strlen(l:prev)
        let l:rep = printf(' %s ', l:prev)
        call s:CurrentLineReplace(l:beg, l:pos, l:rep)
        return
    endif
    
    let l:prev = s:IsPrev(l:preStr, '[,:]')
    if strlen(l:prev) > 0
        let l:beg = l:pos - strlen(l:prev)
        let l:rep = printf('%s ', l:prev)
        call s:CurrentLineReplace(l:beg, l:pos, l:rep)
        return
    endif
    
    let l:prev = s:IsPrev(l:preStr, '\(\s\|^\)\(if\|while\|switch\|catch\)\((\)', 3)
    if strlen(l:prev) > 0
        let l:beg = l:pos - strlen(l:prev)
        let l:rep = printf(' %s', l:prev)
        call s:CurrentLineReplace(l:beg, l:pos, l:rep)
        return
    endif
    
    let l:prev = s:IsPrev(l:preStr, '\(try\|finaly\|do\|)\)\({\)', 2)
    if strlen(l:prev) > 0
        let l:beg = l:pos - strlen(l:prev)
        let l:rep = printf(' %s', l:prev)
        call s:CurrentLineReplace(l:beg, l:pos, l:rep)
        return
    endif
    
endfunction

function! s:IsInNote()
    let l:prevStr = s:CursorSubLine(0)
    let l:prevText = s:CursorSubLine(100)
    if s:IsPrev(l:prevText, '/\*\([^*]\|\*[^/]\|\*$\)*') != ''
        return '/*'
    endif
    let l:lineIn = '' 
    let l:i = 0
    let l:len = strlen(l:prevText)
    let l:prevCh = ''
    while l:i < l:len
        let l:ch = l:prevText[l:i]
        if l:lineIn != ''
            if l:ch == l:lineIn && l:prevCh != '/'
                let l:lineIn = ''
            endif
        elseif l:ch == '/' && l:prevCh == '/'
            let l:lineIn = '//'
            break
        elseif l:ch == '"' || l:ch == "'"
            let l:lineIn = l:ch
        endif
        let l:prevCh = l:ch
        let l:i += 1
    endwhile
    if l:lineIn != ''
        return l:lineIn
    endif
    if s:IsPrev(l:prevStr, '[(,=]\s*/\([^/\\]\|\\.\|\\$\)*')
        return '/'
    endif
    return ''
endfunction

function s:IsPrev(str, regex, ...)
    let l:regex = printf('\(%s\)$', a:regex)
    let l:match = matchlist(a:str, l:regex)
    if !exists('a:1')
        let l:group = 0
    else
        let l:group = a:1 + 1
    endif
    if empty(l:match)
        return ''
    else 
        return l:match[l:group]
    endif
endfunction

function s:CurrentLineReplace(beg, end, str)
    let l:preLine = getline('.')
    let l:newLine = printf('%s%s%s', strpart(l:preLine, 0, a:beg), a:str, strpart(l:preLine, a:end))
    call setline('.', l:newLine)
    call cursor(line('.'), col('.') + (strlen(a:str) - (a:end - a:beg)))
endfunction


