# Linux based programs
  - Standard input (stdin) -> program -> standard output (stdout)

# linux-commands
    From https://www.udacity.com/course/linux-command-line-basics--ud595

#### `man`
  - manual for commands (ex: `man cat`)
  - `q` to exit

#### glob
  - pattern matching for filenames
  - match jpg and png `*{jpg,png}` or `*jpg *png`
  - `*b` match will all files that end with b
  - [glob cheatsheet](https://github.com/begin/globbing/blob/master/cheatsheet.md)

#### `history`
  - shows recent commands

#### `ctrl+c`
  - exit (interrupt)

#### `ctrl+d`
  - End of File (EOF)
  - Tells program there isn't anymore input coming

#### `ctrl+r`
  - reverse search history (`del` to use command)

#### `cat file1.txt file2.txt`
  - shows text from file, best for small amounts of text. Can concatenate files together

#### `rm`
  - remove (`-r` recursive, removes everything within directory)

#### `mv` or `cp`
  - moving files (`mv fileORdirectory1 fileORdirectory2 destination`)
  - copying to a different directory same as above for `cp`
  - renaming file (`mv filename newfilename`)
  - `cp -r` Ensures that the underlying directory structure of the directory you wish to copy remains intact

#### `cd`
  - change directory
  - without any argument it takes you back to `/home`

#### `mkdir` `rmdir`
  - make directory, remove directory

#### `touch newfilename`
  - creates newfilename

#### `echo`
  - prints to command line

#### `Tab` to autocomplete, `Tab` twice to show all files with the autocompleted name
  - `cat fi` then `Tab` -> `cat file`
  - `Tab` twice and a list of files `file1.txt file2.txt` will show if there is multiple files with the name `file`
  - Works to navigate without using `cd`

#### `wc`
  - word count program (lines, words, bytes, filename)

#### `diff file1.txt file2.txt`
  - shows changes between files
  - angle bracket refers to which file contains the outputted change

#### `sort`
  - sorts input from user, use `ctrl+d` on new line after done inputting to sort

#### `less longfile1.txt`
  - Uses the entire console to display the file
  - [less Cheatsheet](http://sheet.shiar.nl/less)

#### `nano file.txt`
  - Built in editor for Ubuntu