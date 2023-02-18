# mommy
mommy's here to support you~ ❤️

![mommy demo](.github/demo.gif)

## installation
mommy works on any POSIX system.
mommy is tested on Ubuntu, Debian, macOS, FreeBSD, and NetBSD~

[download the latest release](https://github.com/FWDekker/mommy/releases/latest) for your platform and install as usual:
* on Debian/Ubuntu/etc, run `sudo apt install ./mommy-*.deb`,
* on Red Hat/Fedora/etc, run `sudo dnf install ./mommy-*.rpm`,
* on ArchLinux, run `sudo pacman -U ./mommy-*.pac`,
* on Alpine Linux, run `sudo apk add --allow-untrusted ./mommy-*.apk`, and
* on macOS, FreeBSD/NetBSD/OpenBSD/etc, and any other POSIX system, you have two choices:
  * extract `./mommy-*.any-system.tar.gz` and run `sudo ./install.sh` to install mommy and the manual page, or
  * download `./mommy-*.sh` directly and put it wherever you want~

after installation, you can [integrate mommy with your shell](#shell-integration)~

## usage
mommy integrates with your normal command-line usage and compliments you if the command succeeds and encourages you if
it fails~

```shell
$ mommy [-c config] [command] ...
# e.g. `mommy npm test`

$ mommy [-c config] -e eval
# e.g. `mommy -e "ls -l | wc -l"`

$ mommy [-c config] -s status
# e.g. `mommy -s $?`
```

## configuration
mommy's behavior can be configured by editing `~/.config/mommy/config.sh`.
or specify another config file with `mommy -c ./my_config.sh [other options]`~

### config file format
mommy executes the config file as a shell script and keeps the environment variables.
so, to change the value of `MOMMY_PRONOUN`, add the following line to your config file:
```shell
MOMMY_PRONOUN="their"
```
make sure you do not put spaces around the `=`~

### template variables
you can change the words mommy uses to describe herself and you by changing the following variables in your config file:

| variable          | description                                 | default |
|-------------------|---------------------------------------------|---------|
| `MOMMY_CAREGIVER` | what mommy calls herself                    | `mommy` |
| `MOMMY_THEIR`     | mommy's pronoun for herself                 | `her`   |
| `MOMMY_SWEETIE`   | what mommy calls you                        | `girl`  |
| `MOMMY_SUFFIX`    | what mommy puts at the end of each sentence | `~`     |

for each of these variables, you can specify multiple values separated by `/`, and mommy will choose a random one
each time.
for example, if you set
```shell
MOMMY_SWEETIE="girl/cat"
```
then mommy will sometimes call you `girl`, and sometimes `cat`~

### compliments and encouragements
you can change the sentences mommy says when she compliments or encourages you.
compliments are when things go well, and encouragements are when things are not going so well~

| variable                      | description                                   |
|-------------------------------|-----------------------------------------------|
| `MOMMY_COMPLIMENTS`           | default list of compliments                   |
| `MOMMY_COMPLIMENTS_CUSTOM`    | custom list of compliments you can specify    |
| `MOMMY_ENCOURAGEMENTS`        | default list of encouragements                |
| `MOMMY_ENCOURAGEMENTS_CUSTOM` | custom list of encouragements you can specify |

when choosing a compliment, mommy looks at all the compliments in both `MOMMY_COMPLIMENTS` and
`MOMMY_COMPLIMENTS_CUSTOM`.
so, add your own compliments to `MOMMY_COMPLIMENTS_CUSTOM`.
if you want to disable the default compliments and only use your custom compliments, also set `MOMMY_COMPLIMENTS=""`~

inside compliments and encouragements, you can use several variables:

| variable        | description                 |
|-----------------|-----------------------------|
| `%%CAREGIVER%%` | what mommy calls herself    |
| `%%THEIR%%`     | mommy's pronoun for herself |
| `%%SWEETIE%%`   | what mommy calls you        |

a few notes on compliments and encouragements:
* you can add multiple of them by putting them on separate lines or by separating them with `/`~
* lines containing only space are ignored~
* in between the `""`, lines starting with `#` are ignored.
  for example:
  ```shell
  MOMMY_COMPLIMENTS="meow meow
  # this line is ignored
  prr prrr
  "
  ```

### miscellaneous features
there are a few features that you can disable, enable, or otherwise customise~

| variable                       | description                                                                                                                                                                                                                                                                                                                           | default |
|--------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------|
| `MOMMY_COMPLIMENTS_ENABLED`    | `1` to enable compliments, anything else to disable                                                                                                                                                                                                                                                                                   | `1`     |
| `MOMMY_ENCOURAGEMENTS_ENABLED` | `1` to enable encouragements, anything else to disable                                                                                                                                                                                                                                                                                | `1`     |
| `MOMMY_CAPITALIZE`             | `0` to start sentences in lowercase, `1` for uppercase, anything else to change nothing                                                                                                                                                                                                                                               | `0`     |
| `MOMMY_COLOR`                  | color of mommy's text. you can use any [xterm color code](https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg), or write `lolcat` to use [lolcat](https://github.com/busyloop/lolcat) (install separately). specify multiple colors separated by `/` to randomly select one. empty string for default color. | `005`   |

### forbidden words / trigger words
if mommy uses a word that you really don't like, but you don't want to remove all of mommy's default
compliments/encouragements, you can set forbidden words, and mommy will not use templates with those words in them.
to set multiple forbidden words, separate them with a `/`.
for example, write
```shell
MOMMY_FORBIDDEN_WORDS="cat/dog"
```
and mommy will not use a template that contains either `cat` or `dog`~

### renaming the mommy executable
if you want to write `daddy npm test` instead of `mommy npm test`, then run the following:
* if you installed with a package manager (`apt`, `rpm`, etc), do:
  ```shell
  sudo ln -fs /usr/bin/mommy /usr/bin/daddy
  sudo ln -fs /usr/share/man/man1/mommy.1.gz /usr/share/man/man1/daddy.1.gz
  ```
* if you installed with `./install.sh`, do:
  ```shell
  sudo ln -fs /usr/local/bin/mommy /usr/local/bin/daddy
  sudo ln -fs /usr/local/share/man/man1/mommy.1.gz /usr/local/share/man/man1/daddy.1.gz
  ```

if you update mommy, then your daddy will also be updated.
but if you uninstall mommy, you should manually uninstall your daddy by running
```shell
sudo rm -f /usr/bin/daddy /usr/share/man/man1/daddy.1.gz /usr/local/bin/daddy /usr/local/share/man/man1/daddy.1.gz
```


## shell integration
instead of calling mommy for each command, you can also fully integrate mommy with your shell to get mommy's output each
time you run any command.
here are some examples on how you can do that in various shells.
recall that you can add `MOMMY_COMPLIMENTS_ENABLED=0` to your mommy config file to disable compliments while keeping
encouragements~

### bash
in bash you can set
[`PROMPT_COMMAND`](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#index-PROMPT_005fCOMMAND) to run
mommy after each command.
just add the following line to `~/.bashrc`:
```shell
PROMPT_COMMAND="mommy -s \$? 2>&1; $PROMPT_COMMAND"
```

### fish
in fish you can have mommy output a message on the right side of your prompt by creating
`~/.config/fish/functions/fish_right_prompt.fish` with the following contents:
```shell
function fish_right_prompt
    mommy -s $status 2>&1
end
```
if you have an [oh my fish](https://github.com/oh-my-fish/oh-my-fish) theme installed, check the docs of your theme to 
see if there's an easy way to extend the theme's right prompt.
if not, you can either overwrite it with the above code, or copy-paste the theme's code into your own config file and 
then add mommy yourself~

### zsh
in zsh you can put mommy's output after each command by adding the following line to `~/.zshrc`:
```shell
precmd() { mommy -s $status 2>&1 }
```

to put mommy's output on the right side, add the following to `~/.zshrc`:
```shell
set -o PROMPT_SUBST
RPS1="\$(mommy -s \$? 2>&1)"
```

### other shells
as a generic method, in any POSIX shell (including `sh`, `ash`, `dash`, `bash`) you can change the prompt itself to
contain a message from mommy by setting the `$PS1` variable:
```shell
export PS1="\$(mommy -s \$? 2>&1)$PS1"
```
to improve the spacing, set `MOMMY_SUFFIX="~ "` in mommy's config file.
add the above line to the config file for your shell.
some shells (`dash`, `pdksh`) do not have a non-login config file by default, so to enable that you should add the 
following to `~/.profile`:
```shell
export ENV="$HOME/.shrc"
```
after that, add the line that defines `PS1` to `~/.shrc`.
log out and back in, and mommy will appear in your shell~


## development
to build your own mommy, first install the requirements.
on Debian-like systems, run
```shell
sudo apt install rubygems libarchive-tools rpm zstd
sudo gem install fpm
```

after that, just run `./build.sh deb` (or better: `mommy ./build.sh deb`), and outputs appear in `dist/`.
replace `deb` with [one or more supported output types](https://fpm.readthedocs.io/en/v1.15.1/packaging-types.html), 
and/or use custom formats `raw` and `installer`~

before a new release, make sure to update the version number in `./version` and to update the `CHANGELOG.md`~

to run tests, install [shellspec](https://github.com/shellspec/shellspec) and run `./test.sh`.
by default, tests are run against `src/main/sh/mommy`.
to change that, set the `mommy` variable before running tests, as in `mommy=/usr/bin/mommy ./test.sh`~


## acknowledgements
mommy was very much inspired by [cargo-mommy](https://github.com/Gankra/cargo-mommy)~
