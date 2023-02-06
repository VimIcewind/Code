pdf = hello LaTeX
dvi = hello.dvi LaTeX.dvi

all : ${dvi} ${pdf}

.tex.dvi :
	latex $*.tex
.tex :
	pdflatex $*.tex

clean :
	rm -rf *.gz *.aux *.log *.dvi *.blg *.bbl *.bak *.pdf
