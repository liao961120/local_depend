StartUp (My PC)
------------------------------
```bash
source ~/.bash_profile
win
```

## My `~/.bash_profile`

```bash
alias win='cd /mnt/c/Users/user/'
alias kate="/mnt/c/'Program Files'/Kate/bin/kate.exe"
alias cp_rmd_features='cp /mnt/c/Users/user/GitHubPage/my_R_book/Rmarkdown_features/rmd_features.html /mnt/c/Users/user/GitHubPage/liao961120.github.io/notes'
```

Link Abbreviation to programs
----------------------------------------

Set `alias` in `~/.bash_profile`, where `~` is the home directory of the linux/unix system (I use Ubuntu on Windows currently). `alias` gives a short name for a complicated command, which saves typing.

```bash
alias name='path.to.program'
```

### Text Editor on Windows

```bash
echo "alias kate=\"/mnt/c/'Program Files'/Kate/bin/kate.exe\"" >> ~/.bash_profile
```
Then I can use `kate sometext.txt` to open `sometext.txt` with **kate.exe**(GUI).

Note the backslashes are for escaping `"` since there are two layers of `"` in the command above. The command that prints out in `~./.bash_profile` is:
```bash
alias kate="/mnt/c/'Program Files'/Kate/bin/kate.exe"
```

### Commonly Used Directories
```bash
echo "alias win='cd /mnt/c/Users/user/'" >> ~/.bash_profile
```
By using the above alias, I can type `win` to navigate to `C:\Users\user` on Windows.

Navigation
-----------------------------------------------

### `ls`
List all files & directories in current working directory.

- `ls -a`: Show hidden files
- `ls -l`: Show more information


Files/Directories: Basic manipulation
-------------------------------------------

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

### Print Text in Console to a File
#### To a New File
```bash
echo "Some Text" > NewFile.txt
```

#### Append
In case you want to append text to an exsisting file, use `>>`:
```bash
echo "Appended Text" >> OldFile.txt
```

### Moving & Renaming
`mv` is for moving files/directories around. The syntax is:
```bash
mv target_file/dir destin_file/dir
```

By using different names of the destination file/dir, moving is equivalent to renaming or moving and renaming at the same time.

### Copying

#### Files
```bash
cp target_file destin_dir
```

#### Directories

```bash
cp -r target_dir destin_dir
```


Wildcard `*`
----------------------------------------

[Full intro](https://bookdown.org/sean/the-unix-workbench/working-with-unix.html#get-wild), usefull for batch manipulation: manipulate many files once.

- `ls 2017*`: list the files that start with “2017” followed by zero or more of any character
- `ls *.jpg`
- `ls *01.*`: names composed of a sequence of characters, followed by the adjacent characters `01.`, followed by another sequence of characters

### Batch Manipulation

```bash
mv 2017-* 2017/
```

Moves **all files with names that start with `2017-`** to the directory `2017/`

RegEx
------------------------------------

### Search by Characters
```bash
grep "character.to.search" file.name
```

### Search by MetaCharacters

```bash
egrep "i.g" file.name
```

**MetaCharacters**

- `.`: Any character.

- `+`: **1 or more**, e.g. `s+aa` matches 1 or more `s` followed by `aa`.

- `*`: **0 or more**, e.g. `s+aa` matches 0 or more `s` followed by `aa`.

- `{#}`: **Exact #**, e.g. `s{2}` matches strings with exactly 2 `s`(equivalent to `ss`).
	- `{#_1, #_2}`: **Between #_1 & #_2**.

- `(<some.char>)`: Use `(` & `)` to **group**
	- `(na){2}`: matches ba**nana**.
	
