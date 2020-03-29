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

#### Arrays
  - Arrays are created with parentheses with a space separating each element in the list
  - To retrieve the array you need to use parameter expansion, which involves the dollar sign and curly brackets. To get all elements in the array, use a `*` between the square brackets
  - To get only part of an array you have to specify the index you would like to start at, followed by the number of elements you would like to retrieve from the array, separated by colons
  - To get length of an array use the `#` pound sign
  - `+=` can be used to add an array onto the end of an array
  ```bash
  plagues=(blood frogs lice flies sickness boils hail locusts darkness death)
  echo ${plagues[0]}
  plagues[4]=disease
  echo ${plagues[*]}
  echo ${plagues[*]:5:3}
  echo ${#plagues[*]}
  ```

#### Braces
  - Bash has a very handy tool for creating strings out of sequences called brace expansion. Brace expansion uses the curly brackets and two periods ({ .. }) to create a sequence of letters or numbers. For example to create a string with all of the numbers between zero and nine you could do the following
  ```bash
  echo {0..9}

  ## 0 1 2 3 4 5 6 7 8 9
  ```

  - You can put strings on either side of the curly brackets and they’ll be “pasted” onto the corresponding end of the sequence:
  ```bash
  echo a{0..4}
  echo b{0..4}c

  ## a0 a1 a2 a3 a4
  ## b0c b1c b2c b3c b4c
  ```
  - You can also combine sequences so that two or more sequences are pasted together:
  ```bash
  echo {1..3}{A..C}

  ## 1A 1B 1C 2A 2B 2C 3A 3B 3C
  ```

  - If you want to use variables in order to define a sequence you need to use the eval command in order to create the sequence:
  ```bash
  start=4
  end=9
  echo {$start..$end}
  eval echo {$start..$end}

  ## {4..9}
  ## 4 5 6 7 8 9
  ```

  - You can combine sequences with a comma between brackets ({,}):
  ```bash
  echo {{1..3},{a..c}}

  ## 1 2 3 a b c
  ```

  - In fact you can do this with any number of strings:
  ```bash
  echo {Who,What,Why,When,How}?

  ## Who? What? Why? When? How?

  ```
  
#### For Loops
  ```bash
  #!/usr/bin/env bash
  # File: forloop.sh

  echo "Before Loop"

  for i in {1..3}
  do
      echo "i is equal to $i"
  done

  echo "After Loop"
  ```

#### While Loops
  ```bash
  #!/usr/bin/env bash
  # File: whileloop.sh

  count=3

  while [[ $count -gt 0 ]]
  do
    echo "count is equal to $count"
    let count=$count-1
  done
  ```

#### Nesting
  ```bash
  #!/usr/bin/env bash
  # File: nestedloops.sh

  for number in {1..3}
  do
    for letter in a b
    do
      echo "number is $number, letter is $letter"
    done
  done
  ```

#### Writing Functions
  - Syntax
  ```bash
  function [name of function] {
  # code here
  }
  ```

  - Examples
  ```bash
  #!/usr/bin/env bash
  # File: hello.sh

  function hello {
    echo "Hello"
  }

  hello
  hello
  hello
  ```
  ```bash
  #!/usr/bin/env bash
  # File: addseq.sh

  function addseq {
    sum=0

    for element in $@
    do
      let sum=sum+$element
    done

    echo $sum
  }
  ```

  - In the program above we initialize the sum variable to be 0 so that we can add other values in the sequence to sum. We then use a FOR loop to iterate through every element of $@, which is an array of all the arguments we provide to addseq. Finally we echo the value of sum.

  - `source bashScript.sh` allows us to use function definitions in bash scripts as command line commands
  ```bash
  source addseq.sh
  addseq 12 90 3
  addseq 0 1 1 2 3 5 8 13
  addseq
  addseq 4 6 6 6 4

  ## 105
  ## 33
  ## 0
  ## 26
  ```

#### Getting values from Functions
  - If we look back at the code for `addseq.sh` we can see that we created a variable in the function called sum. When you create variables in functions those variables become globally accessible, meaning that even after the program is finished that variable retains its value in your shell.

  ```bash
  echo $sum

  ## 10
  ```

  - Unfortunately this approach is problematic because it changes the values of variables that we might be using in our shell. For example if we were storing some other important value in a variable called sum we would destroy that value by accident by running addseq. In order to avoid this problem it’s important that we use the local keyword when assigning variables within a function. The local keyword ensures that variables outside of our function are not overwritten by our function. 

  ```bash
  #!/usr/bin/env bash
  # File: addseq2.sh

  function addseq2 {
    local sum=0

    for element in $@
    do
      let sum=sum+$element
    done

    echo $sum
  }
  ```

#### The Unix Philosophy
  - Unix tools were designed along a set of guidelines which are best summarized by Ken Thompson’s idea that each Unix program should do one thing well. Following this rule when writing functions and programs accomplished several goals:

        1) Limiting a program to only doing one thing reduces the length of the program, and the shorter a program is the easier it is to fix if it contains bugs or if it needs to be revised.
        
        2) Writing short programs also helps the users of your code understand what’s going on in your code in the event that they need to read your code. Reading a poem induces a different cognitive load compared to reading a novel.

        3) Folks who don’t read the source code of your program (most users won’t - they shouldn’t have to) will be able to understand the inputs, outputs, and side effects of your program more easily.

        4) Using small programs to write a new program will increase the likelihood that the new program will also be small. Composability is the concept of stringing small programs together to create a new program.

  - The concept of composability in Unix is best illustrated by the use of the pipe operator (|) for creating pipelines of programs. When you’re considering what inputs your program is going to have and what your program is going to print to the console you should consider whether or not your program might be used in a pipeline, and you should organize your program accordingly.

  - The concept of quietness is another important part of the Unix philosophy. Quietness in this case means that a function should not print to the console unless it is necessary, either to inform the user of a value (pwd), to display the result of a computation (bc), or to warn the user that an error has occurred.

#### Making Programs Executable
  ```bash
  ls -l | head -n 3

  ## -rw-rw-r-- 1 sean sean 138 Jun 26 12:51 addseq.sh
  ## -rw-rw-r-- 1 sean sean 146 Jun 26 14:45 addseq2.sh
  ## -rw-rw-r-- 1 sean sean 140 Jan 29 10:06 bigmath.sh
  ```

  - Following long listing `ls -l`, we can see the left column of the table contains a series of individual characters and dashes. The first hyphen signifies that each entry in the list are files. It would have a d in place if they were directories.

  - Excluding the first hyphen, we have the string rw-rw-r--.

  - This string reflects the permissions that are set up for this file. There are three permissions that we can grant: the ability to read the file (r), write to or edit the file (w), or execute the file (x) as a program. These three permissions can be granted on three different levels of access which correspond to each of the three sets of rwx in the permissions string: the owner of the file, the group that the file belongs to, and everyone other than the owner and the members of a group. Since you created the file you are the owner of the file, and you can set the permissions for files that you own using the `chmod` command.

  - `chmod` first argument is a string which specifies how we are going to change permissions for the file, and the second argument is the path to the file.
  - `u` The owner of the file
  - `g` The group that the file belongs to
  - `o` Eveyone else
  - `a` Everyone above

  - We then need to specify whether we are going to add, remove or set permission
  - `+` Add permission
  - `-` Remove permission
  - `=` Set permission

  - Finally, we specify what permission we are changing
  - `r` Read a file
  - `w` Write to or edit a file
  - `x` Execute a file

  - Short example
  ```bash
  echo 'echo "a small program"' > short

  ls -l short

  ## -rw-r--r--  1 sean  staff  23 Jun 28 09:47 short

  chmod u+x short
  ls -l short

  ## -rwxr--r--  1 sean  staff  23 Jun 28 09:47 short
  ```

  - We successfully added the x! To run an executable file we need to specify the path to the file, even if the path is in the current directory, meaning we need to prepend ./ to short.

  ```bash
  ./short

  ## a small program
  ```

  - There is one small detail we should add to this program though. Even though we’ve made our file executable, if we give our program to somebody else they might be using a shell that doesn’t know how to execute our program. We need to indicate how the program should be run by adding a special line of text to the beginning of our program called a shebang.

  - The shebang always begins with #! followed by the path to the program which will execute the code in our file. The shebang for indicating that we want to use Bash is `#!/usr/bin/env bash`, which we’ve been adding to the start of our scripts for a while now!

#### Environmental Variables
  - An environmental variable is a variable that Bash creates where data about your current computing environment is stored. Environmental variable names use all capitalized letters. Let’s look at the values for some of these variables. The HOME variable contains the path to our home directory, and the PWD variable contains the path to our current directory.

  ```bash
  echo $HOME
  echo $PWD

  ## /home/dragon
  ## /home/dragon/Desktop/Linux_Tut/UnixWorkbench
  ```

  - If we want one of our functions to be available always as a command then we need to change the PATH variable.
  - The PATH variable contains a sequence of paths on our computer separated by colons. When the shell starts it searches these paths for executable files, and then makes those executable commands available in our shell. One approach to making our scripts available is to add a directory to the PATH. Bash scripts in the directory that are executable can be used as commands. We need to modify PATH every time we start a shell, so we can ammend our `~/.bash_profile` (or `~/.profile.`, or `~/.bashrc`) so that our directory for executable scripts is always in the PATH. To modify an environmental variable we need to use the `export` keyword.
  
  - In this example, we’ll set the variable in the ~/.bashrc file. Open the file with your text editor and add the following line at the end of it:
  ```bash
  nano ~/.bashrc
  export PATH="$HOME/bin:$PATH"
  ```
  - Save the file and load the new $PATH into the current shell session using the source command:
  ```bash
  source ~/.bashrc
  ```
  - To confirm that the directory was successfully added, print the value of your $PATH by typing `echo $PATH`