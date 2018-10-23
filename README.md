# teeko

A [Prolog][1] implementation of the game [Teeko][2].

### Generating report `.pdf`

Install [LaTeX][3] and [Pandoc][4] and then run
```
pandoc --filter pandoc-citeproc -s report.md -o <filename>.pdf
```
Where `<filename>` is the name of the output PDF to generate.

[1]: https://en.wikipedia.org/wiki/Prolog
[2]: https://en.wikipedia.org/wiki/Teeko
[3]: https://www.latex-project.org/get/
[4]: https://pandoc.org/
