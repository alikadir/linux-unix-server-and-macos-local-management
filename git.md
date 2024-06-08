[<< Back](README.md)

# Git
[Git](https://git-scm.com) is a free and open source distributed version control system 

## Commit
### Amend Commit 
```bash
$ git add .  #if you want add or change file the previous commit 
$ git commit --amend -m "if you want add new commit message"
```

### Remove Commit 
- ```git revert <CommitID> ``` revert the commit and create new revert commit
- ```git reset --hard <CommitID>``` remove all commits after the CommitID

### Difference 
```bash
$ git diff <StartCommitID>..<EndCommitID> <ifyouwantfilename>
```
Beyond Compare diff and merge tool settings
```
[diff]
  	tool = bcomp
[difftool]
  	prompt = false
[difftool "bcomp"]
  	trustExitCode = true
  	cmd = "/usr/local/bin/bcomp" \"$LOCAL\" \"$REMOTE\"
[merge]
  	tool = bcomp
[mergetool]
  	prompt = false
[mergetool "bcomp"]
  	trustExitCode = true
  	cmd = "/usr/local/bin/bcomp" \"$LOCAL\" \"$REMOTE\" \"$BASE\" \"$MERGED\"
[user]
	name = Ali Kadir Bagcioglu
	email = alikadirbagcioglu@gmail.com
```
```
$ git difftool <StartCommitID>..<EndCommitID> <ifyouwantfilename>
```


### Log
- ```git log``` show all commits of current branch
- ```git log <BranchName>``` show all commits of the branch

### Resolve Conflicts with Sourcetree
- Only once ```Sorucetree > Settings > Diff > External Diff/Merge > Visual Diff Tool and Merge Tool > Beyond Compare```
- Only once ```Beyond Compare Menu > Install Command Line Tools``` 
- ```Sourcetree Menu > Actions > Resolve Conflicts > Launch External Merge Tool```
 
## Cherry-Pick 
- ```git checkout <BranchName>``` first step checkout branch 
- ```git cherry-pick <OtherBranchCommitID>``` second step cherry pick commit on another branch
- Create a commit same message text 
-  ========== Normally Done =========== But if a conflict occurs see the following lines
- if a conflict occurs then resolve the conflict as third step (if conflicts not changes local file use ```git commit --allow-empty```)
- if any .orig file extension creates after resolve conflicts, remove it because backup file 

```
$ git status
  On branch feature/baz
  You are currently cherry-picking commit d36e7ca. <<<<<<<<<<<<<<<<<====================
    (all conflicts fixed: run "git cherry-pick --continue")
    (use "git cherry-pick --skip" to skip this patch)
    (use "git cherry-pick --abort" to cancel the cherry-pick operation)
```

- fix conflicts and run ```git cherry-pick --continue``` as fourth steps
- optional use ```git cherry-pick --skip``` to skip this patch
- optional use ```git cherry-pick --abort``` to cancel the cherry-pick operation

## Branch
- ```git brach``` list all branchs
- ```git branch <BranchName>``` create new branch but NOT switched the branch
- ```git branch -D <BranchName>``` remove the branch 
- ```git checkout <BranchName>``` switch this branch name
- ```git checkout -b <BranchName>``` create branch and switch the branch
- !!!```git checkout -b <BranchName> <SpecificCommitID>``` create branch from specific commit id and switch the branch


## Stash
- ```git stash``` or ```git stash create``` create stash and all uncommited files move to stash
- ```git stash list``` list all stash
- ```git stash apply <StashID>``` apply this ID to Working Director on current branch
- ```git stash apply``` apply last stash id
- ```git stash pop``` apply last stash id and remove the stash id from stash list
- ```git stash clear``` remove all stash ids from stash list 

## Tags  
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

## Another User Problem
```bash
$ git config --global user.email "alikadirbagcioglu@gmail.com"
$ git config --global user.name "Ali Kadir Bagcioglu"
```
