# cheatsheet

## Movement
H - move to top of screen
M - move to middle of screen
L - move to bottom of screen
% - move cursor to matching character
gg - go to the first line of the document
G - go to the last line of the document
5gg or 5G - go to line 5
gd - move to local declaration
gD - move to global declaration
zz - center cursor on screen
Ctrl + e - move screen down one line
Ctrl + y - move screen up one line
Ctrl + d - move cursor and screen down 1/2 page
Ctrl + u - move cursor and screen up 1/2 page

## Insert mode
o - append a new line below the current line
O - append a new line above the current line
ea - insert at the end of the word
Ctrl + t - indent line one shiftwidth during insert mode
Ctrl + d - de-indent line one shiftwidth during insert mode
Ctrl + rx - insert the contents of register x

## Editing
r - replace a single character
R - replace more than one character, until ESC is pressed
J - join line below to the current one with one space in between
gJ - join line below to the current one without space in between
cc - change entire line

## Visual mode
v - start visual mode
V - start linewise visual mode
Ctrl + v - start visual block mode
o - move to other end of marked area
aw - mark a word
ab - mark a block with ()
aB - mark a block with {}
at - mark a block with <>
ib - mark inner block with ()
iB - mark inner block with {}
it - mark inner block with <>
ESC or Ctrl + c - exit visual mode

\> - shift text right
\< - shift text left
y - yank marked text
d - delete marked text
~ - switch case
u - change marked text to lowercase
U - change marked text to uppercase

## Registers
:reg - show registers content
"xy - yank into register x
"xp - paste contents of register x
"+y - yank into the system clipboard register
"+p - paste from the system clipboard register

### Special registers
0 - last yank
" - unnamed register, last delete or yank
% - current file name
\# - alternate file name
\* - clipbaord contents (X11 primary)
\+ - clipboard contents (X11 clipboard)
/ - last search pattern
: - last command line
. - last inserted text
\- - last small (less than a line) delete
= - expression register
_ - black hole register

Note: Registers are stored in ~/.viminfo and will be loaded again on next restart of vim

## Macros
qa - record macro a
q - stop recording macro
@a - run macro a
@@ - rerun last run macro
