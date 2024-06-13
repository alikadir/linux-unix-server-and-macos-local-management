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
Beyond Compare diff and merge tool settings in ```~/.gitconfig```
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
```
$ git mergetool file.txt
```

### Log
- ```git log``` show all commits of current branch
- ```git log <BranchName>``` show all commits of the branch
- ```git log <BranchName> --oneline``` show all commits of the branch as single lines
- ```git log <BranchName> --graph``` show all commits of the branch as graphic
- ```git log --pretty=format:"%h%x09%s%x09%ad" --date=format-local:'%Y-%m-%d %H:%M:%S'```

### Resolve Conflicts with Sourcetree
- Only once ```Sorucetree > Settings > Diff > External Diff/Merge > Visual Diff Tool and Merge Tool > Beyond Compare```
- Only once ```Beyond Compare Menu > Install Command Line Tools``` 
- ```Sourcetree Menu > Actions > Resolve Conflicts > Launch External Merge Tool```
 
## Cherry-Pick 
- ```git checkout <BranchName>``` first step checkout branch 
- ```git cherry-pick <OtherBranchCommitID>``` second step cherry pick commit on another branch
- Create a commit **same message** text 
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

## Merge 
- ```git checkout main``` 
- ```git merge feature/foo``` integrated all commits from ```feature/foo``` into ```main``` branch
- ```Fast-forward``` iki branchde birinin son commitinde digerinin ilk commit'i basliyorsa merge islemi otomatik olarak fast-forward yapilir. fast-forward merge isleminden sonra merge commit'i olusmaz. commit zamanlari ic ice gecmis ise gene tarihsel olarak eklenir fakat birlestirme icin bir merge commit olusturulur. FastForward varsa merge commit'e gerek kalmamistir ama fastforward durumu yoksa mergecommit ile kodlar son hale getirilir.


  
### Squash Merge
- ```git checkout main``` 
- ```git merge feature/foo --squash``` all commits from ```feature/foo``` combined into single commit to ```main``` branch



## Rebase
- ```git checkout feature/foo```
- ```git rebase main``` integrated all commits from ```main``` into ```feature/foo``` branch as historical
- ============ and Merge ================
- ```git checkout main``` 
- ```git merge feature/foo``` integrated all commits from ```feature/foo``` into ```main``` branch

## Resolve Conflicts

- fix conflicts and then run ```git rebase --continue```
- ```git rebase --skip``` to skip this patch
- ```git rebase --abort``` to check out the original branch
```
➜  LearnGit git:(feature/foo) git rebase main
Auto-merging foo.md
CONFLICT (add/add): Merge conflict in foo.md
error: could not apply c7a399e... Foo 1 - First commit
hint: Resolve all conflicts manually, mark them as resolved with
hint: "git add/rm <conflicted_files>", then run "git rebase --continue".
hint: You can instead skip this commit: run "git rebase --skip".
hint: To abort and get back to the state before "git rebase", run "git rebase --abort".
Could not apply c7a399e... Foo 1 - First commit
➜  LearnGit git:(e5237b4) ✗ git status
interactive rebase in progress; onto e5237b4
Last command done (1 command done):
   pick c7a399e Foo 1 - First commit
Next commands to do (4 remaining commands):
   pick 48703fc Foo 2 - Second commit
   pick 87baea6 Foo 3 - Third commit
  (use "git rebase --edit-todo" to view and edit)
You are currently rebasing branch 'feature/foo' on 'e5237b4'.
  (fix conflicts and then run "git rebase --continue")
  (use "git rebase --skip" to skip this patch)
  (use "git rebase --abort" to check out the original branch)

Unmerged paths:
  (use "git restore --staged <file>..." to unstage)
  (use "git add <file>..." to mark resolution)
	both added:      foo.md

no changes added to commit (use "git add" and/or "git commit -a")
➜  LearnGit git:(e5237b4) ✗ git rebase --continue
foo.md: needs merge
You must edit all merge conflicts and then
mark them as resolved using git add
```
```git mergetool```

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

## Examples
```
===== Github Merge Pull Request =====
Create a merge commit
All commits from this branch will be added to the base branch via a merge commit.

$ git checkout main
$ git merge feature/foo
=====================================

39bf29d (HEAD -> main) Merge branch 'feature/foo'   2024-06-09 12:10:15
93c9dd1 Main 6 - Sixth commit   2024-06-07 16:59:44
0b1e41b (feature/foo) Foo 5 - Fifth commit   2024-06-07 16:17:15
fa12284 Foo 4 - Fourth commit   2024-06-07 16:02:55
2975bc0 Main 5 - Fifth commit   2024-06-07 15:59:08
87baea6 Foo 3 - Third commit    2024-06-07 15:47:25
bf28b1e Main 4 - Fourth commit  2024-06-07 15:46:08
48703fc Foo 2 - Second commit   2024-06-07 15:44:03
c7a399e Foo 1 - First commit    2024-06-07 15:43:14
8e5a6f1 Main 3 - Third commit   2024-06-07 15:40:35
e528c30 Main 2 - Second commit  2024-05-26 10:45:08
d36e7ca Main 1 - First commit   2024-05-26 10:42:34
```

```
===== Github Merge Pull Request =====
Squash and merge
The 5 commits from this branch will be combined into one commit in the base branch.

$ git checkout main
$ git merge feature/foo --squash
=====================================

d02ab58 (HEAD -> main) Merge Foo into Main as Squash   2024-06-09 19:56:17
93c9dd1 Main 6 - Sixth commit   2024-06-07 16:59:44
2975bc0 Main 5 - Fifth commit   2024-06-07 15:59:08
bf28b1e Main 4 - Fourth commit  2024-06-07 15:46:08
8e5a6f1 Main 3 - Third commit   2024-06-07 15:40:35
e528c30 Main 2 - Second commit  2024-05-26 10:45:08
d36e7ca Main 1 - First commit   2024-05-26 10:42:34
```

```
===== Github Merge Pull Request =====
Rebase and merge
The 5 commits from this branch will be rebased and added to the base branch.

$ git checkout feature/foo
$ git rebase main

$ git checkout main
$ git merge feature/foo
=====================================

4c5f772 (HEAD -> main, feature/foo) Foo 5 - Fifth commit   2024-06-07 16:17:15
d442aad Foo 4 - Fourth commit   2024-06-07 16:02:55
e9da15d Foo 3 - Third commit    2024-06-07 15:47:25
0b6b702 Foo 2 - Second commit   2024-06-07 15:44:03
19850d4 Foo 1 - First commit    2024-06-07 15:43:14
93c9dd1 Main 6 - Sixth commit   2024-06-07 16:59:44
2975bc0 Main 5 - Fifth commit   2024-06-07 15:59:08
bf28b1e Main 4 - Fourth commit  2024-06-07 15:46:08
8e5a6f1 Main 3 - Third commit   2024-06-07 15:40:35
e528c30 Main 2 - Second commit  2024-05-26 10:45:08
d36e7ca Main 1 - First commit   2024-05-26 10:42:34
```
```
Rebase Conflict

===================

➜ DenemeApp git:(feature/refactor) git rebase main
Auto-merging src/services/my-healt/index.js
CONFLICT (content): Merge conflict in src/services/my-healt/index.js
Auto-merging src/state/my-healt/my-healt/actions.js
CONFLICT (content): Merge conflict in src/state/my-healt/my-healt/actions.js
Auto-merging src/state/my-healt/my-healt/reducers.js
CONFLICT (content): Merge conflict in src/state/my-healt/my-healt/reducers.js
Auto-merging src/state/my-healt/my-healt/types.js
error: could not apply 0c32dd2... chart system all refactor
hint: Resolve all conflicts manually, mark them as resolved with
hint: "git add/rm <conflicted_files>", then run "git rebase --continue".
hint: You can instead skip this commit: run "git rebase --skip".
hint: To abort and get back to the state before "git rebase", run "git rebase --abort".
Could not apply 0c32dd2... chart system all refactor
```
