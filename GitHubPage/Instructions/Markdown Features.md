# Posting with Markdown on GitHub Pages (or Hugo)

## Some Common Posting Syntax 

`<!--more-->`

## Features

### Open Link in new tab (kramdown only)

```md
[Link](url){:target="_blank"}
```
opens link in new tab.

### Heading Reference

```md
[Link text](#heading-of-markdown)
```

For example, `[Foot](#footnotes)` links to the **Footnotes** section ([Foot](#footnotes)).

#### Multibite Characters (Work only for html_document)

For Multibite Characters, add `{#identifier}` next to the heading, and use `[Link text](#identifier)` to reference the section. e.g. [Displaying liquid tag](#identifier)



### Equation Reference (MathJax required)

Add `\label{eq:name}` in the `$$` tags give the equation identifiers. Use `$\eqref{eq:name}$` to reference the labled equation.

Note the dependency of this feature on MathJax support. Read [this post](https://liao961120.github.io/2018/01/27/mathjax.html) for details.

### Footnotes
- kramdown and Blackfriday

```md
texttextext [^1]
[^1]: this will be displayed at bottom
```

Click ^**1**^ at the ending of this line of text to read foot notes[^1].

## Warnings: GitHub Pages

### Display Raw Liquid Tags

Becareful of raw (non-functional) liquid tags (or anything that looks alike) in the posts, it might lead to page build error when using Jekyll. And even when the tags appears in the code chunks, it **won't be displayed like this**: `{% if page.mathjax == true %}`, and will still lead to page build error.

If you want to display raw liquid tags **as contents** in your posts, put the raw liquid tag between `{% raw %}` and `{% endraw %}`. If you want them **in code chunks**, wrap the whole thing (including `{% raw %}` and `{% endraw %}`) in the code fences, so the thing in the code fences looks like:

#### Displaying liquid tag in code chunks{#identifier}
```
{% raw %}<raw liquid tags wanted to display>{% endraw %}
```








[^1]: This is footnote
