snes-game-patch-template
---
## Using this template

Fork this repo, go to the `Makefile` and edit the variable in the 
`CUSTOM VARIABLES` header accordingly. Also double check the links in the bottom
of this README file and change them when needed. Make sure you follow the 
[guide to create a Dropbox App][dropbox-guide] and upload the your personal
backup ROM of your game. If you don't do this **the Github Actions will not
work**!

This template and its documentation are using [The Last Super][the-last-super]
game as an example. It is a funny open source game made to celebrate the 30th
anniversary of the Super Nintendo, go check it out :)

After that you may remove this section from this README file.

## What is this?

This is a modification of the original game. As the game is protected by 
copyrights, this project cannot provide a copy of it for you to download but 
instead we provide a patch (`.bps`) file.

A patch is simply a file that contains all the differences between a game and 
its modified version. Applying a patch to an original game will result in the 
customized version.

## How to play this custom game?

In order to play it your must own the original game and also to have a backup of
it in a ROM format, like `.sfc`. You will also need [Flips][flips] a program 
that knows how to apply patches to original games.

Go to the [latest release][latest] at the `Releases` page and download the patch
file - it is the one finishing with `.bps`. Them use flips to apply the patch 
to your original backup ROM. Remember to **create a copy of your ROM before**
applying anything!

With the modified game at hand you may play it using an emulator like 
[RetroArch][retroarch].

## Running locally

To build locally you will need [Docker][docker] and [make][make]. On the root
directory of this repo run

```bash
$> make prepare && make rom ORIGINAL_ROM=/path/to/your/orignal/backup/rom.sfc
```

which will create a playable ROM on `./build/release/`. If you want instead to
create a patch file, just run:

```bash
$> make prepare && make patch ORIGINAL_ROM=/path/to/your/orignal/backup/rom.sfc
```

again, a patch file will be created at `./build/release/`. 

Also if you are editing the source code it is probably a good idea to rebuild
the ROM every time you change something. That can be achieved with

```bash
$> make prepare && make watch ORIGINAL_ROM=/path/to/your/orignal/backup/rom.sfc
```
## Releasing

Everything is automated by Github Actions, the only manual step is to edit the
text of the release on `Releases` page. For more details please read the 
[releasing][releasing] manual.

<!-- replace m00qek/snes-game-patch-template with your USER and REPO -->
[latest]: https://github.com/m00qek/wide-snes/releases/latest

[dropbox-guide]: ./docs/template/creating-a-dropbox-app.md
[the-last-super]: https://drludos.itch.io/the-last-super
[flips]: https://github.com/Alcaro/Flips
[retroarch]: https://www.retroarch.com/index.php
[docker]: https://www.docker.com/get-started
[make]: https://www.gnu.org/software/make/
[releasing]: ./RELEASING.md
