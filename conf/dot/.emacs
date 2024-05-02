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
 '(column-number-mode t)
 '(custom-enabled-themes '(wheatgrass))
 '(display-battery-mode t)
 '(display-time-mode t)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 '(default ((t (:family "IosevkaTerm Nerd Font Mono" :foundry "DAMA" :slant normal :weight regular :height 120 :width normal))))
 '(cursor ((t (:background "red3")))))


(progn
  ;; Insall Emacs Packages
  (require 'package)
  (dolist (archive '(("melpa" . "https://melpa.org/packages/")
       ("melpa-stable" . "https://stable.melpa.org/packages/")))
    (add-to-list 'package-archives archive t))
  (when (not (string-equal system-type "windows-nt"))
      (progn
  (add-to-list 'exec-path (concat (getenv "HOME") "/.local/bin/"))
  (add-to-list 'load-path (concat (getenv "HOME") "/.opam/default/share/emacs/site-lisp"))))
  (package-initialize))



(if (string-equal system-type "windows-nt")
    (progn
      (defvar choo/home-directory "c:/Users/mingy")
      (setq default-directory choo/home-directory))
  (progn
    (defvar choo/home-directory (getenv "HOME"))
    (setq default-directory (concat choo/home-directory "/Dropbox/org-roam"))))


(progn
  ;; Transpose-frame
  (custom-set-variables
   '(package-selected-packages '(transpose-frame)))
  (require 'transpose-frame)
  (package-install-selected-packages)
  (global-set-key (kbd "C-x t") 'transpose-frame))


(progn
  ;; Dotenv-mode
  (custom-set-variables
   '(package-selected-packages '(dotenv-mode)))
   (require 'dotenv-mode)
   (package-install-selected-packages))


(progn
  ;; Editorconfig
  (custom-set-variables
   '(package-selected-packages '(editorconfig)))
   (require 'editorconfig)
   (package-install-selected-packages)
   (editorconfig-mode t))


(progn
  ;; Multiple-cursors
  (custom-set-variables
   '(package-selected-packages '(multiple-cursors)))
   (require 'multiple-cursors)
   (package-install-selected-packages)
   (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
   (global-set-key (kbd "C-S-c C-S-a") 'mc/mark-all-like-this)
   (global-set-key (kbd "C->") 'mc/mark-next-like-this)
   (global-set-key (kbd "C-<") 'mc/mark-previous-like-this))


(progn
  ;; Helm-mode
  (custom-set-variables
   '(package-selected-packages '(helm)))
  (package-install-selected-packages)
  (helm-mode t)
  (global-set-key (kbd "M-x") 'helm-M-x))


(progn
  ;; Vterm
  (custom-set-variables
   '(package-selected-packages '(vterm)))
   (package-install-selected-packages)
   (global-set-key (kbd "C-x v") 'vterm-toggle))


(progn
  ;; Neotree
  (custom-set-variables
   '(package-selected-packages '(neotree)))
   (package-install-selected-packages)
   (setq neo-smart-open t)
   (setq neo-window-width 40)
   ;;(add-hook 'emacs-startup-hook 'neotree-toggle)
   (global-set-key (kbd "C-x n") 'neotree-toggle))



(when (not (string-equal system-type "windows-nt"))
  (progn
    ;; Org-mode and Org-roam
    (custom-set-variables
     '(package-selected-packages '(ob-rust ob-typescript org-bullets org-roam)))
    (require 'org-bullets)
    (require 'org-roam)
    (require 'ob-rust)
    (require 'ob-typescript)
    (package-install-selected-packages)
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
  (custom-set-variables
   '(package-selected-packages '(haskell-mode lsp-haskell lsp-mode lsp-ui)))
  (require 'lsp-haskell)
  (package-install-selected-packages)
  ;; USE SAME VERSION WITH `ghc`
  ;; AND SET CORRECT PATH of `haskell-language-server-wrapper`
  (defvar hls-path "~/.ghcup/bin/haskell-language-server-wrapper")
  (setq lsp-haskell-server-path hls-path)
  (setq haskell-stylish-on-save t)
  (add-hook 'haskell-mode-hook #'lsp)
  (add-hook 'haskell-literate-mode-hook #'lsp))


(progn
  ;; OCaml-mode
  (custom-set-variables
   '(package-selected-packages '(dune ocamlformat ocp-indent opam)))
  (require 'ocp-indent)
  (package-install-selected-packages))


(progn
  ;; Zig-mode
  (custom-set-variables
   '(package-selected-packages '(zig-mode)))
  (package-install-selected-packages))


(progn
  ;; Rust-mode
  (custom-set-variables
   '(package-selected-packages '(rust-mode)))
  (package-install-selected-packages))


(progn
  ;; Erlang, Elixir
  (custom-set-variables
   '(package-selected-packages '(alchemist elixir-mode eglot erlang)))
  (package-install-selected-packages)
  (require 'eglot)
  (setq lsp-elixir-enable-inlay-hints t)
  (add-hook 'elixir-mode-hook 'eglot-ensure)
  (add-hook 'elixir-mode-hook (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))
  (add-to-list 'eglot-server-programs '(elixir-mode "~/.nix-profile/bin/elixir-ls"))) ;; path in NixOS home-manager


(progn
  ;; Nix-mode
  (custom-set-variables
   '(package-selected-packages '(nix-mode)))
  (package-install-selected-packages))


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
  (setq-default indent-tabs-mode t)
  (setq-default tab-width 2)
  (setq whitespace-style '(tabs tab-mark))
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
