#!bash

## ����Ƿ���һ���ԷǺ��ֽ�����������ǰһ�����һ���ַ��Ǻ���
## ��������������������������������Ӧ�ñ��г��������������LaTex
## ���ں��ֺ�Ӣ��֮�����һ���ո񡣷�֮�򲻻ᡣ


## ������е� \begin{xxx}�������涼���� commandchars���ã�����������
## NoAdjustSpace��β�İ汾��

## ��麺��֮���Ӣ�ı�㣬��Ӣ��֮��ĺ��ֱ��

## ��� \begin{VimVBexcmd} �е�ð�������У�����Ҫ��������
## \begin{VimVBDisplay} ��Ҫ������һ���Ƕ���

## ���ð����������ð���Ƿ�ʡ�Ե�ͳһ��

## ����ظ����ֵ��������֣��������ֶ����������ġ�
## /\([^\x01-\x7f]\{2}\)\1/

## ���commandcharsָ���� Verbatim�����ڲ����ֵ����� \ �� {
## ���г��ֵ� \VimSQ{} ��\VimCommand{xx}{} �ṹ�ǺϷ��ġ�
## /^\\begin{\(\w\+\)}.*commandchars\%(\_.\%(^\\end{\1}\)\@!\)\+\%(\\\%(\w\+\)\?\)\@<!{/
## /^\\begin{\(\w\+\)}.*commandchars\>.*\n\%(\_.\%(^\\end{\1}\)\@!\)*\%(\\\%(\w\+\)\?\%({\w\+}\)\?\)\@<!{/

## һ���ԣ��б�ʽ�ĵ� Verbatim�����У���2,��3..�е�λ��

## ��22�¡� �б����

## ��֤��Verbatim�����в��ܳ��ֵ����ţ����ֵ����ţ������ڱ���ǰ���滻Ϊ\VimSQ{}

## ��� \begin{Vim*} �� �ٽ���\end{Vim*}����Ե�

## ��� \begin{Vim*} �� \end{Vim*}֮��û��ʹ���㵥���š�

## ��� �ź�����  ��ע
## ԭʼ�����ļ��е�List������<TAB>��ͷ��Ҳ����3���ո�ͷ

## ��� \VimCaution�в��ܳ��ֶ�����䣿

## ���Ӣ�ľ���û�пո�

## ���з���ɫ����ʾ��~��β�ġ�
## ���� Special Char, �Ƿ��ж����<>
cp order.tex order_space.tex
sed -i 's#\\input{\([^.]*\)#&_space#' order_space.tex
verbatim="$(sed -n 's#\\DefineVerbatimEnvironment{\([^}]*NoAdjustSpace\)}.*#-v \1#p' order.tex)"

set -x
for i in $(sed -n 's/^\\input{\([^}]*\)}/\1/p' order.tex); do
	python cjkspace.py -d '\VT{}' -e gbk -o "${i%.tex}_space.tex" $verbatim $i
	# �����е�ԭʼ����滻��\J{��}, ע�ⲻҪ��sed �����滻�������ڴ���
	# GB2312����ĺ���ʱ���ѡ��������в��ĺ�һ���ֽںͶ��ŵ�ǰһ������һ
	# ��������š����ǵĴ���պ���ͬ�� 
# [zrf@zrfpc Vim_User_Manual_CN] echo '������ʼ��' |xxd -g1
# 0000000: b2 a1 a3 ac bf aa ca bc a1 a3 0a                 ...........
	# vim -e -c '%s#\([^{]\|^\)��#\1\\J{��}#g' -c "wq" ${i%.tex}_space.tex
	# ΪVerbatim�����г��ֵĵ������Զ��滻��\VimSQ{}
	# vim -e -c 'g#^\\begin{VimVB\w*}#,/^\\end{VimVB\w*/s/'"'"'/\\VimSQ{}/g' -c "wq" ${i%.tex}_space.tex
	# Ϊ \VimVBListNoIndent ֮�������Verbatim������ÿһ�п�ͷ��һ��<TAB>
	# ���ǵ����<TAB>��ܶ�Box�������߿򣬾�ͳһ��������κε�ǰ���
	# vim -e -c 'g#^\\begin{VimVB\%(.\%(ListNoIndent\)\@!\)*}#,/^\\end{VimVB\w*/s/^/\t/g' -c "wq" ${i%.tex}_space.tex
	vim -e -c "so post_trans.vim" ${i%.tex}_space.tex
done
set +x
cmd /c build.bat order_space
mv order_space.pdf "Vim�û��ֲ����İ�73.pdf"
rm -f latex_src.zip
rm -f latex_src.piz 
zip -9 latex_src.zip order.tex $(grep 'input{' order.tex | sed 's/.*{//;s/}//') build.bat build.sh inline_goto_column_by_percent_1.png inline_goto_column_by_percent_2.png topicvim.jpg brain_before.png brain_after.png both_vim_emacs_emacs.png both_vim_emacs_vim.png
mv latex_src.zip latex_src.piz
