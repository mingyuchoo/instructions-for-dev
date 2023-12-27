(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'exec-path "$HOME/.local/bin/")
(add-to-list 'load-path "$HOME/.opam/default/share/emacs/site-lisp") ;; set OCaml language server

(when (not package-archive-contents)
  (package-refresh-contents))


(custom-set-variables
 ;;'(cua-mode t nil (cua-base))
 '(custom-enabled-themes '(wheatgrass))
 '(display-battery-mode t)
 '(display-time-mode t)
 '(global-display-column-numbers-mode t)
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   '(
     dockerfile-mode
     haskell-mode
     groovy-mode
     gradle-mode
     rust-mode
     typescript-mode
     yaml-mode
     editorconfig
     eglot
     evil
     multiple-cursors
     neotree
     dune
     opam
     ocamlformat
     ocp-indent
     vterm
     lsp-haskell
     lsp-mode
     lsp-ui
     dune opam
     ))
 '(scroll-bar-mode nil)
 '(toggle-scroll-bar nil)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))


;; activate all the packages (in particular autoloads)
(package-initialize)
(package-install-selected-packages)


(require 'ocp-indent)
(require 'multiple-cursors)
(require 'editorconfig)
(require 'lsp-haskell)
(require 'evil)


(editorconfig-mode t)
;(evil-mode t)


(setq-default message-log-max nil)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)


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


(global-prettify-symbols-mode t)


(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-x n") 'neotree-toggle)
(global-set-key (kbd "C-x v") 'vterm-other-window)
(global-set-key (kbd "M-=") 'tab-bar-new-to)
(global-set-key (kbd "M--") 'tab-bar-close-tab)
;;(global-set-key (kbd "M-[") 'tab-bar-switch-to-prev-tab)
;;(global-set-key (kbd "M-]") 'tab-bar-switch-to-next-tab)


;; DO NOT INSERT IOIOIO WHEN FOCUS IN/OUT
(global-set-key (kbd "M-[ I") 'sp-backward-unwrap-sexp)
(global-set-key (kbd "M-[ O") 'sp-backward-unwrap-sexp)


;; for multiplecursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'haskell-literate-mode-hook #'lsp)


(kill-buffer "*Messages*")


(custom-set-faces
 '(cursor ((t (:background "red3")))))


;; Set default window size
(if (display-graphic-p)
    (progn
      (setq initial-frame-alist
	    '(
	      (width . 120)
	      (height . 60)))))
