[<< Back](README.md)

# Redirection
Redirect Stdin and Stdout to another process or file like pipe

## Stdin
```bash
$ [command] < Stdin
```

search in app.js with [grep](https://github.com/alikadir/linux-unix-server-and-macos-local-management/edit/main/file-directory-management.md#search-any-text-in-file-or-files-in-folder)
```bash
$ grep "console.log" < app.js 
```
search in text
```bash
$ grep "ali" <<< "ali kadir bagcioglu"
```
search in command stdout
```bash
$ grep "number" < <(man grep)
```

## Stdout
```bash
$ [command] > Stdout (file create)
```
```bash
$ [command] >> Stdin (file append)
```
