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
### examples 
```bash
$ curl "https://alikadir.com/medical-devices" | jq

{
  "items": [
    {
      "procedureType": "Sale",
      "id": 98309,
      "name": "AKB Xhrex 2-Motor Bed",
      "code": "GCBEB0043",
      "tenants": [
        {
          "id": 52,
          "name": "HomeCare",
          "webId": 1557
        }
      ],
      "prices": []
    },
    {
      "procedureType": "Rental",
      "id": 98356,
      "name": "AKB Xhrex 2-Motor Bed (Rental - 15 days)",
      "code": "GCBEB0043/15",
      "tenants": [
        {
          "id": 52,
          "name": "HomeCare",
          "webId": 1557
        }
      ],
      "prices": []
    },
    {
      "procedureType": "Rental",
      "id": 98399,
      "name": "AKB Xhrex 2-Motor Bed (Rental - 30 days)",
      "code": "GCBEB0043/30",
      "tenants": [
        {
          "id": 52,
          "name": "HomeCare",
          "webId": 1557
        }
      ],
      "prices": []
    },
    {
      "procedureType": "Sale",
      "id": 98308,
      "name": "AKB Xhrex 3-Motor Bed (Dolsan)",
      "code": "GCBEB0042",
      "tenants": [
        {
          "id": 2,
          "name": "Memorial Center",
          "webId": 0
        },
        {
          "id": 52,
          "name": "HomeCare",
          "webId": 1557
        }
      ],
      "prices": [
        {
          "tenantId": 52,
          "price": 0,
          "vatFreePrice": 0,
          "hospitalWebId": 1557
        }
      ]
    }
  ],
  "resultCode": 0,
  "resultMessage": ""
}
```
```bash
$ curl "https://alikadir.com/medical-devices" | jq '.items[].name'

"AKB Xhrex 2-Motor Bed"
"AKB Xhrex 2-Motor Bed (Rental - 15 days)"
"AKB Xhrex 2-Motor Bed (Rental - 30 days)"
"AKB Xhrex 3-Motor Bed (Dolsan)"
```
