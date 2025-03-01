# README

## Install SBCL on Ubuntu

Install SBCL with ASDF

Please instal ASDF from https://asdf-vm.com/guide/getting-started.html

```bash
sudo apt install -y libssl-dev automake autoconf libncurses-dev libzstd-dev
sudo apt install -y dirmngr gpg curl gawk
asdf plugin add sbcl https://github.com/smashedtoatoms/asdf-sbcl.git
asdf install sbcl latest
vim $HOME/.tool-versions
```
Add `$HOME/.asdf/shims` to the front of your `$PATH`.

## Install SBCL on macOS

Install SBCL with Brew

```bash
brew install rlwrap
brew install sbcl
```

Add alias in your `.bashrc` for Emacs keybindings

```bash
alias sbcl='rlwrap sbcl'
```

### Install QuickLISP and setup SBCL for Emacs

- SBCL: an implementation of the Common Lisp programming language
- CLISP: an implementation of the Common Lisp programming language
- Quicklisp: a library manager for Common Lisp
- asdf: a build tool for Common Lisp; come with asdf included already.

```bash
curl -o /tmp/ql.lisp http://beta.quicklisp.org/quicklisp.lisp
sbcl --no-sysinit --no-userinit --load /tmp/ql.lisp \
     --eval '(quicklisp-quickstart:install :path "~/.quicklisp")' \
     --eval '(ql:add-to-init-file)' \
     --quit
sbcl --eval '(ql:quickload :quicklisp-slime-helper)' --quit
```

### Set up SBCL in Emacs

Add below to `init.el` or `.emacs`.
If you are using Doom Emacs, add below to `config.el` file.

```lisp
(load (expand-file-name "~/.quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")
```

## Starting SBCL

### From Shell to LISP

```bash
$ sbcl
* (+ 2 2)
4
* (exit)
$
```

### Running from Emacs

You must start SLIME in Emacs first.

`M-x slime`

After reading a list file into Emacs,
evaluate or apply it with the following keybindings.

- Evaluate a function definition
  `C-c C-c`

- Call a function in the buffer `*slime-repl sbcl*`
  `C-C C-z`

- Call a function in the REPL
  `CL-USER> (function-name args..)`

- Apply a function in a source file
  `C-x C-e`

- Evaludate a region selected in a buffer (after selecting a region)
  `C-c C-r`

- Evaludate the entire buffer
  `C-c C-k`

### Shebang Scripts

SBCL supports this via the `--script` command line option

Example file (`hello.lisp`):

```lisp
#! /opt/homebrew/bin/sbcl --script
(write-line "Hello, World!")
```

Usage examples:

```bash
$ ./hello.lisp
Hello, World!

$ sbcl --script hello.lisp
Hello, World!
```

### Compile SBCL

Write a compile script `compile-hello.lisp`

```lisp
(load "hello.lisp")
(sb-ext:save-lisp-and-die "hello.exe" :toplevel #'hello-world :executable t)
```

Run the script

```bash
> sbcl --script compile-hello.lisp
> hello.exe
```

## Create a project with ASDF

Check ASDF is installed in your system

```bash
$ sbcl
* *features*
(:QUICKLISP :ASDF3.3 ....

```

Set up system directory to use

```bash
mkdir -p ~/common-lisp
export ASDF_PATHS="$HOME/common-lisp"
```

Create a Common Lisp project manually
in your system directory `~/common-lisp`

a project structure named `my-project` is ...

```
~/common-lisp/my-project/
├── my-project.asd
└── src/
    ├── package.lisp
    └── main.lisp
```

`my-project.asd` file is ...

```lisp
(defsystem "my-project"
  :description "A simple example project"
  :author "Your Name"
  :version "0.1.0"
  :pathname "src/"
  :components ((:file "package")
               (:file "main")))
```

Load and build project in SBCL REPL

```bash
sbcl
```

```lisp
(asdf:load-system "my-project")
```
