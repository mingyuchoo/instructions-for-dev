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
   '(lsp-rust tuareg typescript-mode elisp-mode elisp-format flycheck-rust flycheck em-alias eshell treemacs-magit treemacs-projectile treemacs slime zig-mode vterm transpose-frame rust-mode opam ocp-indent ocamlformat nix-mode multiple-cursors lsp-ui lsp-haskell helm erlang editorconfig dune dotenv-mode alchemist))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))



(progn
  (defun my/setup-fonts ()
    (set-cursor-color "#FF0000")
    (set-face-attribute 'default nil :font (font-spec :family "Iosevka NF" :size 12))
    (set-fontset-font t 'hangul (font-spec :family "Nanum Myeongjo")))
  (add-hook 'after-init-hook #'my/setup-fonts))



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
        (defvar choo/home-directory "c:/Users/mingy/github/mingyuchoo")
        (setq default-directory choo/home-directory))
    (progn
      (defvar choo/home-directory (getenv "HOME"))
      (setq default-directory (concat choo/home-directory "/Dropbox/org-roam"))))
  (when (display-graphic-p)
    (setq initial-frame-alist '((width . 160) (height . 50))))
  (progn
    (setq inhibit-startup-message t)
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
  (global-set-key (kbd "C-x p") 'transpose-frame))



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
  (setq eshell-cmpl-cycle-completions nil)
  (setq eshell-cmpl-ignore-case t)
  (setq eshell-cmpl-autolist nil)
  (add-hook 'eshell-mode-hook
            (lambda ()
              (company-mode -1)
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
  ;; For Python Programming Language
  (dolist (pkg '(python-mode lsp-mode lsp-ui company flycheck))
    (unless (package-installed-p pkg)
      (package-install pkg)))
  (use-package python-mode
    :ensure t)
  (use-package lsp-mode
    :ensure t
    :hook (python-mode . lsp)
    :commands lsp)
  (use-package lsp-ui
    :ensure t
    :commands lsp-ui-mode
    :config
    (setq lsp-ui-doc-enable t)
    (setq lsp-ui-doc-position 'top)
    (setq lsp-ui-sideline-enable t))
  (use-package flycheck
    :ensure t
    :init (global-flycheck-mode))
  (use-package company
    :ensure t
    :hook (after-init . global-company-mode)
    :config
    (setq company-idle-delay 0.1)
    (setq company-minimum-prefix-length 1)))



( progn
  ;; For Typescript Programming Language
  (dolist (pkg '(typescript-mode lsp-mode lsp-ui company flycheck))
    (unless (package-installed-p pkg)
      (package-install pkg)))
  (use-package typescript-mode
    :ensure t)
  (use-package lsp-mode
    :ensure t
    :hook (typescript-mode . lsp)
    :commands lsp)
  (use-package lsp-ui
    :ensure t
    :commands lsp-ui-mode
    :config
    (setq lsp-ui-doc-enable t)
    (setq lsp-ui-doc-position 'top)
    (setq lsp-ui-sideline-enable t))
  (use-package flycheck
    :ensure t
    :init (global-flycheck-mode))
  (use-package company
    :ensure t
    :hook (after-init . global-company-mode)
    :config
    (setq company-idle-delay 0.1)
    (setq company-minimum-prefix-length 1)))



(progn
  ;; For Rust Programming Language
  (dolist (pkg '(rust-mode lsp-mode lsp-ui company flycheck flycheck-rust))
    (unless (package-installed-p pkg)
      (package-install pkg)))
  (use-package rust-mode
    :ensure t
    :hook ((rust-mode . lsp)
           (before-save . lsp-format-buffer)))
  (use-package lsp-mode
    :ensure t
    :hook (rust-mode . lsp)
    :commands lsp
    :config
    (setq lsp-rust-analyzer-server-command
          (list (or (executable-find "rust-analyzer")
                    (expand-file-name "~/.cargo/bin/rust-analyzer")
                    (expand-file-name "~/.cargo/bin/rust-analyzer.exe")))))
  (use-package lsp-ui
    :ensure t
    :commands lsp-ui-mode
    :config
    (setq lsp-ui-doc-enable t)
    (setq lsp-ui-doc-position 'top)
    (setq lsp-ui-sideline-enable t))
  (use-package flycheck
    :ensure t
    :init (global-flycheck-mode))
  (use-package company
    :ensure t
    :hook (after-init . global-company-mode)
    :config
    (setq company-idle-delay 0.1)
    (setq company-minimum-prefix-length 1)
    (add-to-list 'company-backends 'company-capf))
  (use-package flycheck-rust
    :ensure t
    :config
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)))



(progn
  ;; For Haskell Programming Language
  (dolist (pkg '(haskell-mode lsp-mode lsp-ui company flycheck lsp-haskell))
    (unless (package-installed-p pkg)
      (package-install pkg)))
  (use-package haskell-mode
    :ensure t
    :hook (haskell-mode . (lambda ()
                            (add-hook 'before-save-hook #'lsp-format-buffer nil t))))
  (use-package lsp-mode
    :ensure t
    :hook (haskell-mode . lsp)
    :commands lsp
    :config
    (setq lsp-haskell-server-path "haskell-language-server-wrapper"))
  (use-package lsp-ui
    :ensure t
    :commands lsp-ui-mode
    :config
    (setq lsp-ui-doc-enable t)
    (setq lsp-ui-doc-position 'top)
    (setq lsp-ui-sideline-enable t))
  (use-package flycheck
    :ensure t
    :init (global-flycheck-mode))
  (use-package company
    :ensure t
    :hook (after-init . global-company-mode)
    :config
    (setq company-idle-delay 0.1)
    (setq company-minimum-prefix-length 1)))



(progn
  ;; For OCaml Programming Language
  (dolist (pkg '(dune ocamlformat ocp-indent opam tuareg lsp-mode lsp-ui company flycheck))
    (unless (package-installed-p pkg)
      (package-install pkg)))
  (use-package tuareg
    :ensure t
    :hook (tuareg-mode . (lambda ()
                           (add-hook 'before-save-hook #'ocamlformat-before-save nil t))))
  (use-package lsp-mode
    :ensure t
    :hook (tuareg-mode . lsp)
    :commands lsp
    :config
    (setq lsp-ocaml-server-command '("ocamllsp")))
  (use-package lsp-ui
    :ensure t
    :commands lsp-ui-mode
    :config
    (setq lsp-ui-doc-enable t)
    (setq lsp-ui-doc-position 'top)
    (setq lsp-ui-sideline-enable t))
  (use-package flycheck
    :ensure t
    :init (global-flycheck-mode))
  (use-package company
    :ensure t
    :hook (after-init . global-company-mode)
    :config
    (setq company-idle-delay 0.1)
    (setq company-minimum-prefix-length 1)))



(progn
  ;; For Zig Programming Language
  (dolist (pkg '(zig-mode lsp-mode lsp-ui company flycheck))
    (unless (package-installed-p pkg)
      (package-install pkg)))
  (use-package zig-mode
    :ensure t
    :hook (zig-mode . (lambda ()
                        (add-hook 'before-save-hook #'zig-mode-format-buffer nil t))))
  (use-package lsp-mode
    :ensure t
    :hook (zig-mode . lsp)
    :commands lsp
    :config
    (setq lsp-zig-zls-executable "zls"))
  (use-package lsp-ui
    :ensure t
    :commands lsp-ui-mode
    :config
    (setq lsp-ui-doc-enable t)
    (setq lsp-ui-doc-position 'top)
    (setq lsp-ui-sideline-enable t))
  (use-package flycheck
    :ensure t
    :init (global-flycheck-mode))
  (use-package company
    :ensure t
    :hook (after-init . global-company-mode)
    :config
    (setq company-idle-delay 0.1)
    (setq company-minimum-prefix-length 1)))



(progn
  ;; For Erlang Programming Language
  (dolist (pkg '(erlang lsp-mode lsp-ui company flycheck))
    (unless (package-installed-p pkg)
      (package-install pkg)))
  (use-package erlang
    :ensure t
    :hook (erlang-mode . (lambda ()
                           (add-hook 'before-save-hook #'erlang-indent-current-buffer nil t))))
  (use-package lsp-mode
    :ensure t
    :hook (erlang-mode . lsp)
    :commands lsp
    :config
    (setq lsp-erlang-server-command '("erlang_ls")))
  (use-package lsp-ui
    :ensure t
    :commands lsp-ui-mode
    :config
    (setq lsp-ui-doc-enable t)
    (setq lsp-ui-doc-position 'top)
    (setq lsp-ui-sideline-enable t))
  (use-package flycheck
    :ensure t
    :init (global-flycheck-mode))
  (use-package company
    :ensure t
    :hook (after-init . global-company-mode)
    :config
    (setq company-idle-delay 0.1)
    (setq company-minimum-prefix-length 1)))



(progn
  ;; For Elixir Programming Language
  (dolist (pkg '(alchemist eglot elixir-mode lsp-mode lsp-ui company flycheck))
    (unless (package-installed-p pkg)
      (package-install pkg)))
  (require 'elixir-mode)
  (require 'eglot)
  (setq lsp-elixir-enable-inlay-hints t)
  (add-hook 'elixir-mode-hook 'eglot-ensure)
  (add-hook 'elixir-mode-hook (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))
  (add-to-list 'eglot-server-programs '(elixir-mode "~/.nix-profile/bin/elixir-ls")) ;; path in NixOS home-manager
  (use-package elixir-mode
    :ensure t)
  (use-package lsp-mode
    :ensure t
    :hook (elixir-mode . lsp)
    :commands lsp
    :config
    (setq lsp-elixir-server-command '("elixir-ls")))
  (use-package lsp-ui
    :ensure t
    :commands lsp-ui-mode
    :config
    (setq lsp-ui-doc-enable t)
    (setq lsp-ui-doc-position 'top)
    (setq lsp-ui-sideline-enable t))
  (use-package flycheck
    :ensure t
    :init (global-flycheck-mode))
  (use-package company
    :ensure t
    :hook (after-init . global-company-mode)
    :config
    (setq company-idle-delay 0.1)
    (setq company-minimum-prefix-length 1)))



(progn
  ;; For SBCL (Common Lisp) Programming Language
  (dolist (pkg '(slime slime-company lsp-mode lsp-ui company flycheck))
    (unless (package-installed-p pkg)
      (package-install pkg)))
  (with-eval-after-load 'slime
    (let ((helper-path (expand-file-name "~/.quicklsp/slime-helper.el")))
      (when (file-exists-p helper-path)
        (load helper-path)))
    (setq inferior-lisp-program "rlwrap sbcl"))
  (use-package slime
    :ensure t
    :hook (lisp-mode . (lambda ()
                         (add-hook 'before-save-hook #'slime-format-buffer nil t)))
    :config
    (setq slime-contribs '(slime-fancy)))
  (use-package slime-company
    :ensure t
    :after (slime company)
    :config
    (setq slime-company-completion 'fuzzy
          slime-company-after-completion 'slime-company-just-one-space))
  (eval-after-load 'slime
    '(progn
       (require 'slime-autoloads)
       (slime-setup '(slime-fancy slime-company))))
  (use-package lsp-mode
    :ensure t
    :hook (lisp-mode . lsp)
    :commands lsp)
  (use-package lsp-ui
    :ensure t
    :commands lsp-ui-mode
    :config
    (setq lsp-ui-doc-enable t)
    (setq lsp-ui-doc-position 'top)
    (setq lsp-ui-sideline-enable t))
  (use-package flycheck
    :ensure t
    :init (global-flycheck-mode))
  (use-package company
    :ensure t
    :hook (after-init . global-company-mode)
    :config
    (setq company-idle-delay 0.1)
    (setq company-minimum-prefix-length 1)))



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
  (global-set-key (kbd "C-<kanji>") 'set-mark-command)
  (global-set-key (kbd "C-h") 'delete-backward-char)
  (define-key minibuffer-local-map (kbd "C-h") 'delete-backward-char))
