(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(require 'package)
(require 'lsp)
(require 'lsp-haskell)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes '(deeper-blue))
 '(display-battery-mode t)
 '(display-time-mode t)
 '(global-display-column-numbers-mode t)
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   '(neotree dune opam ocamlformat vterm rust-mode yaml-mode haskell-mode lsp-ui lsp-mode))
 '(scroll-bar-mode nil)
 '(toggle-scroll-bar nil)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "red3")))))

(setq make-backup-files nil)
(setq font-lock-maximum-decoration t)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(setq ring-bell-function 'ignore)
(setq show-paren-style 'parenthesis)
(setq tab-width 4)
(setq neo-smart-open t)

(setq-default message-log-max nil)
(setq-default indent-tabs-mode nil)

(global-prettify-symbols-mode t)
(global-set-key [C-kanji] 'set-mark-command)
(global-set-key [f5] 'neotree-toggle)
(global-set-key [f6] 'neotree-hidden-file-toggle)
(global-set-key [f7] 'vterm)
(global-set-key [f8] 'vterm-other-window)

(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'before-save-hook (lambda() (delete-trailing-whitespace)))
(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'haskell-literate-mode-hook #'lsp)
;;(add-hook 'after-init-hook 'global-hl-line-mode)

(kill-buffer "*Messages*")


;; set OCaml language server
;(add-to-list 'load-path "$HOME/.opam/default/share/emacs/site-lisp")
;(require 'ocp-indent)

;; set window size
;;(add-to-list 'default-frame-alist '(height . 30))
;;(add-to-list 'default-frame-alist '(width . 120))
