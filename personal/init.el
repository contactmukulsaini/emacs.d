;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;List packages to be installed
(defvar my-packages
  '(cider
	neotree
    rainbow-delimiters
	highlight-symbol
	aggressive-indent
	paredit
	magit
	;magit-gitflow
	
	;;Themes
	;monokai-theme
	darkokai-theme
	))

;;Install packages
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs auto fullscreen on start up
(add-hook 'window-setup-hook 'toggle-frame-fullscreen t)
;;Emacs disable menu bar on start up
(menu-bar-mode -1)
;;
(global-linum-mode 1)
;;Emacs disable default wide line number trip
(setq display-line-numbers-type nil)
;; Emacs set workspace directory
(cd "D:\workspace")
;; Emacs disable auto save of prelude
(setq prelude-auto-save nil)
;; Emacs Don't show native OS scroll bars for buffers because they're redundant
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(when (fboundp 'horizontal-scroll-bar-mode)
  (horizontal-scroll-bar-mode -1))
;; Emacs setting comments shortcut
(defun toggle-comment-on-line ()
  "Comment or uncomment current line."
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
(global-set-key (kbd "C-;") 'toggle-comment-on-line)
(define-key flyspell-mode-map (kbd "C-;") nil)
;; Emacs disable clean whitesapce on save
;(setq prelude-clean-whitespace-on-save nil)

;; Emacs customize scroll speed
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

;; Settings for neotree
(require 'neotree)
(global-set-key (kbd "`") 'neotree-toggle)
(global-set-key [f8] 'neotree-toggle)
(global-set-key (kbd "M-`") 'neotree-collapse-all)

;; Settings for rainbow-delimiters
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Settings of symbol highlighting
(require 'highlight-symbol)
(global-set-key (kbd "C-.") 'highlight-symbol-at-point)
(define-key flyspell-mode-map (kbd "C-.") nil)

;; Settings for aggressive indent
(require 'aggressive-indent)
(add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
(add-hook 'css-mode #'aggressive-indent-mode)
(add-hook 'clojure-mode-hook #'aggressive-indent-mode)

;;settings for paredit
(require 'paredit)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)

;; Settings for magit-gitflow
;(require 'magit-gitflow)
;(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)
;(setq magit-gitflow-popup-key "C-n")

;;
;(require 'magit)

;; Settings for Theme
;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;(load-theme 'monokai t)
(add-to-list 'custom-theme-load-path "~/.emacs.d/etc/themes")
(load-theme 'darkokai t)

;; Settings for hs-minor-mode
(add-hook 'prog-mode-hook #'hs-minor-mode)
(global-set-key (kbd "C-c a") 'hs-hide-all)
(global-set-key (kbd "C-c C-a") 'hs-show-all)
(global-set-key (kbd "C-c c") 'hs-toggle-hiding)