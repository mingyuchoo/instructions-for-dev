(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'exec-path "/home/mgch/.local/bin/")
(package-initialize)


(custom-set-variables
 '(custom-enabled-themes '(wheatgrass))
 '(display-battery-mode t)
 '(display-time-mode t)
 '(global-display-column-numbers-mode t)
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   '(eglot neotree dune opam ocamlformat vterm rust-mode yaml-mode haskell-mode lsp-ui lsp-mode))
 '(scroll-bar-mode nil)
 '(toggle-scroll-bar nil)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))

(custom-set-faces
 '(cursor ((t (:background "red3")))))


(setq-default message-log-max nil)
(setq-default indent-tabs-mode nil)


(setq make-backup-files nil)
(setq font-lock-maximum-decoration t)
(setq haskell-stylish-on-save t)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(setq ring-bell-function 'ignore)
(setq show-paren-style 'parenthesis)
(setq tab-width 4)
(setq neo-smart-open t)
(setq neo-window-width 30)


(global-prettify-symbols-mode t)

(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-x n") 'neotree-toggle)
;;(global-set-key [f6] 'neotree-hidden-file-toggle)
;;(global-set-key [f7] 'vterm)
(global-set-key (kbd "C-x v") 'vterm-other-window)

(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'before-save-hook (λ() (delete-trailing-whitespace)))
(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'haskell-literate-mode-hook #'lsp)
(add-hook 'after-init-hook 'global-hl-line-mode)

(kill-buffer "*Messages*")

;; set OCaml language server
;(add-to-list 'load-path "$HOME/.opam/default/share/emacs/site-lisp")
;(require 'ocp-indent)
