# Playwright
#### A ruby framework for command line scripts
Playwright allows you to quickly build terminal commands that run ruby scripts.
Never write bash again with this ruby framework! Install Playwright and follow the demo to see what I mean!

## Install
```shell
$ git clone git@github.com:mgreg90/playwright.git
$ cd playwright
$ sh installer.sh path/to/bash_profile
```

## Demo
Build a super simple "Hello World!" command.
```shell
$ playwright g play hello_world
```
change:
```ruby
def run
  # add code here
end
```
to
```ruby
def run
  puts "Hello World!"
end
```
then
```shell
$ playwright apply
$ hello_world
#=> "Hello World!"
```

## Commands
```
$ playwright g play [play_name] arg1 arg2
#=> builds a play template and opens editor to it.

$ playwright d play [play_name]
#=> deletes the play with that name.

$ playwright apply
#=> creates aliases for all plays.

$ playwright list
#=> lists all plays.

$ playwright uninstall
#=> uninstalls playwright.
```