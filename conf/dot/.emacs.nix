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
 '(scroll-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "red3")))))

(progn
  ;; Insall Emacs Packages
  (require 'package)
  (dolist (archive '(("melpa" . "https://melpa.org/packages/")
		     ("melpa-stable" . "https://stable.melpa.org/packages/")))
    (add-to-list 'package-archives archive t))
  (add-to-list 'exec-path "$HOME/.local/bin/")
  (add-to-list 'load-path "$HOME/.opam/default/share/emacs/site-lisp")
  (package-initialize))


(progn
  ;; Load Emacs Pakcages
  (require 'cl-lib))


(progn
  ;; Helm-mode
  (custom-set-variables
   '(package-selected-packages '(helm)))
  (package-install-selected-packages)
  (helm-mode t)
  (global-set-key (kbd "M-x") 'helm-M-x))



(add-hook 'before-save-hook (lambda ()
			      (whitespace-cleanup)
			      (delete-trailing-whitespace)))

(progn
  (global-set-key (kbd "C-h") 'delete-backward-char)
  )

(progn
  ;; Org-mode and Org-roam
  (custom-set-variables
   '(package-selected-packages '(org-bullets org-roam)))
  (package-install-selected-packages)
  (require 'org-bullets)
  (require 'org-roam)
  (defvar my-org-roam-directory "~/Dropbox/org-roam")
  (setq org-agenda-files (list my-org-roam-directory))
  (setq org-roam-directory (file-truename my-org-roam-directory))
  (setq org-startup-folded 'content)
  (setq org-startup-indented t)
  (setq org-hide-emphasis-markers t)
  (setq org-log-done 'time)
  (setq org-todo-keywords
	'((sequence "TODO" "DOING" "BLOCKED" "DONE")))
  (org-roam-db-autosync-mode)
  (defun my-org-mode-keys ()
    (local-set-key (kbd "C-c a") 'org-agenda)
    (local-set-key (kbd "C-c n f") 'org-roam-node-find)
    (local-set-key (kbd "C-c n i") 'org-roam-node-insert))
  (add-hook 'org-mode-hook (lambda ()
			     (org-bullets-mode t)
			     (visual-line-mode t)
			     (my-org-mode-keys)))
  )

(progn
  ;; Haskell-mode
  (custom-set-variables
   '(package-selected-packages '(haskell-mode lsp-haskell lsp-mode lsp-ui)))
  (package-install-selected-packages)
  (require 'lsp-haskell)
  (setq haskell-stylish-on-save t)
  (add-hook 'haskell-mode-hook #'lsp)
  (add-hook 'haskell-literate-mode-hook #'lsp))
