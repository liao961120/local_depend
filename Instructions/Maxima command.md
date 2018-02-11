---
title: Maxima Command
output: 
    html_document:
        toc: true
        toc_float: true
---

## Basic command

open maxima via command line:
```bash
cd <set wd>
\maxima-5.38.1\bin\maxima.bat
```

- Each command ends with: `;` (or `$` for not displaying results) before any command, then \<enter>.

- Refer to the immediately preceding output: `%`

- Abort calculation: `Ctrl + ^`

- Assign value: `:`

- Quit maxima on command line: `quit()`

## Output properties

### Default
Outputs are rational, if irrational, the output is the same as the symbolic input.

`expand (%);`: expand previous output.

`expand (%o10)`: expand **output 10**

`ratsimp (%);`

### Numeric

Adding `numer` after the input shows numeric results.

Example
```maxima
(1+sqrt(2))^5, numer;
``` 
or `%, numer;` for previous output

## Formatting

### Subscript
`alpha[mu];` reders as alpha~mu~ in maxima

### Latex
`tex (alpha[mu]);` renders as `$$\alpha_{\mu}$$` in maxima, which is displayed as 

$$\alpha_{\mu}$$

in markdown (Latex).

## Saving your work

### Working history
`save (filename, name_1, name_2, name_3, …)` saves variables indicated by name_#.

`load (filename)` loads the saved variables back.

### TeX output
`tex (expr/variable, "filename")` creates Latex format in the file (can be set to `.md`).

Use `tex` multiple times with the same "filename" appends new Latex expression to the file in a new line.

## Common numeric notation

`%e`: $e$, exponential

`%i`: $\sqrt{-1}$

`%pi`: $\pi$


## Operators

Scalar multiplication: `*`

Matrix multiplication: `.`

square root: `sqrt(x)`


## Calculus

derivative: `diff(function, variable, times);`, e.g.
```maxima
f: x^3*%e^(k*x)*sin(w*x);
diff(f, x, 2);
```

## Matrix
```maxima
m: entermatrix (3, 3);
```