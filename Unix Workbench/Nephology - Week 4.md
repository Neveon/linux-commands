# Nephology

- Study of the clouds.
- The cloud being a computer which we can access over the internet.
- Can be referred as a **server**.

## Digital Ocean

- A company which we can rent cloud computers from.
- Cloud computers are called **droplets** in Digital Ocean

## Getting Started with Digital Ocean

- [Link for two free months](https://m.do.co/c/530d6cfa2b37)
- Need CC, DB or PayPal to sign up.
- Create new **droplet** 
- Choose your OS, payment, and datacenter
- You will be emailed the IP address of your server, username, and random password

## Connecting to the Cloud

```bash
ssh [username]@[IP address]
```
- Connect to the DigitalOcean server using ssh
- Type yes to continue connecting to server
- Then paste the password emailed to you
- **Create a new password**
- Paste old password again, then enter a new one
- After this a prompt should come up

## Moving Files In and Out of the Cloud

```bash
scp [username]@[IP address]:path/to/file/on/server path/on/my/computer
```
- Copy files on server to computer
- We can copy an entire directory as well with the `-r` flag
```bash
scp path/on/my/computer [username]@[IP address]:path/to/file/on/server
```
- The code above is to upload a local file to the server

## Talking to Other Servers

```bash
curl -O http://website.org/textfile.txt
```
- The `-O` flag saves the output of `curl` into the current directory with the name of the file you downloaded (in this case `textfile.txt`)

- The `curl` command is also commonly used for communicating with APIs (Application Programming Interface)

```bash
curl https://api.github.com/repos/seankross/lego/languages
# {
#   "R": 4197,
#   "Shell": 442
# }
```

- `curl` sends **HTTP requests**
```bash
curl "http://httpbin.org/get?city=Baltimore&state=Maryland"
# {
#   "args": {
#     "city": "Baltimore",
#     "state": "Maryland"
#   },
#   "headers": {
#     "Accept": "*/*",
#     "Connection": "close",
#     "Host": "httpbin.org",
#     "User-Agent": "curl/7.47.0"
#   },
#   "origin": "159.203.134.88",
#   "url": "http://httpbin.org/get?city=Baltimore&state=Maryland"
# }
```
- We can provide arguments to an HTTP API by putting a question mark `?` after the API’s URL.
-We can specify an argument’s name with the template `[argument name]=[argument value]`
- In `"args"` there’s a correspondence between city and Baltimore. We can add more named arguments by separating them with an ampersand `&`

## Automating Tasks

- One of the most commonly used programs for executing _other programs_ with a regular frequency is called `cron`
- `cron` program is part of a family of programs called `daemons`
- `daemon` is a program that is always running in the background of our computer
- We can get a list of all running programs with `ps -A`

```bash
ps -A
##  PID TTY          TIME CMD
##    1 ?        00:00:13 systemd
##    2 ?        00:00:00 kthreadd
##    3 ?        00:00:03 ksoftirqd/0
##    5 ?        00:00:00 kworker/0:0H
##    7 ?        00:00:11 rcu_sched
##    8 ?        00:00:00 rcu_bh
##    9 ?        00:00:00 migration/0
## ...
```

- `cron` should be running in the cloud computer (or droplet as DigitalOcean calls it)
- In order to assign programs to be executed with `cron` we need to edit a special text file called the `cron table`
- We need to `select-editor` in the server to edit the table

```bash
select-editor
## Select an editor.  To change later, run 'select-editor'.
##   1. /bin/ed
##   2. /bin/nano        <---- easiest
##   3. /usr/bin/vim.basic
##   4. /usr/bin/vim.tiny
## 
## Choose 1-4 [2]:
```

-  We can edit the `cron table` using the command `crontab -e` (cron table edit) which will automatically open the editor of your choice with the appropriate file

```bash
crontab -e
# Edit this file to introduce tasks to be run by cron.
#
# m h  dom mon dow   command
```

- Let’s go over the layout of the `cron table`. First you should notice that any text after a pound sign `#` is a comment, so it’s not seen by `cron` (just like `bash` comments). The `cron table` has six columns:

        Minute (m)
        Hour (h)
        Day of Month (dom)
        Month (mon)
        Day of Week (dow)
        Command to be run (command)

- Each column is separated by a single space in the table. The first five columns allow you to specify when you want a particular command to be run. Only certain values are valid in each column:

        Minute: 00 - 59 (A particular minute in an hour)
        Hour: 00 - 23 (0 is the midnight hour)
        Day of Month: 01 - 31 (1 is the first day of the month)
        Month: 01 - 12 (1 is January)
        Day of Week 0 - 6 (0 is Sunday)

- There are also a few other characters that are valid in the cron table. 
- The most commonly used character is a star `*` which represents all of the possible values in a column. So a star in the Minute column means “run every minute,” and a star in the Hour column means “run during every hour.” 


- Knowing this let’s make our first entry in the cron table. If we want a command to be executed every minute, during every hour, on every day of the month, during every month, on every day of the week, then we can put stars in all of the first five columns, followed by the command that we want to run. In this case the command that cron will run every minute will be date >> ~/date-file.txt, which will append the date and time when the command is executed to a file in our home directory called date-file.txt.

```bash
# Edit this file to introduce tasks to be run by cron.
#
# m h  dom mon dow   command
* * * * * date >> ~/date-file.txt
```

- Use `cat date-file.txt` (or `< date-file.txt` - **DO NOT** use closing bracket) to see the text file

```bash
# m h  dom mon dow   command
00 * * * * bash /path/to/script.sh     # Runs every hour at the start of the hour
00 12 * * * bash /path/to/script.sh    # Runs every day at noon
* 12 * * * bash /path/to/script.sh     # Runs every minute between 12pm and 12:59pm
00 00 05 * * bash /path/to/script.sh   # Runs the 5th day of every month at midnight
00 00 * 07 * bash /path/to/script.sh   # Runs every day in the month of July at midnight
00 00 * * 2 bash /path/to/script.sh    # Runs every Tuesday at midnight
```

- `-` hyphen can be used for specifying ranges
- `,` comma can specify lists of items (Example: `1,5` Day of the week means Monday and Friday)

```bash
# m h  dom mon dow   command
00-04 * * * * bash /path/to/script.sh       # Runs every minute for the first five minutes of every hour
00 00 * * 0,6 bash /path/to/script.sh       # Runs at midnight every Saturday and Sunday
00 03 01-15 * * bash /path/to/script.sh     # Runs at 3am for the first fifteen days of every month 
00,30 * * * * bash /path/to/script.sh       # Runs at the start and middle of every hour
00 00,12 * * * bash /path/to/script.sh      # Runs every day at midnight and noon
00 * 01-07 01,06 * bash /path/to/script.sh  # Runs at the start of every hour for the first seven days of the months of January and June
```

## Shutting Down a Server

- In order to avoid using more DigitalOcean credits than we have to or being charged for using the service make sure to destroy any DigitalOcean droplets that you started. When you destroy a droplet all files on the droplet are gone forever, so please be sure that you don’t have any important information on a droplet before you destroy it.

- To destroy a droplet, we click on **More** on the right side of the screen and a menu should appear.

## Next Steps

- A few suggestions about how you can continue your computing and programming education
- Python is a good approach into computing. [Python Visualizer](http://pythontutor.com/)
- `Flask` can be used to build HTTP APIs
- `R` a general purpose programming language designed for folks who are interested in data science, analysis, modeling, and visualization
- `R` [book](https://leanpub.com/rprogramming), [Swirl software package](http://swirlstats.com/), and the interactive `R` tutorial website [DataCamp](https://www.datacamp.com/)
- [NodeSchool](https://nodeschool.io/) teaches you how to use `JavaScript` with `Unix`