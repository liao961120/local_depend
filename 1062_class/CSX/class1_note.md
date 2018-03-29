## VS Code ShortCuts


### Viewing Work
`alt + B`: Open edited html in browser

`alt + tab`: Return to VS code(Pervious)

### Editing
`Ctrl + /`: Comment

`Shift + tab`: Unindent



## HTML Basics

### <head> tag
Contents to communicate with browser.

### <body> tag
Contents to show on the page

### Default html template

`!` + `tab`: Default html template

### Emmit Syntax

`tag{contents}` + `tab`: renders as 
```html
<tag>contents</tag>
```

#### Replicate Tags
`tag{contents}*3` + `tab`: renders as 
```html
<tag>contents</tag>
<tag>contents</tag>
<tag>contents</tag>
```

#### Headers with Level
`h${contents}*3` + `tab`: renders as 
```html
<h1>contents</h1>
<h2>contents</h2>
<h3>contents</h3>
```

#### Tags with ID
`h$#{contents}*3` + `tab`: renders as 
```html
<h1 id="">contents</h1>
<h2 id="">contents</h2>
<h3 id="">contents</h3>
```


#### Tables

`table>th*3+tr>td*3` renders as:
```html
<table>
    <th>Col1</th>
    <th>Col2</th>
    <th>Col3</th>
    <tr>
        <td>r1c1</td>
        <td>r1c2</td>
        <td>r1c3</td>
    </tr>
</table>
```

- `<th>`: Column name
- `<td>`: Table data


## CSS Basics
`em`: Size relative to screen size
`px`: Absolute size as measured by pixel

### padding
```css
p {
    padding: 10px 5px 15px 20px;
}
```
1. top padding: 10px
2. right padding: 5px
3. bottom padding: 15px
4. left padding: 20px
