## Link Abbreviation to programs

```bash
alias <name.the.program>='<path.to.program>'
```

```bash
alias np='/mnt/c/Users/user/Desktop/npp.7.5.4.bin.x64/notepad++.exe'
```
Then I can use `np sometext.txt` to open `sometext.txt` with **notepad++.exe**.

## Navigation

### `ls`
List all files & directories in current working directory.

- `ls -a`: Show hidden files
- `ls -l`: Show more information


## Files/Directories: Basic manipulation 

Read, Print, Create, Copy, Move, Rename, Remove

### Reading Files

- `wc <file.name>`: Word count
    - output: `#(number of lines)   #(number of words)  #(number of Characters) <file.name>`

- `cat <file.name>`: Print the file to the console

- `less <file.name>`: Read file
    - Navigate with cursor
    - quit with `q`

- `code <file.name>`: Open file with VScode
    - `code` is the name for the app, **VScode**.

### Creating Files

- `mkdir <dir.name>`: Create a directory

- `touch <file.name>`: Create blank file



### Moving & Renaming
`mv` is for moving files/directories around. The syntax is:
```bash
mv <target file/dir> <destin. file/dir>
```

By using different names of the destination file/dir, moving is equivalent to renaming or moving and renaming at the same time.

### Copying

#### Files
```bash
cp <target file> <destin. dir>
```

#### Directories

```bash
cp -r <target dir> <destin. dir>
```


## Wildcard `*`

[Full intro](https://bookdown.org/sean/the-unix-workbench/working-with-unix.html#get-wild), usefull for batch manipulation: manipulate many files once.

- `ls 2017*`: list the files that start with “2017” followed by zero or more of any character
- `ls *.jpg`
- `ls *01.*`: names composed of a sequence of characters, followed by the adjacent characters `01.`, followed by another sequence of characters

### Batch Manipulation

```bash
mv 2017-* 2017/
```

Moves **all files with names that start with `2017-`** to the directory `2017/`

## RegEx

### Search by Characters
```bash
grep "<character.to.search>" <file.name>
```

### Search by MetaCharacters

```bash
egrep "i.g" <file.name>
```

**MetaCharacters**

- `.`: Any character.

- `+`: **1 or more**, e.g. `s+aa` matches 1 or more `s` followed by `aa`.

- `*`: **0 or more**, e.g. `s+aa` matches 0 or more `s` followed by `aa`.

- `{#}`: **Exact #**, e.g. `s{2}` matches strings with exactly 2 `s`(equivalent to `ss`).
	- `{#_1, #_2}`: **Between #_1 & #_2**.

- `(<some.char>)`: Use `(` & `)` to **group**
	- `(na){2}`: matches ba**nana**.
	