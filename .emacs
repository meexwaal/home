(require 'package)
;; My packages:
;; ace-window
;; async
;; auctex
;; avy
;; browse-kill-ring
;; company
;; company-statistics
;; dash
;; fill-column-indicator
;; git-commit
;; json-mode
;; json-reformat
;; json-snatcher
;; key-chord
;; magit
;; magit-popup
;; neotree
;; undo-tree
;; web-mode
;; with-editor

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-indent-level 2)
 '(LaTeX-item-indent 0)
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(lpr-page-header-program "pr")
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa-stable" . "http://stable.melpa.org/packages/")))))
(column-number-mode)
(show-paren-mode)

(add-hook 'after-init-hook 'neotree-show)

;; Movement
(global-set-key (kbd "M-o") 'ace-window)
(global-set-key (kbd "C-x C-o") 'next-multiframe-window)
(global-set-key (kbd "M-k") 'avy-goto-word-or-subword-1)

;; Swap regexp and normal replace
(global-set-key (kbd "M-%") 'query-replace-regexp)
(global-set-key (kbd "C-M-%") 'query-replace)

;; Company Autocomplete
;; (add-hook 'after-init-hook 'global-company-mode)
;; (add-hook 'after-init-hook 'company-statistics-mode)
;; (setq company-idle-delay 0) ;; make company complete immediately

;; Highlight bad whitespace and long lines
(setq whitespace-style '(face tabs lines-tail trailing)) ;; empty
(global-whitespace-mode t)

;; Remove trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Don't use tabs
(setq-default indent-tabs-mode nil)

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
;(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; Webmode coloring
(defun my-web-mode-hook ()
  (set-face-attribute 'web-mode-html-tag-face nil :foreground "Cyan")
  (set-face-attribute 'web-mode-html-tag-bracket-face nil :foreground "Pink7")
  (set-face-attribute 'web-mode-html-attr-name-face nil :foreground "Pink1")
  )
(add-hook 'web-mode-hook 'my-web-mode-hook)

;; Kill ring keybinding
(add-hook 'prog-mode-hook 'browse-kill-ring-default-keybindings)

;; Hide show
(add-hook 'prog-mode-hook 'hs-minor-mode)
(global-set-key (kbd "M-H") 'hs-hide-block)
(global-set-key (kbd "M-S") 'hs-show-block)

;; Undo tree
(add-hook 'after-init-hook 'global-undo-tree-mode)

;; Make '_' a character
(defun make-underscore-character ()
  (interactive)
  (modify-syntax-entry ?_ "w"))
(global-set-key (kbd "M--") 'make-underscore-character)

;; Compile LaTeX and show dvi
(defun compile-latex ()
  (interactive)
  (save-buffer)
  (defvar *file* (buffer-file-name))
  (defvar *dvi* (format "%s.%s"
                              (file-name-sans-extension *file*)
                              "dvi"))
  (shell-command (format "%s %s"
                         "latex"
                         *file*))
  (switch-to-buffer (file-name-nondirectory *dvi*))
  (find-alternate-file *dvi*))
(eval-after-load 'LaTeX-mode
  (global-set-key (kbd "C-;") 'compile-latex))

;; ido-mode is neat
(ido-mode 1)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;; Make scratch blank
(setq initial-scratch-message nil)

;; Insert is stupid
(global-set-key (kbd "<insertchar>") 'end-of-line)
;(global-set-key (kbd "C-<insertchar>") 'overwrite-mode)

;; Key chord
;(key-chord-mode 1)
(defun my-key-chord-fun ()
 ;(interactive) ; I'm not sure what this does but it works w/o it so Occam's razor
  (key-chord-mode 1)
  ;; You got lucky this time...
  ;; But figure out hooks and calling functions with parameters
  (key-chord-define-global "[]" "[]\C-b")
  (key-chord-define-global "{}" "{}\C-b"))
(add-hook 'after-init-hook 'my-key-chord-fun)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(comint-highlight-prompt ((t (:inherit minibuffer-prompt))))
 '(minibuffer-prompt ((t (:background "color-236" :foreground "white" :box (:line-width -1 :color "red" :style released-button) :weight bold)))))
