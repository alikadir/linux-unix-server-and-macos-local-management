[<< Back](README.md)

# Basic Bash Commands

## loop
```bash
$ for i in {1..500}; do echo "number: $i"; curl localhost:9090/app;  sleep 1;  done
```
## Sync and Async run
& = run commands as Parallel and Async
```bash
$ command1 & command2
[1] 45973
[2] 47987
```

&& = run commands as Sync and non-Parallel (Sequential). Use && when you want to run the second command only if the first is successful (sequential with condition).
```bash
$ command1 && command2
```
