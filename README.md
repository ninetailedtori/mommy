# mommy
mommy's here to support you~ ❤️

```shell
$ mommy npm test

[bunch of failing tests here]

mommy knows her little girl can do better~
```

## usage
put `mommy` before any command you want to run and mommy displays a compliment if it succeeds and an encouraging message
if it fails~

alternatively, use `mommy -e` to evaluate the string as a command, as in `mommy -e "npm test"`~

```shell
$ mommy true
good girl~
```

```shell
$ mommy false
mommy knows her little girl can do better~
```

```shell
$ mommy -e "command1 | command2 | command 3 | command 4"
[if any command fails]
mommy knows her little girl can do better~
```

```shell
$ mommy -e "command1 | command2 | command 3 | command 4"
[if all commands succeed]
good girl~
```

## configuration
mommy will carefully read the following variables from `~/.config/mommy/config.sh` (override using
`mommy -c ./my_config`)
to give you the bestest messages~ ❤
* `MOMMY_PET_NAME` is what mommy calls you~
* `MOMMY_PRONOUN` is what mommy uses for themselves~
* `MOMMY_ROLE` is how mommy calls themselves~
* `MOMMY_SUFFIX` is how mommy will end all their messages~
* `MOMMY_CAPITALIZE` is `0` if mommy should start her sentences in lowercase, `1` for uppercase, and anything else to
  change nothing~
* `MOMMY_COMPLIMENTS` is the compliment mommy should give you if you did a good job~
* `MOMMY_COMPLIMENTS_EXTRA` is where you can add your own compliments without removing the default ones~
* `MOMMY_ENCOURAGEMENTS` is the encouragement mommy should give you if you need help~
* `MOMMY_ENCOURAGEMENTS_EXTRA` is where you can add your own encouragements without removing the default ones~

all these options take a `/`-separated list, and mommy will select the one they feel like using whenever they talk
to you~

in custom compliments and encouragements, you can ask mommy to use variables `%%PET_NAME%%`, `%%PRONOUN%%`, and
`%%ROLE%%`~
be careful with trailing newlines because mommy doesn't remove those for you~

for example, if the config file looks like
```shell script
MOMMY_PET_NAME="boy/pet/baby"
MOMMY_PRONOUN="his/their"
MOMMY_ROLE="daddy"
MOMMY_SUFFIX="~/ :3/"
MOMMY_COMPLIMENTS_EXTRA="great job little %%PET_NAME%%/%%ROLE%% is proud of you"
MOMMY_ENCOURAGEMENTS_EXTRA="\
/%%ROLE%% is here for you\
/%%ROLE%% will always love you\
/%%ROLE%% is here if you want a hug"
```
then mommy might compliment you with any of
* daddy loves his little baby~
* great job little baby :3
* daddy is proud of you

and so on~

## installation
download the [latest release](https://github.com/FWDekker/mommy/releases/latest) for your platform and install as usual~

for example, on Debian-like systems (including Ubuntu), run
```shell
sudo apt install ./mommy-0.0.2.deb
```

and then run `mommy [your command]`~

## development
to build your own mommy, just run `./build.sh`, and outputs appear in `dist/`~

to install the requirements on a Debian-like machine, run
```shell
sudo gem install fpm
sudo apt install build-essential squashfs-tools rpm
```

for a new release, make sure to update `./version` and update the date in `src/main/resources/mommy.1`~

to run tests, install [shellspec](https://github.com/shellspec/shellspec) and run `shellspec src/test/sh/mommy_spec.sh`~

## acknowledgements
mommy was very much inspired by [cargo-mommy](https://github.com/Gankra/cargo-mommy)~
