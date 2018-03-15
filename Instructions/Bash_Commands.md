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