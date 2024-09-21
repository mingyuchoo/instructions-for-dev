;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Mingyu Choo"
      user-mail-address "mingyuchoo@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)
;; [doom-one, doom-dracula, doom-nord, doom-solarized-light, doom-gruvbox]

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


;; Activate emacs keybindings
;;(setq evil-default-state 'emacs)


;; Cursors
(use-package! evil-terminal-cursor-changer
  :hook (tty-setup . evil-terminal-cursor-changer-activate))
(setq evil-motion-state-cursor 'box)  ; █
(setq evil-visual-state-cursor 'box)  ; █
(setq evil-normal-state-cursor 'box)  ; █
(setq evil-insert-state-cursor 'bar)  ; ⎸
(setq evil-emacs-state-cursor 'hbar)  ; _


;; no startup message
(setq inhibit-startup-message t)
(setq initial-scratch-message "")


;; remove *messages* from the buffer
(setq-default message-log-max nil)
(kill-buffer "*Messages*")


;; resize neotree with
(setq neo-window-width 40)


;; set stylish-haskell for Haskell
(setq haskell-stylish-on-save t)


;; The SBCL binary and command-line arguments
(after! slime
  (load (expand-file-name "~/.quicklisp/slime-helper.el"))
  (setq inferior-lisp-program "rlwrap sbcl"))


(progn
  ;; Org-mode and Org-roam
  (require 'org-bullets)
  (setq org-startup-folded 'content)
  (setq org-startup-indented t)
  (setq org-hide-emphasis-markers t)
  (setq org-log-done 'time)
  (setq org-todo-keywords
        '((sequence "TODO" "DOING" "BLOCKED" "DONE"))))


;; Encoding
(progn
  (set-language-environment "UTF-8")
  (set-default-coding-systems 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (prefer-coding-system 'utf-8))


;; Eshell
(progn
  ;;(map! :leader
  ;;      :desc "Open eshell"
  ;;      "o s" #'eshell)
  (set-eshell-alias! "ll"    "ls -l $*"
                     "la"    "ls -la $*"
                     "mkdir" "mkdir -p $*"
                     "clear" "eshell/clear-scrollback"
                     "open"  "find-file $1"))


;; Doom keybindings for Treemacs
(progn
  (after! treemacs
    (treemacs-follow-mode 1))
  (map! :leader
        :desc "Select Treemacs window"
        "t t" #'treemacs-select-window)
  (map! :leader
        :desc "Toogle Treemacs follow mode"
        "t f" #'treemacs-follow-mode))


