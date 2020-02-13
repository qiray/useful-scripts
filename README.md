# useful-scripts

Some useful scripts.

## Git

### [Pull script](git/pull.sh)

Local update multiple repositories from list. List example is [here](bash/list_example.txt).

#### Usage:

``` bash
bash git/pull.sh bash/list_example.txt

```

### [Push script](git/push.sh)

Script for pushing git repository to all it's remotes. If it's called without arguments it pushes current folder. Else it parses filelist like pull script. List example is [here](bash/list_example.txt).

#### Usage:

``` bash
bash git/push.sh bash/list_example.txt
# or
bash git/push.sh

```

### [Change author](git/change_author.sh)

Change the author and committer name and e-mail of multiple commits for all branches and tags (original here - https://stackoverflow.com/a/750182). You should run this script from folder with repository to change. 

**WARNING! These changes are dangerous because they change git history!**

#### Usage:

``` bash
# Run this script from folder with repository to change.
bash git/change_author.sh WRONG_EMAIL CORRECT_NAME CORRECT_EMAIL
```

## Bash

### [Tar ssh](bash/ssh_tar.sh) 

Copy folder via ssh using tar to current folder. It can be useful for copying folder with large amount of files via ssh. It's faster than pure ssh.

#### Usage:

``` bash
bash bash/ssh_tar.sh user@host /path/to/folder
# or 
bash bash/ssh_tar.sh user@host -p port /path/to/folder
```

### [Parse filelist](bash/parse_filelist.sh) 

Parse filelist, call command \$2 for each folder from filelist \$1 and print text \$3 for each folder. List example is [here](bash/list_example.txt).

#### Usage:

``` bash
# to show all directories in file bash/list_example.txt
bash/parse_filelist.sh bash/list_example.txt pwd "Current directory"
```

### [Count words](bash/wc.sh)

Call word count util (wc) for files in directory \$1 with extensions \$2, \$3, \$n etc.

#### Usage:

``` bash
# For example to call wc for C and C++ files and headers (files *.c, *.cpp, *.cxx, *.h, *.hpp, *.hxx) run:
bash/wc.sh . c cpp cxx h hpp hxx
```