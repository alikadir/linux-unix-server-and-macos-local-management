[<< Back](README.md)

# Zip or Tar or Tar.gz

## Tar
Consolidates all files to be archived in one file (TAR: **"Tape ARchive"**). Actual compression is done by GZIP, on the one .tar file

## Tar vs Tar.gz vs Tar.xz
The file uses Tar as its extension is a normal archived file created using TAR tool whereas TAR.GZ file means a compressed Archived using TAR and Gzip. TAR.XZ file means more efficient compressed Archived using TAR and bzip2.

### Install tar
Tar is included by default in Linux.

### Use tar and tar.gz and tar.xz
-c = creates archive

-f = creates archive with given filename

-z = compresses the tar file using gzip

-j = efficient compresses the tar file using bzip2

```
$ tar cf build.tar ./build
$ tar cfz build.tar.gz ./build
$ tar cfj build.tar.xz ./build
```
-x = extracts the archive

-f = creates archive with given filename
```
$ tar xf build.tar.gz
```

## Zip
Compresses each file individually, then consolidates the individually compressed files in one file

### Install zip
```
$ sudo apt install zip
$ sudo apt install unzip
```
### Use zip
```
$ zip files.zip file1.txt file2.txt file3.txt
```
```
$ unzip files.zip 
```
