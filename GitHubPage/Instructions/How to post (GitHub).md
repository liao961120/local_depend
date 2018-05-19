# GitHub Page Posts

## Head
### YAML setup
```
---
layout: post
title:
key: 20171121
tags:
- Markdown
---
```

### Equation Numbering

Set `mathjax2: true` in the post/page yaml to enable equation auto-numbering.

### Lines previewed on home page
Add the code `<!--more-->` to your .md post, and the lines above this code could be seen on the home page.

### Change Markdown Links
#### Images
You have to put all images you want to display in a .md post in `<username>.github.io/assets/images/`. Then change the path in your .md post like the code below:
```md
![]({{ "/assets/images/<image name>.png" | absolute_url }})
```