# [The Unix Workbench](https://click.linksynergy.com/deeplink?id=PtFMiHYfEVk&mid=40328&murl=https%3A%2F%2Fwww.coursera.org%2Flearn%2Funix)

#### `ls -l` long listing
  - If the entry in the first column is a d, then the row in the table corresponds to a directory, otherwise the information in the row corresponds to a file

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
