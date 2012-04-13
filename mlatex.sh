pdflatex $1
bibtex $1
pdflatex $1
pdflatex $1
open -a /Applications/Preview.app $1.pdf 
