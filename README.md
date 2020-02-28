<div align="center">
    <h1>bm</h1>
    <p>A modern approach to scripting in Bash</p>
</div>

**The README is a work in progress. All wording is currently a brain-dump. If you are here, expect to be confused.**
    
## Description

bm leverages modern package management techniques to provide a cleaner scripting
experience in bash. This is accomplished using [modules](), something about analyzing them.
Prevent naming colisions and bad practices. 

## Philosophy

Scripting in bash often leads to confusing scripts, with pieces pulled from all over the internet,
snippets of mystery with no documentation that you hope just works, and continues to work. This often
leads teams to use a language such as python to accomplish a task that could be done very simply if
bash were slightly more convenient to use.

simple configurations [link to configs]()

bm aims to provide this simplicity out of the box with the [bm-core]() package. For functionality that
is not covered, bm allows the community to contribute modules to the official package repository, or
for users to [host their own repositories]().

All code submitted to the official [bm repository]() is guaranteed to be documented, tested, formatted,
and correct (by means of static analysis tooling such as shellcheck).

#### What bm is _not_

bm is not a package manager in the conventional sense. It instead aims to provide users
the tools necessary to create their own packages in the form of **modules**. Packages may not
provide binaries, but could instead be used as an entrypoint for writing your own testing suite.

* [Installation](#installation)

https://github.com/molovo/crash
https://github.com/alebcay/awesome-shell
