## Generating report `.pdf`

Install [LaTeX][1] and [Pandoc][2] and then run
```
pandoc --pdf-engine=xelatex --filter pandoc-citeproc -s <report>.md -o <output>.pdf
```
where:
`<report>` is the name of the report text file,
`<output>` is the name of the output PDF file to generate.

[1]: https://www.latex-project.org/get/
[2]: https://pandoc.org/
