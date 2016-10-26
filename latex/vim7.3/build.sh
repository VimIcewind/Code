#!bash

## 检查是否有一行以非汉字结束，而它的前一行最后一个字符是汉字
## 存在这样的例外情况，但所有例外情况应该被列出来。这样的情况LaTex
## 会在汉字和英文之间插入一个空格。反之则不会。


## 检查所有的 \begin{xxx}环境后面都带有 commandchars设置，除非它是以
## NoAdjustSpace结尾的版本。

## 检查汉字之后的英文标点，和英文之后的汉字标点

## 检查 \begin{VimVBexcmd} 中的冒号命令行，都需要顶着行首
## \begin{VimVBDisplay} 需要至少有一行是顶格

## 检查冒号命令行上冒号是否省略的统一性

## 检查重复出现的两个汉字，往往是手抖动额外键入的。
## /\([^\x01-\x7f]\{2}\)\1/

## 检查commandchars指定的 Verbatim环境内部出现单独的 \ 或 {
## 其中出现的 \VimSQ{} 或\VimCommand{xx}{} 结构是合法的。
## /^\\begin{\(\w\+\)}.*commandchars\%(\_.\%(^\\end{\1}\)\@!\)\+\%(\\\%(\w\+\)\?\)\@<!{/
## /^\\begin{\(\w\+\)}.*commandchars\>.*\n\%(\_.\%(^\\end{\1}\)\@!\)*\%(\\\%(\w\+\)\?\%({\w\+}\)\?\)\@<!{/

## 一致性：列表式的的 Verbatim内容中，第2,第3..列的位置

## 第22章。 列表对齐

## 验证：Verbatim环境中不能出现单引号？出现单引号，但是在编译前才替换为\VimSQ{}

## 检查 \begin{Vim*} 与 临近的\end{Vim*}是配对的

## 检查 \begin{Vim*} 与 \end{Vim*}之间没有使用裸单引号。

## 检查 遗憾的是  译注
## 原始帮助文件中的List，有以<TAB>开头。也有以3个空格开头

## 检查 \VimCaution中不能出现多个段落？

## 检查英文句点后没有空格

## 所有非蓝色的显示，~结尾的。
## 所有 Special Char, 是否有多余的<>
cp order.tex order_space.tex
sed -i 's#\\input{\([^.]*\)#&_space#' order_space.tex
verbatim="$(sed -n 's#\\DefineVerbatimEnvironment{\([^}]*NoAdjustSpace\)}.*#-v \1#p' order.tex)"

set -x
for i in $(sed -n 's/^\\input{\([^}]*\)}/\1/p' order.tex); do
	python cjkspace.py -d '\VT{}' -e gbk -o "${i%.tex}_space.tex" $verbatim $i
	# 把所有的原始句号替换成\J{。}, 注意不要用sed 来做替换，它会在处理
	# GB2312编码的汉字时，把“病，”中病的后一个字节和逗号的前一个凑在一
	# 起认作句号。它们的代码刚好相同： 
# [zrf@zrfpc Vim_User_Manual_CN] echo '病，开始。' |xxd -g1
# 0000000: b2 a1 a3 ac bf aa ca bc a1 a3 0a                 ...........
	# vim -e -c '%s#\([^{]\|^\)。#\1\\J{。}#g' -c "wq" ${i%.tex}_space.tex
	# 为Verbatim环境中出现的单引号自动替换成\VimSQ{}
	# vim -e -c 'g#^\\begin{VimVB\w*}#,/^\\end{VimVB\w*/s/'"'"'/\\VimSQ{}/g' -c "wq" ${i%.tex}_space.tex
	# 为 \VimVBListNoIndent 之外的所有Verbatim环境，每一行开头加一个<TAB>
	# 考虑到添加<TAB>后很多Box都超出边框，就统一不再添加任何的前辍了
	# vim -e -c 'g#^\\begin{VimVB\%(.\%(ListNoIndent\)\@!\)*}#,/^\\end{VimVB\w*/s/^/\t/g' -c "wq" ${i%.tex}_space.tex
	vim -e -c "so post_trans.vim" ${i%.tex}_space.tex
done
set +x
cmd /c build.bat order_space
mv order_space.pdf "Vim用户手册中文版73.pdf"
rm -f latex_src.zip
rm -f latex_src.piz 
zip -9 latex_src.zip order.tex $(grep 'input{' order.tex | sed 's/.*{//;s/}//') build.bat build.sh inline_goto_column_by_percent_1.png inline_goto_column_by_percent_2.png topicvim.jpg brain_before.png brain_after.png both_vim_emacs_emacs.png both_vim_emacs_vim.png
mv latex_src.zip latex_src.piz
