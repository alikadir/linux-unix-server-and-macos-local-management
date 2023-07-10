[<< Back](README.md)

# Git
[Git](https://git-scm.com) is a free and open source distributed version control system 

### Tags  
Tag is very much like a branch that doesn’t change and also it’s just a pointer to a specific commit.

#### Show tag
```bash
$ git tag
```

#### Add tag
```bash
$ git tag 1.0.0 -m 'sample tag message'
```

#### Push tag
```bash
$ git push origin --tags
```

#### Delete tag
```bash
$ git push origin --delete 1.0.0
```
