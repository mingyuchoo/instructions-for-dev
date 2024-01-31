(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes '(deeper-blue))
 '(display-battery-mode t)
 '(display-time-mode t)
 '(font-use-system-font t)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Zed Mono" :foundry "nil" :slant normal :weight regular :height 110 :width normal))))
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
  ;; Evil-mode
  (custom-set-variables
    '(package-selected-packages '(evil undo-tree)))
  (package-install-selected-packages)
  (require 'evil)
  (evil-mode t)
  (define-key evil-normal-state-map (kbd "j") '(lambda () (interactive) (next-line) (recenter)))
  (define-key evil-normal-state-map (kbd "k") '(lambda () (interactive) (previous-line) (recenter))))


(progn
  ;; Transpose-frame
  (custom-set-variables
   '(package-selected-packages '(transpose-frame)))
   (package-install-selected-packages)
   (require 'transpose-frame)
   (global-set-key (kbd "C-x t") 'transpose-frame))

(progn
  ;; Dotenv-mode
  (custom-set-variables
   '(package-selected-packages '(dotenv-mode)))
   (package-install-selected-packages)
   (require 'dotenv-mode))


(progn
  ;; Editorconfig
  (custom-set-variables
   '(package-selected-packages '(editorconfig)))
   (package-install-selected-packages)
   (require 'editorconfig)
   (editorconfig-mode t))


(progn
  ;; Multiple-cursors
  (custom-set-variables
   '(package-selected-packages '(multiple-cursors)))
   (package-install-selected-packages)
   (require 'multiple-cursors)
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
     '(package-selected-packages '(org-bullets org-roam)))
    (package-install-selected-packages)

    (require 'org-bullets)
    (require 'org-roam)
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
  (package-install-selected-packages)
  (require 'lsp-haskell)
  (setq haskell-stylish-on-save t)
  (add-hook 'haskell-mode-hook #'lsp)
  (add-hook 'haskell-literate-mode-hook #'lsp))


(progn
  ;; OCaml-mode
  (custom-set-variables
   '(package-selected-packages '(dune ocamlformat ocp-indent opam)))
  (package-install-selected-packages)
  (require 'ocp-indent))

(progn
  ;; Zig-mode
  (custom-set-variables
   '(package-selected-package '(zig-mode)))
  (package-install-selected-packages))


(progn
  ;; Hooks
  (add-hook 'before-save-hook (lambda () (whitespace-cleanup) (delete-trailing-whitespace)))
  (add-hook 'term-mode-hook (lambda () (display-line-numbers-mode 0)))
  (add-hook 'eshell-mode-hook (lambda () (display-line-numbers-mode 0))))


(progn
  ;; Basic settings
  (require 'cl-lib)
  (setq-default display-line-numbers 'relative)
  (setq-default message-log-max nil)
  (setq-default indent-tabs-mode nil)
  (setq-default standard-indent 2)
  (setq-default tab-width 2)
  (setq column-number-mode t)
  (setq font-lock-maximum-decoration t)
  (setq inhibit-startup-message t)
  (setq initial-scratch-message "")
  (setq make-backup-files nil)
  (setq require-final-newline t)
  (setq ring-bell-function 'ignore)
  (setq show-paren-style 'parenthesis)
  (setq tab-width 2)
  (setq scroll-preserve-screen-position 'always)
  (kill-buffer "*Messages*"))

(progn
  ;; Keybindings
  (global-set-key [next] (lambda () (interactive) (scroll-up-command) (recenter)))
  (global-set-key [prior] (lambda () (interactive) (scroll-down-command) (recenter)))
  (global-set-key (kbd "C-n") (lambda () (interactive) (next-line) (recenter)))
  (global-set-key (kbd "C-p") (lambda () (interactive) (previous-line) (recenter)))
  (global-set-key (kbd "M-=") 'tab-bar-new-to)
  (global-set-key (kbd "M--") 'tab-bar-close-tab)
  (global-set-key (kbd "M-[ I") 'sp-backward-unwrap-sexp)
  (global-set-key (kbd "M-[ O") 'sp-backward-unwrap-sexp)
  (global-set-key (kbd "C-h") 'delete-backward-char)
  (define-key minibuffer-local-map (kbd "C-h") 'delete-backward-char))
