[<< Back](README.md)

# JSON

[jq](https://stedolan.github.io/jq/) is a lightweight and flexible command-line JSON processor.

### dowload json as a file 

```bash
$ curl 'https://jsonplaceholder.typicode.com/todos' -o todos.json
```

### json file format 

```bash
$ jq '.' Downloads/jsondata.json > json-formatted.json
```

### select first element of json array 

```bash
$ curl 'https://jsonplaceholder.typicode.com/todos' | jq '.[0]'
```

### map first item 

```bash
$ cat todos.json | jq '.[0] | { baslik: .title, kullanici_id: .userId }'
```

### map all items

```bash
$ cat todos.json | jq '.[] | { baslik: .title, kullanici_id: .userId }'
```
