;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; ## How to install Emacs on macOS
;; $ brew install emacs
;; $ brew install emacsclient
;; $ brew services restart emacs
;; $ emacsclient -nw -c
;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes '(wheatgrass))
 '(display-battery-mode t)
 '(display-time-mode t)
 '(package-selected-packages
   '(em-alias eshell treemacs-magit treemacs-projectile treemacs slime zig-mode vterm transpose-frame rust-mode opam ocp-indent ocamlformat nix-mode neotree multiple-cursors lsp-ui lsp-haskell helm erlang editorconfig dune dotenv-mode alchemist))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Iosevka NF" :foundry "outline" :slant normal :weight regular :height 120 :width normal))))
 '(cursor ((t (:background "red3")))))


(progn
  ;; Insall Emacs Packages
  (require 'package)
  (dolist (archive '(("melpa" . "https://melpa.org/packages/")
                     ("melpa-stable" . "https://stable.melpa.org/packages/")))
    (add-to-list 'package-archives archive t))
  (package-initialize)
  (when (not (string-equal system-type "windows-nt"))
      (progn
        (add-to-list 'exec-path (concat (getenv "HOME") "/.local/bin/"))
        (add-to-list 'load-path (concat (getenv "HOME") "/.opam/default/share/emacs/site-lisp")))))


(progn
  (if (string-equal system-type "windows-nt")
      (progn
        (defvar choo/home-directory "c:/Users/mingy")
        (setq default-directory choo/home-directory))
    (progn
      (defvar choo/home-directory (getenv "HOME"))
      (setq default-directory (concat choo/home-directory "/Dropbox/org-roam"))))
  (progn
    (setq inhibit-startup-message t)
    (setq initial-scratch-message "")
    (setq-default mesage-log-max nil))
  (progn
    (set-language-environment "UTF-8")
    (set-default-coding-systems 'utf-8)
    (set-terminal-coding-system 'utf-8)
    (set-keyboard-coding-system 'utf-8)
    (prefer-coding-system 'utf-8)))


(progn
  ;; Transpose-frame
  (unless (package-installed-p 'transpose-frame)
    (package-install 'transpose-frame))
  (require 'transpose-frame)
  (global-set-key (kbd "C-x t") 'transpose-frame))


(progn
  ;; Dotenv-mode
  (unless (package-installed-p 'dotenv-mode)
    (package-install 'dotenv-mode))
   (require 'dotenv-mode))


(progn
  ;; Editorconfig
  (unless (package-installed-p 'editorconfig)
    (package-install 'editorconfig))
   (require 'editorconfig)
   (editorconfig-mode t))


(progn
  ;; Multiple-cursors
  (unless (package-installed-p 'multiple-cursors)
    (package-install 'multiple-cursors))
   (require 'multiple-cursors)
   (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
   (global-set-key (kbd "C-S-c C-S-a") 'mc/mark-all-like-this)
   (global-set-key (kbd "C->") 'mc/mark-next-like-this)
   (global-set-key (kbd "C-<") 'mc/mark-previous-like-this))


(progn
  ;; Helm-mode
  (unless (package-installed-p 'helm)
    (package-install 'helm))

  (require 'helm)
  (helm-mode t)
  (global-set-key (kbd "M-x") 'helm-M-x))


(progn
  ;; Eshell
  (unless (package-installed-p 'eshell)
    (package-install 'eshell))
  (global-set-key (kbd "C-x e") 'eshell)
  (add-hook 'eshell-mode-hook
            (lambda ()
              (eshell/alias "e" "find-file $1")
              (eshell/alias "ff" "find-file $1")
              (eshell/alias "open" "find-file $1")
              (eshell/alias "d" "dired $1")
              (eshell/alias "ll" "ls -l $*")
              (eshell/alias "la" "ls -a $*")
              (eshell/alias "mkdir" "mkdir -p $*")
              (eshell/alias "clear" "eshell/clear-scrollback"))))


(progn
  ;; Treemacs
  (unless (package-installed-p 'treemacs)
    (package-install 'treemacs))
  (require 'treemacs)
  (global-set-key (kbd "C-x t") 'treemacs)
  (global-set-key (kbd "M-0") 'treemacs-select-window)
  (unless (package-installed-p 'treemacs-projectile)
    (package-install 'treemacs-projectile))
  (unless (package-installed-p 'treemacs-magit)
    (package-install 'treemacs-magit)))


(when (not (string-equal system-type "windows-nt"))
  (progn
    ;; Org-mode and Org-roam
    (dolist (pkg '(ob-rust ob-typescript org-bullets org-roam))
      (unless (package-installed-p pkg)
	      (package-install pkg)))
    (require 'org-bullets)
    (require 'org-roam)
    (require 'ob-rust)
    (require 'ob-typescript)
    (defvar choo/org-roam-directory (concat choo/home-directory "/Dropbox/org-roam"))
    (setq org-agenda-files (list choo/org-roam-directory))
    (setq org-roam-directory (file-truename choo/org-roam-directory))
    (setq org-startup-folded 'content)
    (setq org-startup-indented t)
    (setq org-hide-emphasis-markers t)
    (setq org-log-done 'time)
    (setq org-todo-keywords
    '((sequence "TODO" "DOING" "BLOCKED" "DONE")))
    (org-roam-db-autosync-mode)
    (org-babel-do-load-languages 'org-babel-load-languages
                                 '((python . t)
                                   (js . t)
                                   (rust . t)
                                   (haskell . t)
                                   (ocaml . t)))
    (setq org-confirm-babel-evaluate nil)
    (defun choo/org-mode-keys ()
      (local-set-key (kbd "C-c a") 'org-agenda)
      (local-set-key (kbd "C-c n f") 'org-roam-node-find)
      (local-set-key (kbd "C-c n i") 'org-roam-node-insert))
    (add-hook 'org-mode-hook (lambda ()
                               (display-line-numbers-mode 0)
                               (org-bullets-mode t)
                               (visual-line-mode t)
                               (choo/org-mode-keys)))))

(progn
  ;; Haskell-mode
  (dolist (pkg '(haskell-mode lsp-haskell lsp-mode lsp-ui))
    (unless (package-installed-p pkg)
      (package-install pkg)))
  (require 'lsp-haskell)
  ;; USE SAME VERSION WITH `ghc`
  ;; AND SET CORRECT PATH of `haskell-language-server-wrapper`
  (defvar hls-path "~/.ghcup/bin/haskell-language-server-wrapper")
  (setq lsp-haskell-server-path hls-path)
  (setq haskell-stylish-on-save t)
  (add-hook 'haskell-mode-hook #'lsp)
  (add-hook 'haskell-literate-mode-hook #'lsp))


(progn
  ;; OCaml-mode
  (dolist (pkg '(dune ocamlformat ocp-indent opam))
    (unless (package-installed-p pkg)
      (package-install pkg)))
  (require 'ocp-indent))


(progn
  ;; Zig-mode
  (unless (package-installed-p 'zig-mode)
    (package-install 'zig-mode))
  (require 'zig-mode))


(progn
  ;; Rust-mode
  (unless (package-installed-p 'rust-mode)
    (package-install 'rust-mode))
  (require 'rust-mode))


(progn
  ;; Erlang, Elixir
  (dolist (pkg '(alchemist elixir-mode eglot erlang))
    (unless (package-installed-p pkg)
      (package-install pkg)))
  (require 'eglot)
  (setq lsp-elixir-enable-inlay-hints t)
  (add-hook 'elixir-mode-hook 'eglot-ensure)
  (add-hook 'elixir-mode-hook (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))
  (add-to-list 'eglot-server-programs '(elixir-mode "~/.nix-profile/bin/elixir-ls"))) ;; path in NixOS home-manager


(progn
  ;; SBCL
  (dolist (pkg '(slime slime-company))
    (unless (package-installed-p pkg)
      (package-install pkg)))
  (require 'slime)
  (with-eval-after-load 'slime
    (let ((helper-path (expand-file-name "~/.quicklsp/slime-helper.el")))
      (when (file-exists-p helper-path)
	      (load helper-path)))
    (setq inferior-lisp-program "rlwrap sbcl"))
  (eval-after-load 'slime
    '(progn
       (require 'slime-autoloads)
       (slime-setup '(slime-fancy slime-company)))))


(progn
  ;; Nix-mode
  (unless (package-installed-p 'nix-mode)
    (package-install 'nix-mode))
  (require 'nix-mode))


(progn
  ;; No Line Numbers
  (add-hook 'term-mode-hook (lambda () (display-line-numbers-mode 0)))
  (add-hook 'eshell-mode-hook (lambda () (display-line-numbers-mode 0)))
  (add-hook 'dired-mode-hook (lambda () (display-line-numbers-mode 0))))


(progn
  ;; Hooks
  (defun setup-initial-windows ()
    "Split the window and open eshell in the bottom window."
    (interactive)
    (split-window-below)
    (other-window 1)
    (eshell)
    (other-window 1))
  ;; (add-hook 'after-init-hook 'setup-initial-windows)
  (add-hook 'before-save-hook (lambda () (whitespace-cleanup) (delete-trailing-whitespace))))


(progn
  ;; Basic settings
  (require 'cl-lib)
  (require 'whitespace)
  (setq-default display-line-numbers t)
  (setq-default message-log-max nil)
  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 2)
  (setq-default tab-always-indent 'complete)
  (setq whitespace-style '(face tabs tab-mark))
  (set-face-attribute 'whitespace-tab nil
                      :foreground "grey"
                      :background nil
                      :weight 'thin)
  (setq column-number-mode t)
  (setq font-lock-maximum-decoration t)
  (setq inhibit-startup-message t)
  (setq initial-scratch-message "")
  (setq make-backup-files nil)
  (setq resize-mini-windows nil)
  (setq require-final-newline t)
  (setq ring-bell-function 'ignore)
  (setq show-paren-style 'parenthesis)
  (setq scroll-preserve-screen-position 'always)
  (kill-buffer "*Messages*"))


(progn
  ;; Keybindings
  (defun split-window-below-and-move ()
    "Split the window below and move the cursor to the new window."
    (interactive)
    (split-window-below)
    (balance-windows)
    (other-window 1))
  (defun split-window-right-and-move ()
    "split the window right and move the curosr to the new window."
    (interactive)
    (split-window-right)
    (balance-windows)
    (other-window 1))
  (defun search-and-replace-current-word ()
    "Search for the current word and initiate a query-replace."
    (interactive)
    (let ((current-word (thing-at-point 'word)))
      (if current-word
          (progn
            (isearch-yank-string current-word)
            (isearch-exit)
            (query-replace current-word (read-string (format "Replace %s with: " current-word))))
        (message "No word at point."))))
  (defun replace-current-word-everywhere ()
    "Replace all instances of the current word in the buffer."
    (interactive)
    (let ((current-word (thing-at-point 'word)))
      (if current-word
          (let ((replacement (read-string (format "Replace %s with: " current-word))))
            (save-excursion
              (goto-char (point-min))
              (replace-string current-word replacement)))
        (message "No word at point."))))
  (global-prettify-symbols-mode t)
  (global-whitespace-mode t)
  (global-set-key [next] (lambda () (interactive) (scroll-up-command) (recenter)))
  (global-set-key [prior] (lambda () (interactive) (scroll-down-command) (recenter)))
  (global-set-key (kbd "C-n") (lambda () (interactive) (next-line) (recenter)))
  (global-set-key (kbd "C-p") (lambda () (interactive) (previous-line) (recenter)))
  (global-set-key (kbd "M-=") 'tab-bar-new-to)
  (global-set-key (kbd "M--") 'tab-bar-close-tab)
  (global-set-key (kbd "M-[ I") 'sp-backward-unwrap-sexp)
  (global-set-key (kbd "M-[ O") 'sp-backward-unwrap-sexp)
  (global-set-key (kbd "C-c r") 'search-and-replace-current-word)
  (global-set-key (kbd "C-c a") 'replace-current-word-everywhere)
  (global-set-key (kbd "C-x 2") 'split-window-below-and-move)
  (global-set-key (kbd "C-x 3") 'split-window-right-and-move)
  (global-set-key (kbd "C-h") 'delete-backward-char)
  (define-key minibuffer-local-map (kbd "C-h") 'delete-backward-char))
