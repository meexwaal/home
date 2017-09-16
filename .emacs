
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

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
;; jdee
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
 '(jdee-global-classpath (quote ("." "out" "$CLASSPATH")))
 '(jdee-key-bindings
   (quote
    (("[? ? ?]" . jdee-run-menu-run-applet)
     ("[? ? ?]" . jdee-build)
     ("[? ? ?]" . jdee-compile)
     ("[? ? ?]" . jdee-test-unittest)
     ("[? ? ?]" . jdee-debug)
     ("[? ? ?]" . jdee-find)
     ("[? ? ?]" . jdee-open-class-at-point)
     ("[? ? ?*]" . jdee-parse-fqn-to-kill-ring)
     ("[? ? ?#]" . jdee-stacktrace-buffer)
     ("[? ? ?w]" . jdee-archive-which)
     ("[? ? ?]" . jdee-backend-run)
     ("[? ? ?]" . jdee-gen-println)
     ("[? ? ?]" . jdee-help-browse-jdk-doc)
     ("[? ? ?]" . jdee-save-project)
     ("[? ? ?]" . jdee-project-update-class-list)
     ("[? ? ?]" . jdee-run)
     ("[? ? ?]" . speedbar-frame-mode)
     ("[? ? ?]" . jdee-jdb-menu-debug-applet)
     ("[? ? ?]" . jdee-help-symbol)
     ("[? ? ?]" . jdee-show-superclass-source)
     ("[? ? ?]" . jdee-open-class-at-point)
     ("[? ? ?]" . jdee-import-find-and-import)
     ("[? ? ?e]" . jdee-wiz-extend-abstract-class)
     ("[? ? ?f]" . jdee-gen-try-finally-wrapper)
     ("[? ? ?i]" . jdee-wiz-implement-interface)
     ("[? ? ?j]" . jdee-javadoc-autodoc-at-line)
     ("[? ? ?o]" . jdee-wiz-override-method)
     ("[? ? ?t]" . jdee-gen-try-catch-wrapper)
     ("[? ? ?z]" . jdee-import-all)
     ("[? ? ?]" . jdee-run-etrace-prev)
     ("[? ? ?]" . jdee-run-etrace-next)
     ("[(control c) (control v) (control ?.)]" . jdee-complete)
     ("[(control c) (control v) ?.]" . jdee-complete-menu))))
 '(jdee-run-applet-viewer "appletviewer")
 '(jdee-server-dir "~/.myJars")
 '(lpr-page-header-program "pr")
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (jump-char nixos-options nix-mode jdee web-mode undo-tree neotree magit key-chord browse-kill-ring ace-window))))

(column-number-mode)
(show-paren-mode)

;; Neotree
(add-hook 'after-init-hook 'neotree-show)
(setq neo-autorefresh nil) ; (autorefresh breaks things right now)

;; Movement
(global-set-key (kbd "C-o") 'ace-window)
(global-set-key (kbd "M-o") 'next-multiframe-window)
(global-set-key (kbd "M-k") 'avy-goto-word-or-subword-1)
(global-set-key (kbd "M-g") 'goto-line)

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
(global-set-key (kbd "M-l") 'undo-tree-redo) ; C-? would be great

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
  (global-set-key (kbd "C-c C-j") 'compile-latex))

;; ido-mode is neat
(ido-mode 1)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;; Make scratch blank
(setq initial-scratch-message nil)

;; Insert is stupid
(global-set-key (kbd "<insertchar>") 'end-of-line)
;; (global-set-key (kbd "C-<insertchar>") 'overwrite-mode)

;; Comment out a line
(global-set-key (kbd "M-'") 'comment-line)

;; Line numbers
(global-linum-mode t)

;; Key chord
(defun my-key-chord-fun ()
 ;(interactive) ; I'm not sure what this does but it works w/o it so Occam's razor
  (key-chord-mode 1)
  ;; You got lucky this time...
  ;; But figure out hooks and calling functions with parameters
  ;; (key-chord-define-global "[]" "[]\C-b")
  ;; (key-chord-define-global "{}" "{}\C-b")
  )
;(add-hook 'after-init-hook 'my-key-chord-fun)

;; jump-char
(global-set-key (kbd "C-f") 'jump-char-forward)
(global-set-key (kbd "C-b") 'jump-char-backward)

;; Java
;; Set the basic indentation for Java source files to two spaces.
(add-hook 'jdee-mode-hook '(lambda () (setq c-basic-offset 2)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(comint-highlight-prompt ((t (:inherit minibuffer-prompt))))
 '(minibuffer-prompt ((t (:background "color-236" :foreground "white" :box (:line-width -1 :color "red" :style released-button) :weight bold)))))
