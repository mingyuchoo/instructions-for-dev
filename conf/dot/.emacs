(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'exec-path "$HOME/.local/bin/")
(add-to-list 'load-path "$HOME/.opam/default/share/emacs/site-lisp") ;; set OCaml language server


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Uncomment when you refresh contents
;;
;(when (not package-archive-contents)
;  (package-refresh-contents))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
(custom-set-variables
 '(column-number-mode t)
 '(custom-enabled-themes '(wheatgrass))
 '(display-battery-mode t)
 '(display-time-mode t)
 '(global-display-column-numbers-mode t)
 '(global-display-line-numbers-mode t)
 '(scroll-bar-mode nil)
 '(toggle-scroll-bar nil)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
 '(package-selected-packages
   '(cmake-mode
     dockerfile-mode
     dotenv-mode
     haskell-mode
     groovy-mode
     gradle-mode
     rust-mode
     typescript-mode
     yaml-mode org
     editorconfig
     eglot
     evil
     magit
     multiple-cursors
     neotree
     dune
     opam
     ocamlformat
     ocp-indent
     lsp-haskell
     lsp-mode
     lsp-ui
     dune
     opam
     org-roam
     helm
     transpose-frame))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; activate all the packages (in particular autoloads)
;;
(package-initialize)
(package-install-selected-packages)

(require 'transpose-frame)
(require 'org-roam)
(require 'dotenv-mode)
(require 'ocp-indent)
(require 'multiple-cursors)
(require 'editorconfig)
(require 'lsp-haskell)
(require 'evil)
(require 'cl-lib) ;; for ELISP

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; mode activation
;;
(helm-mode t)
(editorconfig-mode t)
;(evil-mode t)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org-mode, Org-roam
;;
; (make-directory "~/Dropbox/org-roam")
(setq org-agenda-files '("~/Dropbox/org-roam"))
(setq org-roam-directory (file-truename "~/Dropbox/org-roam"))
(setq org-startup-folded 'content)
(setq org-startup-indented t)
(setq find-file-visit-truename t)
(setq org-log-done 'time)
(setq org-todo-keywords
      '((sequence "TODO" "DOING" "BLOCKED" "DONE")))
(org-roam-db-autosync-mode)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; gloval variable
;;
; (setq default-directory "~/Dropbox/org-roam")
(setq-default message-log-max nil)
(setq-default indent-tabs-mode nil)
(setq-default standard-indent 2)
(setq-default tab-width 2)

(setq column-number-mode t)
(setq tab-width 4)
(setq make-backup-files nil)
(setq font-lock-maximum-decoration t)
(setq haskell-stylish-on-save t)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(setq require-final-newline t)
(setq ring-bell-function 'ignore)
(setq show-paren-style 'parenthesis)
(setq neo-smart-open t)
(setq neo-window-width 40)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;(global-prettify-symbols-mode t)
(global-set-key (kbd "M-x") 'helm-M-x)

(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c n f") 'org-roam-node-find)
(global-set-key (kbd "C-c n i") 'org-roam-node-insert)

(global-set-key (kbd "C-x n") 'neotree-toggle)
(global-set-key (kbd "C-x t") 'transpose-frame)
(global-set-key (kbd "M-=") 'tab-bar-new-to)
(global-set-key (kbd "M--") 'tab-bar-close-tab)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-S-c C-S-a") 'mc/mark-all-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)

;; DO NOT USE THESE LINES
;(global-set-key (kbd "M-[") 'tab-bar-switch-to-prev-tab)
;(global-set-key (kbd "M-]") 'tab-bar-switch-to-next-tab)

;; THESE LINES PREVENT INSERTING "IOIOIO" WHEN FOCUS IN/OUT
(global-set-key (kbd "M-[ I") 'sp-backward-unwrap-sexp)
(global-set-key (kbd "M-[ O") 'sp-backward-unwrap-sexp)

(global-set-key (kbd "C-h") 'delete-backward-char)
(define-key minibuffer-local-map (kbd "C-h") 'delete-backward-char)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; hooks
;;
(add-hook 'emacs-startup-hook 'neotree-toggle)
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'haskell-literate-mode-hook #'lsp)


(kill-buffer "*Messages*")

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Cursor, Font
;;
(custom-set-faces
 '(default ((t (:family "Zed Mono" :foundry "nil" :slant normal :weight regular :height 120 :width normal))))
 '(cursor ((t (:background "red3")))))

;(if (display-graphic-p)
;    (progn
;      (setq initial-frame-alist
;       '(
;        (width . 120)
;        (height . 60)))))
