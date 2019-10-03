# useful-scripts

Some useful scripts.

## Git

1. [Pull script](git/pull.sh) - update multiple repositories from list. List example is [here](git/list_example.txt).

##### Usage:

``` bash
bash git/pull.sh git/list_example.txt

```

2. [Change author](git/change_author.sh) - change the author and committer name and e-mail of multiple commits for all branches and tags (original here - https://stackoverflow.com/a/750182). You should run this script from folder with repository to change. **WARNING! These changes are dangerous because they change git history!**

##### Usage:

``` bash
# Run this script from folder with repository to change.
bash git/change_author.sh WRONG_EMAIL CORRECT_NAME CORRECT_EMAIL
```

## Bash

1. [Tar ssh](bash/ssh_tar.sh) - copy folder via ssh using tar to current folder. It can be useful for copying folder with large amount of files via ssh. It's faster than pure ssh.

##### Usage:

``` bash
bash/ssh_tar.sh user@host /path/to/folder
# or 
bash/ssh_tar.sh user@host -p port /path/to/folder
```
