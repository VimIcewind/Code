ebb inline_goto_column_by_percent_1.png
ebb inline_goto_column_by_percent_2.png
ebb brain_before.png
ebb brain_after.png
ebb both_vim_emacs_vim.png
ebb both_vim_emacs_emacs.png
ren %1.tex %1_1828.tex
del %1.*
ren %1_1828.tex %1.tex
latex %1.tex
latex %1.tex
gbk2uni %1.out
latex %1.tex
dvipdfmx  %1.dvi
