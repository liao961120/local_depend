Search for App cmd name
--------------------------------

```bash
dpkg -l | grep "part_of_app_name"
```

Then check the second column in the output.


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
	
