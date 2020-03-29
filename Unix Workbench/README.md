# [The Unix Workbench](https://click.linksynergy.com/deeplink?id=PtFMiHYfEVk&mid=40328&murl=https%3A%2F%2Fwww.coursera.org%2Flearn%2Funix)

#### `ls -l` long listing
  - If the entry in the first column is a d, then the row in the table corresponds to a directory, otherwise the information in the row corresponds to a file

#### `head -n 5`
  - output the first part of files (usually 10 lines without flag)
  - `-n` flag is the number of lines you want to print out

#### Output redirection and appending
  - Output redirection stores text that would be normally printed to the command line in a text file. You can use output redirection by typing the greater-than sign (>) at the end of a command followed by the name of the new file that will contain the output from the proceeding command.
  - Example: `echo "I'm in the file." > echo-out.txt`

  - You can also append text to the end of a file using two greater-than signs (>>). 
  - Example: `echo "I have been appended." >> echo-out.txt`

#### Search all available commands and their descriptions
  - `apropos editor` to find all avaiable editors
  - `apropos date` to find all available commands related to date

#### Strings
  - Could be a word, a sentence, a book, or a file or folder name. One of the most effective ways to search through strings is to use regular expressions.
  - One of the most popular tools for searching through text files is grep. The simplest use of `grep` requires two arguments: a regular expression and a text file to search.

#### `grep "x" states.txt`
  - In the command above, the first argument to grep is the regular expression "x". The "x" regular expression represents one instance of the letter “x”. Every line of the states.txt file that contains at least one instance of the letter “x” is printed to the console. As you can see New Mexico and Texas are the only two state names that contain the letter “x”.
  - Regular expressions aren’t just limited to searching with characters and strings, the real power of regular expressions come from using metacharacters. Remember that metacharacters are characters that can be used to represent other characters. To take full advantage of all of the metacharacters we should use grep’s cousin `egrep`, which just extends grep’s capabilities.
  - `-n` flag displays the line number that a match occurs

#### `egrep regexHere filename1 filename2` metacharacters
  - `"i.g"` the `.` represents any character
  - quantifiers allow you to specify the number of times a particular regex should appear in a string. For example, `+` represents one or more occurrences of the preceeding expression such as `"s+as"`. `"*"` represents zero or more occurrences of the preceeding expression.
  - `"s{2}"` curly brackets specify an exact number of occurences of an expression. This is equivalent to the regex `"ss"`. `"s{2,3}"` searches between two and three adjacent occurrences of the letter "s"
  - `"(iss){2}"` capturing group `()` is used to search for multiple occurrences of a string.
  - `"(i.{2}){3}"` describes three occurrences of an "i" followd by any two of any character (Example: Mississippi)

#### RegEx describing sets of characters and flags
  - `\w` corresponds to all word characters.
  - `\d` corresponds to all number characters
  - `\s` corresponds to all space characters
  - `-v` flag stands for invert match
  - The capital letters, `\W`, `\D` and `\S` are inverse sets
  - `[aeiou]` specifies chracter sets
  - `[^aeiou]` is the complement of the set. So, match all characters that are not vowels
  - `^M` the caret represents the start of a line
  - `z$` the dollar sign represents the end of line
  - `[a-z]` the hyphen specifies a specific range of characters
  - `-i` flag ignores the letter casing
  - `\` is the escape character 
  - `|` pipe chracter allows us to match either the regex on the left or right
  - `-o` flag extracts the regex from the matching line. Great to use to know number of times the regex comes up

#### `find directoryToSearch -name filename `
  - Find the location of a file or the location of a group of files
  - `-name` flag states we will search by file name
  - Can use regex for `filename` parameter

#### `~/.bash_hitory`
  - Searching your `~/.bash_history` file can be particularly useful if you’re trying to recall a command you’ve used in the past. The `~/.bash_history` file is just a regular text file, so you can search it with grep.

#### `~/.bash_profile` (`~/.profile` on Ubuntu)
  - A list of Unix commands that are run every time we open our terminal, usually with a different command on every line.
  - `bash` will try to execute `~/.bash_profile` or `~/.bash_login` first, but if that doesn't exist, it will execute `~/.profile` which sources `~./bashrc`

#### `~/.bashrc`
  - You will want your aliases to work in interactive shells whether or not they are login shells. Instead, define your aliases in `~/.bashrc` or, better, `~/.bash_aliases` which the default `~/.bashrc` sources
  - One of the most common commands used in `~/.bashrc`, or `~/.bash_aliases`, file is the `alias` command, which creates a shorter name for a command

#### `sdiff`
  - side by side comparison of files

#### `md5sum filename`
  - Compute MD5 hash of a file
  - Can be used to compare copied files to verify they are similar

#### `shasum filename`
  - Compute the SHA-1 hash of a file
  - Also can be used to compare copied files to verify they are similar

#### Pipes 
  - `[program that produces output] | [program uses pipe output as input instead of a file]`
  - `|` allows us to take the output of a command, which would normally be printed to the console, and use it as the input to another command.
  - `cat canada.txt | head -n 5` would print out the first 5 lines of territories of canada rather than all of them
  - `grep [aeiou]$ states.txt | wc -l` list all of the state names that end with a vowel, then we could use wc to count all of the matching state names. The `-l` flag counts all newlines

#### First line of bash file `.sh`
  - Tells the computer which intepreter to use while executing the file
  ```
  #!/usr/bin/bash 
  echo "Hello World"
  ```
  ```
  #!/usr/bin/env python
  print("Hello World")
  ```

#### Installing software using makefile
  1) Download all of the files required for installation into a directory
  2) `cd` into that directory
  3) Run `make`

  - We can create a `makefile` ourselves that create documents automatically
  - `nano makefile` using format:
  `[target]: [dependencies...]
    [commands...]`
  - Commands under a target must be indented or else the make will fail!
  - Commands only run when target doesn't exist at all or dependencies change
  - `make [target]` runs the `makefile` command
  - We can create a rule at the top of our `makefile` called `all` where we can list all of the files that are built by the `makefile`. By adding the `all` target we can simply run `make` without any arguments in order to build all of the targets in the `makefile`.
  - `all: [targets...]`

#### Math with Bash Scripts
  - Within `math.sh`, `expr 5 \* 2`, notice we must escape the `*` or else bash thinks we are creating a regex!
  - `bash` does integer division by default
  - `bash math.sh` runs the bash script
  - `bc -l` bench calculator program with `-l` flag used to use decimal numbers in calculations
  - `echo "4.2 * 9.15" | bc -l`

#### Variables
  - Every character should be lowercase and the name must start with a letter. The name should only contain alphanumeric characters and underscores. Words in the name should be separated by underscores.
  - The above rules should be followed to avoid accidentally overwriting data stored in environmental variables
  - `chapter_number=5` No spaces allowed
  - `echo $chapter_number` The dollar signed is used to retrieve the value of a variable
  - `$()` stores result of the command in a variable
  - `math_lines=$(cat math.sh | wc -l)` store number of lines in math.sh
  - Variable names with a dollar sign can also be used inside other strings in order to insert the value of the variable into the string
  - `$@` script arguments, `$1` first script argument, `$#` total number of script arguments

#### User Input
  ```bash
  #!/usr/bin/env bash
  # File: letsread.sh

  echo "Type in a string and then press Enter:"
  read response
  echo "You entered: $response"
  ```
  - Ask users to type in a string on the command line by temporarily stopping the execution of your program using the `read` command

#### Conditional Execution
  - `echo $?` checks exit status
  - `true` exit status of 0
  - `false` exit status of 1
  - `&&` Any program to the right of a program that has a non-zero exit status is not executed. Example: `false && true && echo Hello` prints nothing
  - `echo 1 && false && echo 3` prints 1
  - `||` Any command on the right hand side is only executed if the command on the left hand side fails. Example: `true || echo "Program 1 was executed` nothing executed

#### Conditional Expressions
  - `[[]]`Conditional Expressions either compare two values, or they ask a question about one value. They are always between double brackets and either use logical flags or logical operators.
  - `-gt` greater than flag. `[[ 4 -gt 3 ]]` Is 4 greater than 3?
  - Binary logical expressions compare two values, but there are also unary logical expressions that only look at one value. For example, testing whether a file exists using the `-e` logical flag: `[[ -e math.sh ]] && echo t || echo f`
  - `-ge` greater than or equal to
  - `-eq` equal to
  - `-ne` not equal to
  - `-le` less than or equal to
  - `-lt` less than
  - `-d` check if directory exists
  - `-z` length of a string is zero
  - `-n` length of string is non-zero
  - logical operators is the regex match operator `=~` which compares a string to a regular expression and if the string is a match for the regex
  ```bash
  [[ rhythms =~ [aeiou] ]] && echo t || echo f
  my_name=sean
  [[  $my_name =~ ^s.+n$ ]] && echo t || echo f
  ```
  - `!` not operator. Inverts the value of any conditional expression
  `[[ ! 6 -ne 3 ]] && echo t || echo f` prints f
  - `=` String equal to
  - `!=` String not equal to

  #### If and Else
  - First this program will print “Start program”, then the IF statement will check if the conditional expression [[ $1 -eq 4 ]] is true. It will only be true if you provide 4 as the first argument to the script. If the conditional expression is true then it will execute the code in between then and else, otherwise it will execute the code between else and fi. Finally the program will print “End program.”

    ```bash
    echo "Start program"

    if [[ $1 -eq 4 ]]
    then
      echo "Thanks for entering $1"
    else
      echo "You entered: $1, not what I was looking for."
    fi

    echo "End program"
    ```
  
  - `elif` can be used for multiple conditional expression evaluations. Don't forget to use `then` as well!