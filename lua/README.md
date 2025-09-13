# base keymaps
- gg - go to the first line of the file
- shift + g - go the last line of the file
- ctrl + o - go to the previouse cursor location
- ctrl + i - go to the forawrd cursor location
- shift + u - go to forward to the history
- u - go to the backward of the history
- 6[h|j|k|l] - go to 6 line to postion
- ctrl + w - reset search selection
- gv - higlight last higlighted
- ctrl + v - multiline selection, shtift + i - write text, esc - enter the text
- shift + ~ - change the capital of the letter
- ctrl + - go to background, fg in termibal return to nvim
- gx - open url in the browser
- gf - open the file
- shift + j - join the line
- vib - select within (), viB - select within {}, vi" - inside ""
- vab, vaB, va" - with quotes

# "plugins keymaps"
- Comment 
    - gcc - comment the lines 

- telescope
    - ff - find the file
    - fg - find the word
    - fr - find the refence of the object, e.g functions

- go
    - space + r - run the formatting and importing packages

- neotree
    - toggle - space + e
    - toggle focus Neo-tree/Code - space + r (when in Neo-tree, returns to the previously opened file)

- rust
    - space + a - snippets 
    - space + q - log of the error

- markdown 
    - space + mp - show the markdown viewer 

- git
    - <leader> + gc - git commits (telescope)
    - <leader> + gs - git status (telescope)
    - <leader> + gb - git branches (telescope)
    - <leader> + gs - git status (fugitive)
    - <leader> + gb - git blame (fugitive)
    - ]c - next git hunk (gitsigns)
    - [c - prev git hunk (gitsigns)
    - <leader> + hs - stage hunk (gitsigns)
    - <leader> + hr - reset hunk (gitsigns)
    - <leader> + hp - preview hunk (gitsigns)
    - <leader> + do - open diffview
    - <leader> + dc - close diffview
