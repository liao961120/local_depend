# **Ubuntu on Windows**

## **Directory Structure**
```
|-- rootfs  
    |-- home 
    |   |-- liao961120
    |
    |-- mnt
        |-- c
```

### `rootfs`

- Root Directory: `/`

- Absolute path: 
```
C:\Users\user\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\LocalState\rootfs
```

### `/home/liao961120`

- Home Directory: `~`

### `/mnt/c`
- Access Windows file in `C:\` 

<br>

## **Set Working Directory** 

```bash
cd /mnt/c/Users/user
```


## **Change Home Directory**

Navigate to: 
```
C:\Users\user\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\LocalState\rootfs\etc\passwd
```

Open it with a text editor, and find the line with:
```
liao961120:x:1000:1000:,,,:/home/liao961120:/bin/bash
```

Change it to:
```
liao961120:x:1000:1000:,,,:/mnt/c/Users/user:/bin/bash
```
