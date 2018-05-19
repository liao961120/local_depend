## Formatting
- insert space: `~`, `\,` or `\hspace{1.5 mm}`
- Bold face math: `\mathbf{}`, `\bm`(with package), `\boldsymbol`
- Cursive $\ell$: `\ell`

Page Behavior
--------------------------------------
Suppress page nemuber: `\pagenumbering{gobble}`

Switch on page number: `\pagenumbering{arabic}`[^num_format]

New page: `\newpage`

[^num_format]: `{alph}`, `{Alph}`, `{roman}`, `{Roman}` for lowercase/uppercase alphabet, lowercase/uppercase roman numbering, respectively.


Mathematics
---------------------------------

### Notations
- Nearly equal $\approx$: `\approx`
- Equivalent $\equiv$: `\equiv`
- less equil $\leq$: `\leq`
- greater equil $\geq$: `\geq`

### Long Equations (Align)

```latex
\begin{equation}
\begin{split}
y &= (a-x)(b+x)(c-x)(d+x) \\
&= [ab + (a - b)x + x^2 ][cb + (c-d)x + x^2 ] \\
&= 0
\end{split}
(\#eq:ref-key)
\end{equation}
```

Do not wrap equations (i.e. `\begin{equation} ... \end{equation}`) with dollar signs `$`.

`(\#eq:ref-key)` is only supported in bookdown(`bookdown::html_document2`, `bookdown::pdf_document2`)

### Matrix

$$
\begin{pmatrix}
11 & 12 & 13 \\
21 & 22 & 23 \\
31 & 32 & 33
\end{pmatrix}
$$

```latex
\begin{pmatrix}
11 & 12 & 13 \\
21 & 22 & 23 \\
31 & 32 & 33
\end{pmatrix}
```

* `{pmatrix}`: 圓括號矩陣
* `{bmatrix}`: 方括號矩陣
* `\\`: new row (line)
* `&`: new column
* `\left(`, `\right)`: round braces
* `\left[`, `\right]`: square braces

### Dots in Matrix
https://tex.stackexchange.com/questions/32217/3-dots-in-matrix

