# ttescomtemplate
An unofficial template for a thesis report on my university modifed from the Imperial College London PhD Thesis LaTeX Template at Overleaf.



## Instalation
### Prerrequisites

```shell
# dnf -y install texlive-adjustbox texlive-epigraph texlive-sectsty texlive-marvosym texlive-pgfplots texlive-minted texlive-translator texlive-booktabs texlive-minitoc texlive-pdfpages texlive-translator texlive-booktabs texlive-minitoc texlive-pdfpages texlive-hyperref texlive-babel texlive-fontenc texlive inputenc texlive-chngcntr texlive-amsfonts texlive-xcolor texlive-appendix texlive-multicol texlive-enumitem texlive-tikz texlive-kpfonts texlive titlesec texlive-tocloft texlive-float texlive-subcaption texlive-caption texlive-mwe texlive-wrapfig  texlive-csquotes texlive-graphicx texlive verbatim texlive-latexsym texlive-mathchars texlive-array texlive-setspace texlive-pdflscape texlive-multicol texlive-colortbl texlive-mdframed texlive-tabularx texlive-ltablex texlive-glossaries texlive-tikz texlive-pstricks texlive-textpos texlive-xcolor texlive-blindtext texlive-tcolorbox texlive-datetime

```

#### Other packages
##### Python Pygments 
[Python pygments](http://pygments.org/) is a generic syntax highlighter.

```shell
#dnf -y install python3-pygments
```

## Clone
```shell
git clone https://github.com/xavrb/ttescomtemplate
cd ttescomtemplate
```


## Compilation
You can compile the tex as follows:
```shell
pdflatex -synctex=1 -shell-escape -interaction=nonstopmode "TT20xx-yyyy-template".tex
```

The -shell-escape part is important for python pygments.

### Using an IDE
I'd recommend [TexStudio](http://www.texstudio.org/) on Linux, but any other should do the trick.

```shell
#dnf install texstudio
```




This template is based on the [Imperial College London PhD Thesis LaTeX Template](https://www.overleaf.com/latex/templates/imperial-college-london-phd-thesis-latex-template/zfybynnyczhb)



