
"Highlight SQL syntax in Powershell double-quote heredocs
"modified from: http://blogs.perl.org/users/ovid/2011/06/syntax-highlight-your-sql-heredocs-in-vim.html
unlet b:current_syntax
syntax include @SQL syntax/sql.vim
syntax region sqlSnip matchgroup=Snip start=+@"+ end=+^"@+ contains=@SQL
highlight link Snip SpecialComment

