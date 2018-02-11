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

- Absolute path: `C:\Users\user\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\LocalState\rootfs`

### `/home/liao961120`

- Home Directory: `~`

### `/mnt/c`
- Access Windows file in `C:\` 

<br>

## **Set Working Directory** 

```bash
cd /mnt/c/Users/user
```

```bash
for foo in (ls bar)
do
  echo $foo
done
```


