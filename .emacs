
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)
;; My packages:
;; 0xc
;; 2048-game
;; ace-window
;; auctex
;; avy
;; browse-kill-ring
;; company
;; company-irony
;; dash
;; epl
;; flycheck
;; flycheck-irony
;; git-commit
;; irony
;; irony-eldoc
;; jdee
;; json-mode
;; json-reformat
;; json-snatcher
;; jump-char
;; key-chord
;; magit
;; magit-popup
;; neotree
;; rust-mode
;; rust-playground
;; undo-tree
;; web-mode
;; yasnippet

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
 '(display-time-string-forms
   (quote
    ((propertize
      (format-time-string
       (or display-time-format
           (if display-time-24hr-format "%H:%M" "%-I:%M%p"))
       now)
      (quote help-echo)
      (format-time-string "%a %b %e, %Y" now)
      (quote face)
      (quote bold)))))
 '(ido-auto-merge-work-directories-length -1)
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
 '(markdown-command "pandoc")
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (persp-mode autopair highlight-doxygen cuda-mode 0xc 2048-game avy company company-irony flycheck flycheck-irony irony irony-eldoc json-mode json-reformat json-snatcher multi-term yasnippet markdown-mode tldr matlab-mode jump-char nixos-options nix-mode jdee web-mode undo-tree neotree magit key-chord browse-kill-ring ace-window)))
 '(persp-keymap-prefix "p")
 '(ring-bell-function (quote ignore))
 '(term-bind-key-alist
   (quote
    (("M-e" . term-send-esc)
     ("C-p" . previous-line)
     ("C-n" . next-line)
     ("C-s" . isearch-forward)
     ("M-r" . isearch-backward)
     ("M-p" . term-send-up)
     ("M-n" . term-send-down)
     ("C-h" . term-send-backward-kill-word)
     ("M-DEL" . term-send-backward-kill-word)
     ("<C-left>" . term-send-backward-word)
     ("<C-right>" . term-send-forward-word))))
 '(vc-follow-symlinks t)
 '(verilog-auto-inst-param-value t)
 '(verilog-auto-inst-vector nil)
 '(verilog-auto-lineup (quote all))
 '(verilog-auto-newline (quote nil))
 '(verilog-auto-save-policy nil)
 '(verilog-auto-template-warn-unused t)
 '(verilog-case-indent 2)
 '(verilog-cexp-indent 2)
 '(verilog-highlight-grouping-keywords t)
 '(verilog-highlight-modules t)
 '(verilog-indent-level 2)
 '(verilog-indent-level-behavioral 2)
 '(verilog-indent-level-declaration 2)
 '(verilog-indent-level-module 2))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               ;;
;;      Common Keybindings       ;;
;;                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Mac keys
;; https://www.emacswiki.org/emacs/EmacsForMacOS#toc31
;; (setq mac-command-modifier 'meta)
;; (setq mac-right-command-modifier 'control)
;; (setq mac-control-modifier 'super)

;; Move arrow keys
(define-key key-translation-map (kbd "M-j") (kbd "<left>"))
(define-key key-translation-map (kbd "M-l") (kbd "<right>"))
(define-key key-translation-map (kbd "M-i") (kbd "<up>"))
(define-key key-translation-map (kbd "M-k") (kbd "<down>"))
(define-key key-translation-map (kbd "C-M-j") (kbd "C-<left>"))
(define-key key-translation-map (kbd "C-M-l") (kbd "C-<right>"))
(define-key key-translation-map (kbd "C-M-i") (kbd "C-<up>"))
(define-key key-translation-map (kbd "C-M-k") (kbd "C-<down>"))

;; Credit: https://stackoverflow.com/a/683575
(defvar common-keys-minor-mode-map
  (let ((map (make-sparse-keymap)))
    ;; AltGr is mapped to control, which is weird
    (define-key map (kbd "M-SPC") 'set-mark-command)
    (define-key map (kbd "M-w") 'kill-ring-save)
    (define-key map (kbd "C-w") 'kill-region)
    (define-key map (kbd "C-y") 'yank-pop)
    (define-key map (kbd "M-y") 'yank)
    (define-key map (kbd "C-5") 'query-replace-regexp) ; Previously C-]
    (define-key map (kbd "C-6") 'delete-indentation)   ; Previously C-^
    ;; (define-key map (kbd "C-]") 'query-replace-regexp) ; Functionally C-5
    ;; (define-key map (kbd "C-^") 'delete-indentation)   ; Functionally C-6
    (define-key map (kbd "M-u") 'universal-argument)
    (define-key map (kbd "M-N") 'forward-list)
    (define-key map (kbd "M-P") 'backward-list)

    ;; Other
    (define-key map (kbd "M-a") 'back-to-indentation)
    (define-key map (kbd "M-m") 'kill-line)

    ;; Keybindings that don't work because of my keyboard, probably
    ; (define-key map (kbd "C-<") 'beginning-of-buffer)
    ; (define-key map (kbd "C->") 'end-of-buffer)

    map)
  "common-keys-minor-mode keymap")

(define-minor-mode common-keys-minor-mode
  "A minor mode to ensure certain bindings aren't overridden."
  :init-value t)

(common-keys-minor-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               ;;
;;       Non-package config      ;;
;;                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Make scratch blank
(setq initial-scratch-message nil)
(setq initial-major-mode 'fundamental-mode)

;; Insert is stupid on some keyboards
;; (global-set-key (kbd "<insertchar>") 'end-of-line)
;; (global-set-key (kbd "C-<insertchar>") 'overwrite-mode)

;; Comment out a line
(global-set-key (kbd "M-'") 'comment-line)

;; Line numbers
(global-linum-mode t)

;; Nice things
(column-number-mode)
(show-paren-mode)

;; Ask y-or-n instead of yes-or-no
(defalias 'yes-or-no-p 'y-or-n-p)

;; Don't ask when reverting buffers
(setq revert-without-query (list ".*"))

;; Disable asking yes-or-no for certain functions
;; (defadvice revert-buffer (around auto-confirm compile activate)
;;   (flet ((yes-or-no-p (&rest args) t) (y-or-n-p (&rest args) t)) ad-do-it))

;; Tramp and remote access
(setq tramp-default-method "ssh")

(defun open-remote (host directory)
  (interactive)
  ;; TODO: replace multi-term with shell?
  ;; (if (fboundp 'multi-term-remote)
  ;;     (multi-term-remote host)
  ;;     (message "multi-term-remote not defined"))
  (split-window-horizontally)
  (find-file (concat "/ssh:" host ":" directory)))

(defun 213-remote ()
  (interactive)
  (open-remote "shark" "private/213/"))

(defun parallel-remote ()
  (interactive)
  (open-remote "parallel" "private/418/"))

(defun latedays-remote ()
  (interactive)
  (open-remote "latedays" "~"))

(defun ece-remote ()
  (interactive)
  (open-remote "ece" "Private/447/"))

(defun ece-git-remote ()
  (interactive)
  (open-remote "msjohnso@linux.ece.cmu.edu" "Private/447/"))

(defun andrew-remote ()
  (interactive)
  (open-remote "andrew" "private/"))

(defun os-remote ()
  (interactive)
  (open-remote "andrew" "cur"))

(defun multi-term-in-directory ()
  (interactive)
  (if (fboundp 'multi-term-remote)
      (let ((cur-dir default-directory))
        (progn
          ; Bind the user+host and the directory of the current file
          (string-match "^/ssh:\\([^:]+\\):\\(.*\\)$" cur-dir)
          ; Open a terminal to the current host
          (multi-term-remote (match-string 1 cur-dir))
          ; cd to the open directory
          (term-send-raw-string (concat "cd " (match-string 2 cur-dir) "\n"))
          )
        )
    (message "multi-term-remote not defined")))

;; Highlight bad whitespace and long lines
(setq whitespace-style '(face tabs lines-tail trailing)) ;; empty
(global-whitespace-mode t)

;; Remove trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Spacing
(setq-default indent-tabs-mode nil) ; Don't use tabs
(add-hook 'c-mode-hook '(lambda () (setq c-basic-offset 4)))
(add-hook 'c++-mode-hook '(lambda () (setq c-basic-offset 4)))

;; ido-mode is neat
(ido-mode 1)

;; Show the time in the mode line
(display-time)

;; Find file at point
(global-set-key (kbd "C-x C-d") 'find-file-at-point)

;; Enable C-x C-l and C-x C-u for downcase/upcase region
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Highlight doxygen comments in C/C++ and assembly
(require 'highlight-doxygen)
(add-hook 'c-mode-hook 'highlight-doxygen-mode)
(add-hook 'c++-mode-hook 'highlight-doxygen-mode)
(add-hook 'asm-mode-hook 'highlight-doxygen-mode)

;; Enable autopair for C and C++
;; (add-hook 'c-mode-hook 'autopair-mode)
;; (add-hook 'c++-mode-hook 'autopair-mode)

;;; @todo finish this
;; ;; Change the header template
;; ; Iterate through auto-insert-alist
;; (dolist (elt auto-insert-alist)
;;   ; If this elt is the header entry
;;   (if (string= (cdr (nth 0 elt)) "C / C++ header")
;;       ; Then find #endif and change it
;;       ()
;;     (nil))
;;   )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               ;;
;;        Custom functions       ;;
;;                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Scroll
;; Scroll one line at a time (less "jumpy" than defaults)
;(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
;(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
;(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
(defun my-scroll-up ()
  (interactive)
  (scroll-down -1)
;  (next-line)
  )
(defun my-scroll-down ()
  (interactive)
  (scroll-down 1)
;  (previous-line)
  )
(global-set-key (kbd "M-<down>") 'my-scroll-up)
(global-set-key (kbd "M-<up>") 'my-scroll-down)

;; Smart backspace
;; Inspired by https://stackoverflow.com/a/28227677
;; space = [:space:]
;; word = [:alnum:]
;; semiword = [^[:space:][:alnum:]]
;; Desired bevahior:
;;   Start of line -> one backspace or maybe delete all preceding empty lines
;;   Only whitespace between start of line and point -> delete to start
;;   word, 0-2 semiword, 0-2 spaces, 0-1 semiwords -> delete to start of word
;;   (space or start), semiword (where it doesn't conflict with above) OR
;;   3+ semiword, 0-2 spaces -> delete to start of semiword
;;   3+ spaces after non-space -> delete space chars
(defun my-delete-back ()
  (interactive)
  (if (bolp)  ; beginnning of line, just delete 1
      (backward-delete-char 1) ;; This is separate from the case below
                               ;; in case you want to change it later
    (if (string-match "^[[:space:]]*$"
                      (buffer-substring (point-at-bol) (point)))
        (delete-region (point-at-bol) (point))
      (if (string-match "[[:alnum:]]+[^[:space:][:alnum:]]\\{0,2\\}[[:space:]]\\{0,2\\}[^[:space:][:alnum:]]?$"
                        (buffer-substring (point-at-bol) (point)))
          (delete-region (+ (match-beginning 0) (point-at-bol)) (point))
        (if (string-match "\\(^\\|[[:space:]]\\|[^[:space:][:alnum:]]\\{2\\}\\)[^[:space:][:alnum:]]+[[:space:]]\\{0,2\\}$" ;ew
                          (buffer-substring (point-at-bol) (point)))
            (delete-region (+ 1 (match-beginning 0) (point-at-bol)) (point))
          (replace-regexp "[[:space:]]*$" "" nil (point-at-bol) (point))
          ))))) ;; TODO: apparently replace-regexp is not the way to go

(global-set-key (kbd "M-DEL") 'my-delete-back)
(global-set-key (kbd "C-<backspace>") 'my-delete-back)
(global-set-key (kbd "C-h") 'my-delete-back) ; C-h = C-backspace
(global-set-key (kbd "M-h") 'kill-word)

;; Disable all minor modes for quicker pasting
(defun paste-disable-active-minor-modes ()
  "Disables all active minor modes and saves a list to paste-active-minor-modes"
  (interactive)
  (let ((active-minor-modes))
    (mapc (lambda (mode) (condition-case nil
                             (if (and (symbolp mode) (symbol-value mode))
                                 (add-to-list 'active-minor-modes mode))
                           (error nil) ))
          minor-mode-list)
    (setq paste-active-minor-modes active-minor-modes)
    (mapc (lambda (mode) (funcall mode -1)) active-minor-modes)
    ))
(defun paste-enable-active-minor-modes ()
  "Enables all minor modes in paste-active-minor-modes"
  (interactive)
  (mapc (lambda (mode) (funcall mode 1)) paste-active-minor-modes)
  (setq paste-active-minor-modes nil)
  )

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
  (local-set-key (kbd "C-c C-j") 'compile-latex))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               ;;
;;         Package config        ;;
;;                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Movement
(global-set-key (kbd "M-o") 'next-multiframe-window)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "C-o") 'ace-window)
(global-set-key (kbd "C-k") 'avy-goto-word-or-subword-1)

;; Revert buffer shortcut
(global-set-key (kbd "H-r") 'revert-buffer)

;; Align-regexp shortcuts
(global-set-key (kbd "H-;") 'align-regexp) ; General case
(defun align-c-comments ()
  (interactive)
  (align-regexp (region-beginning) (region-end) "\\(\\s-*\\)/"))
(global-set-key (kbd "H-/") 'align-c-comments) ; Align /

;; xref (jump to definition)
(substitute-key-definition
 'xref-find-definitions 'xref-find-definitions-other-window global-map)
;; xref moves around windows in an inconsistent way. We want the
;; definition to open in the "next" window. However, if the reference
;; is ambiguous, xref opens a buffer in the "next" window to let you
;; pick, then opens the reference in the window after that. With only
;; two windows, this replaces the source buffer with the definition
;; and leaves the xref buffer on the screen. This is a janky, but
;; mostly unobtrusive, fix. When we go to a reference from the xref
;; buffer, do our best to reconfigure the buffers to how they were
;; before, then change the xref buffer to the definition
(defun xref-goto-xref-close ()
  (interactive)
  ;; Go to the reference
  (xref-goto-xref)
  (let ((defbuf (current-buffer)))
    ;; Change this window back to what it previously showed.
    ;; TODO this isn't always correct
    (previous-buffer)

    ;; Change to the xref window
    (select-window (get-buffer-window "*xref*"))

    ;; Change the buffer to the definition
    (switch-to-buffer defbuf)
    )

  ;; Nuke the xref buffer
  (kill-buffer "*xref*")
  )
(with-eval-after-load 'xref
  (substitute-key-definition
   'xref-goto-xref 'xref-goto-xref-close xref--xref-buffer-mode-map)
  (substitute-key-definition
   'xref-goto-xref 'xref-goto-xref-close xref--button-map) ;; Why, xmap, why?
  )


;; Neotree
;(add-hook 'after-init-hook 'neotree-show) ; Show on startup
;(setq neo-autorefresh nil) ; (autorefresh breaks things in some version)
(global-set-key (kbd "<f9>") 'neotree-toggle)

;; Webmode coloring
;; (defun my-web-mode-hook ()
;;   (set-face-attribute 'web-mode-html-tag-face nil :foreground "Cyan")
;;   (set-face-attribute 'web-mode-html-tag-bracket-face nil :foreground "Pink7")
;;   (set-face-attribute 'web-mode-html-attr-name-face nil :foreground "Pink1")
;;   )
;; (add-hook 'web-mode-hook 'my-web-mode-hook)

;; Kill ring keybinding
(add-hook 'prog-mode-hook 'browse-kill-ring-default-keybindings)

;; Hide show
(add-hook 'prog-mode-hook 'hs-minor-mode)
(global-set-key (kbd "M-H") 'hs-toggle-hiding)

;; Undo tree
(add-hook 'after-init-hook 'global-undo-tree-mode)
(global-set-key (kbd "M-r") 'undo-tree-redo)
(global-set-key (kbd "M-f") 'undo-tree-undo)

;; Rust setup
;; (defun my-rust-config ()
;;   (local-set-key (kbd "C-c C-v") 'rust-compile))
;; (add-hook 'rust-mode-hook 'my-rust-config)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

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

;; persp-mode
(with-eval-after-load "persp-mode"
  ;; Recommended settings
  (setq wg-morph-on nil)
  (setq persp-autokill-buffer-on-remove 'kill-weak)

  ;; Make switching buffers use current perspective
  ;; (setq persp-hook-up-emacs-buffer-completion t) ;; OBSOLETE
  (persp-set-read-buffer-function t)
  (persp-set-ido-hooks t)

  (defvar persp-mode-functions-to-advise
    '(next-buffer
      previous-buffer
      ido-switch-buffer
      )
    "List of functions which need additional advising when using `persp-mode'.")

  (defun persp-mode-wrapper (wrapped-buffer-command &rest r)
    "Wrapper for commands which need advising for use with `persp-mode'.
Only for use with `advice-add'."
    (with-persp-buffer-list () (apply wrapped-buffer-command r)))

  (defun persp-mode-setup-advice ()
    "Adds or removes advice on functions in `persp-mode-functions-to-advise'."
    (cl-loop for func in persp-mode-functions-to-advise
             do (if persp-mode
                    (advice-add func :around #'persp-mode-wrapper)
                  (advice-remove func #'persp-mode-wrapper))))

  (add-hook 'persp-mode-hook #'persp-mode-setup-advice)

  ;; Turn off automatically opening or saving anything
  (setq persp-auto-save-opt 0)
  (setq persp-auto-resume-time -1)
  (setq persp-auto-save-persps-to-their-file nil)

  ;; Add buffers without files (like dired) to perspective
  (setq persp-add-buffer-on-after-change-major-mode t)
  ;; (add-hook 'persp-common-buffer-filter-functions
  ;;           ;; TODO there is also `persp-add-buffer-on-after-change-major-mode-filter-functions'
  ;;           #'(lambda (b) (string-prefix-p "*" (buffer-name b))))
  )

;; Irony mode config
;; Setup instructions (from https://github.com/Sarcasm/irony-mode):
;; sudo apt install libclang-dev cmake
;; M-x irony-install-server
;(add-hook 'c++-mode-hook 'irony-mode)
;(add-hook 'c-mode-hook 'irony-mode)
;(add-hook 'objc-mode-hook 'irony-mode)
;; (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; Autocomplete
;(add-hook 'after-init-hook 'global-company-mode)
;(setq company-global-modes '(not text-mode))
;(add-hook 'c++-mode-hook 'company-mode)
;(add-hook 'c-mode-hook 'company-mode)
;; (with-eval-after-load 'company
;;   (setq company-idle-delay nil)                  ; Don't autocomplete
;;   (global-set-key (kbd "M-.") 'company-complete) ; Complete when key pressed
;;   (setq company-show-numbers t)                  ; Number suggestions
;;   (setq company-selection-wrap-around t)         ; Wrap in suggestion menu
;;   (setq company-tooltip-limit 20)                ; Max number of suggestions
;;   (setq completion-styles ; Make company complete substrings and initials (this may not be supported by irony I'm not sure)
;;         '(basic partial-completion emacs22 substring initials))
;;   )

;; Change company colors
;; (require 'color)
;; (let ((bg (face-attribute 'default :background)))
;;   (custom-set-faces
;;    `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 2)))))
;;    `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
;;    `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
;;    `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
;;     `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))

;; Syntax checking
;(add-hook 'c++-mode-hook 'flycheck-mode)
;(add-hook 'c-mode-hook 'flycheck-mode)
;(setq flycheck-python-pylint-executable "pylint3") ; Use pylint3
;(add-hook 'python-mode-hook 'flycheck-mode)
;; (with-eval-after-load 'flycheck
;;   (setq flycheck-display-errors-delay 0.1) ; Small delay (plays better with eldoc)
;;   (setq flycheck-check-syntax-automatically '(mode-enabled save)) ; Only show on save
;;   )

;; Displaying the arguments of a function (ELDoc)
;(add-hook 'irony-mode-hook 'irony-eldoc)
;(add-hook 'irony-mode-hook 'irony-eldoc)
;(add-hook 'python-mode-hook 'eldoc-mode)
(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
(with-eval-after-load 'eldoc
  (setq eldoc-idle-delay 0) ; No delay
  )

;; Yasnippet
;(add-hook 'company-mode-hook 'yas-minor-mode)

;; Source: https://gist.github.com/soonhokong/7c2bf6e8b72dbc71c93b
;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
;(defun my-irony-mode-hook ()
;  (define-key irony-mode-map [remap completion-at-point] 'irony-completion-at-point-async)
;  (define-key irony-mode-map [remap complete-symbol] 'irony-completion-at-point-async))
;(add-hook 'irony-mode-hook 'my-irony-mode-hook)

;; (optional) adds CC special commands to `company-begin-commands' in order to
;; trigger completion at interesting places, such as after scope operator
;; std::|
;(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

;; ==========================================
;; (optional)bind TAB for indent-or-complete
;; ==========================================
;(defun irony--check-expansion () (save-excursion (if (looking-at "\\_>") t (backward-char 1) (if (looking-at "\\.") t (backward-char 1) (if (looking-at "->") t nil)))))
;(defun irony--indent-or-complete () "Indent or Complete" (interactive) (cond ((and (not (use-region-p)) (irony--check-expansion)) (message "complete") (company-complete-common)) (t (message "indent") (call-interactively 'c-indent-line-or-region))))
;(defun irony-mode-keys () "Modify keymaps used by `irony-mode'." (local-set-key (kbd "TAB") 'irony--indent-or-complete) (local-set-key [tab] 'irony--indent-or-complete))
;(add-hook 'c-mode-common-hook 'irony-mode-keys)

;; Setup for relevant modes
(defcustom python-shell-interpreter "python3"
    "Default Python interpreter for shell."
    :type 'string
    :group 'python)
(defun my-python-mode-backend-hook ()
  ;(add-to-list 'company-backends 'company-jedi)
  ;(run-python (python-shell-parse-command)) ;; eldoc needs this, but it's a bug
  )
(add-hook 'python-mode-hook 'my-python-mode-backend-hook)

(defun my-c-mode-backend-hook ()
  ;(add-to-list 'company-backends 'company-irony)
  ;(add-hook 'flycheck-mode-hook #'flycheck-irony-setup)
  )
;; (add-hook 'c-mode-hook 'my-c-mode-backend-hook)
;; (add-hook 'c++-mode-hook 'my-c-mode-backend-hook)

;; For some reason line numbers really slow down doc view
(add-hook 'doc-view-mode-hook '(lambda () (linum-mode -1)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               ;;
;;           GDB setup           ;;
;;                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Custom many-windows setup
;; From https://stackoverflow.com/a/41326527
(setq gdb-many-windows nil)

;; Close all windows and create desired layout
(defun set-gdb-layout(&optional cur-buffer)
  (if (not cur-buffer)
      (setq cur-buffer (window-buffer (selected-window)))) ;; save current buffer

  ;; from http://stackoverflow.com/q/39762833
  (set-window-dedicated-p (selected-window) nil) ;; unset dedicate state if needed
  (switch-to-buffer gud-comint-buffer)
  (delete-other-windows) ;; clean all

  (let* (
         (w-source (selected-window)) ;; left top
         (w-gdb (split-window w-source nil 'right)) ;; right bottom
         (w-locals (split-window w-gdb nil 'above)) ;; right middle bottom
         (w-stack (split-window w-locals nil 'above)) ;; right middle top
         (w-breakpoints (split-window w-stack nil 'above)) ;; right top
         (w-io (split-window w-source (floor(* 0.9 (window-body-height)))
                             'below)) ;; left bottom
         )
    (set-window-buffer w-io (gdb-get-buffer-create 'gdb-inferior-io))
    (set-window-dedicated-p w-io t)
    (set-window-buffer w-breakpoints (gdb-get-buffer-create 'gdb-breakpoints-buffer))
    (set-window-dedicated-p w-breakpoints t)
    (set-window-buffer w-locals (gdb-get-buffer-create 'gdb-locals-buffer))
    (set-window-dedicated-p w-locals t)
    (set-window-buffer w-stack (gdb-get-buffer-create 'gdb-stack-buffer))
    (set-window-dedicated-p w-stack t)

    (set-window-buffer w-gdb gud-comint-buffer)

    (select-window w-source)
    (set-window-buffer w-source cur-buffer)
    ))

;; When gdb runs, save layout then install custom layout
(defadvice gdb (around args activate)
  "Change the way to gdb works."
  ;; To restore: (set-window-configuration global-config-editing)
  (setq global-config-editing (current-window-configuration))
  (let (
        (cur-buffer (window-buffer (selected-window))) ;; save current buffer
        )
    ad-do-it
    (set-gdb-layout cur-buffer))
  )

;; When gdb closes, restore old layout
(defadvice gdb-reset (around args activate)
  "Change the way to gdb exit."
  ad-do-it
  (set-window-configuration global-config-editing))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               ;;
;;         Loading files         ;;
;;                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Load packages
(add-to-list 'load-path "~/home/lisp/")
(add-to-list 'load-path "~/home/lisp/sml-mode")
(require 'multi-term-ext) ; Maybe a little sketch, but el-doc seems overkill
(autoload 'sml-mode "sml-mode" "Major mode for editing SML." t)
(autoload 'run-sml "sml-proc" "Run an inferior SML process." t)

;; Verilog mode
(autoload 'verilog-mode "verilog-mode" "Verilog mode" t )
(add-to-list 'auto-mode-alist '("\\.[ds]?vh?\\(.erb\\)?\\'" . verilog-mode))

;; Load templates
(auto-insert-mode)
(setq auto-insert-query nil)
(setq auto-insert-directory "~/home/templates/")
(define-auto-insert "\.sv" "template.sv")

;; Multi-term mode
;; See: https://github.com/rlister/emacs.d/blob/master/lisp/multi-term-cfg.el

;; Deprecated in favor of term-send-raw-control
(defun term-send-ctrl-z ()
  "Allow using ctrl-z to suspend in multi-term shells."
  (interactive)
  (term-send-raw-string ""))

;; Equivalent of alt-. in bash
(defun term-tcsh-history ()
  "Add the last argument of the last command at point in shell"
  (interactive)
  ; This is a wacky one. Multi-term is a bit odd about this, and this
  ; sequence both fills in the last arg of the last command and spits
  ; some of the characters in the sequence out. The \b's delete those.
  (term-send-raw-string "!!:$\c-[ \b\b\b\b")
  )

;; Read the next character and send it as a raw string to multi-term
(defun term-send-raw-control ()
  "read a character and send it to multiterm."
  (interactive)
  (term-send-raw-string (string (read-event))))

;; Setup multi-term with keybindings etc.
(add-hook 'term-mode-hook
          (lambda ()
            (linum-mode -1) ; Disable line numbers
            ; Disable common mappings so we can rebind a couple things
            (common-keys-minor-mode -1)
            ; Rebind the keybindings we actually want
            (define-key term-mode-map (kbd "M-SPC") 'set-mark-command)
            ; New bindings
            (define-key term-raw-map (kbd "M-y") 'term-paste)
            (define-key term-raw-map (kbd "C-c") 'term-send-raw-control)
            (define-key term-raw-map (kbd "M-.") 'term-tcsh-history)))

;; Faster M-x command
(defalias 'mrem 'multi-term-remote)

;; SML stuff - copied from 15150
;; This points to where SML happens to live on local
(setq sml-program-name "/usr/bin/sml")
(add-to-list 'auto-mode-alist '("\\.\\(sml\\|sig\\)\\'" . sml-mode))

(defun my-sml-mode-hook () "Local defaults for SML mode"
  (setq sml-indent-level 2)             ; conserve on horizontal space
  (setq words-include-escape t)         ; \ loses word break status
;  (setq-default tab-width 2)
;  (setq indent-line-function 'insert-tab)
  (defun indent-and-newline ()
    (interactive)
    (indent-according-to-mode)
    (newline))
;  (local-set-key (kbd "RET") 'reindent-then-newline-and-indent)
  (local-set-key (kbd "RET") 'indent-and-newline))

(add-hook 'sml-mode-hook 'my-sml-mode-hook)


;; Color theme
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(comint-highlight-prompt ((t (:inherit minibuffer-prompt))))
 '(minibuffer-prompt ((t (:background "color-236" :foreground "white" :box (:line-width -1 :color "red" :style released-button) :weight bold))))
 '(mode-line ((t (:background "gray30" :box (:line-width 1 :color "dark orchid") :family "Menlo"))))
 '(persp-face-lighter-buffer-not-in-persp ((t (:background "dark gray" :foreground "#444444" :weight bold)))))

;; Disable graphical scroll bar and toolbar
(toggle-scroll-bar -1)
(tool-bar-mode -1)
