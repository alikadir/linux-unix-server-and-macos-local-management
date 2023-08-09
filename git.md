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

#### Add tag at commit id
```bash
$ git tag 1.0.0 -m 'sample message with specific commit' e5e8366151ec07d541e97857b4a1ad03bd2315a8
```

#### Push tag
```bash
$ git push origin --tags
```

#### Delete tag from local
```bash
$ git tag --delete 1.0.0
```

#### Delete tag from remote
```bash
$ git push origin --delete 1.0.0
```

### Another User Problem
```bash
$ git config --global user.email "alikadirbagcioglu@gmail.com"
$ git config --global user.name "Ali Kadir Bagcioglu"
```
