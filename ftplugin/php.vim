" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

" pear install doc.php.net/pman
set keywordprg=pman
