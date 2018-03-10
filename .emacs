
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
    (jump-char nixos-options nix-mode jdee web-mode undo-tree neotree magit key-chord browse-kill-ring ace-window)))
 '(term-bind-key-alist
   (quote
    (("C-c C-c" . term-interrupt-subjob)
     ("C-c C-e" . term-send-esc)
     ("C-p" . previous-line)
     ("C-n" . next-line)
     ("C-s" . isearch-forward)
     ("M-r" . isearch-backward)
     ("C-m" . term-send-return)
     ("C-y" . term-paste)
     ("M-f" . term-send-forward-word)
     ("M-b" . term-send-backward-word)
     ("M-p" . term-send-up)
     ("M-n" . term-send-down)
     ("M-M" . term-send-forward-kill-word)
     ("M-N" . term-send-backward-kill-word)
     ("C-h" . term-send-backward-kill-word)
     ("M-DEL" . term-send-backward-kill-word)
     ("<C-left>" . term-send-backward-word)
     ("<C-right>" . term-send-forward-word)
     ("M-d" . term-send-delete-word)
     ("M-," . term-send-raw)
     ;("M-." . comint-dynamic-complete)
     )))
 '(vc-follow-symlinks t))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               ;;
;;       Non-package config      ;;
;;                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Make scratch blank
(setq initial-scratch-message nil)
(setq initial-major-mode 'fundamental-mode)

;; Insert is stupid
(global-set-key (kbd "<insertchar>") 'end-of-line)
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
(defun 213-remote ()
  (interactive)
  (find-file "/ssh:shark:private/213"))
(defun andrew-remote ()
  (interactive)
  (find-file "/ssh:andrew:private"))

;; Swap regexp and normal replace
(global-set-key (kbd "M-%") 'query-replace-regexp)
(global-set-key (kbd "C-M-%") 'query-replace)

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
(global-set-key (kbd "M-k") 'avy-goto-word-or-subword-1)

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
(global-set-key (kbd "M-H") 'hs-hide-block)
(global-set-key (kbd "M-S") 'hs-show-block)

;; Undo tree
(add-hook 'after-init-hook 'global-undo-tree-mode)
(global-set-key (kbd "M-l") 'undo-tree-redo) ; C-? would be great

;; Rust setup
(defun my-rust-config ()
  (local-set-key (kbd "C-c C-v") 'rust-compile))
(add-hook 'rust-mode-hook 'my-rust-config)

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

;; Irony mode config
;; Setup instructions (from https://github.com/Sarcasm/irony-mode):
;; sudo apt install libclang-dev cmake
;; M-x irony-install-server
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
;(add-hook 'objc-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)


;; Autocomplete
(add-hook 'after-init-hook 'global-company-mode)
;(setq company-global-modes '(not text-mode))
;(add-hook 'c++-mode-hook 'company-mode)
;(add-hook 'c-mode-hook 'company-mode)
(with-eval-after-load 'company
  (setq company-idle-delay nil)                  ; Don't autocomplete
  (global-set-key (kbd "M-.") 'company-complete) ; Complete when key pressed
  (setq company-show-numbers t)                  ; Number suggestions
  (setq company-selection-wrap-around t)         ; Wrap in suggestion menu
  (setq company-tooltip-limit 20)                ; Max number of suggestions
  (setq completion-styles ; Make company complete substrings and initials (this may not be supported by irony I'm not sure)
        '(basic partial-completion emacs22 substring initials))
  )

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
(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'c-mode-hook 'flycheck-mode)
(setq flycheck-python-pylint-executable "pylint3") ; Use pylint3
(add-hook 'python-mode-hook 'flycheck-mode)
(with-eval-after-load 'flycheck
  (setq flycheck-display-errors-delay 0.1) ; Small delay (plays better with eldoc)
  (setq flycheck-check-syntax-automatically '(mode-enabled save)) ; Only show on save
  )

;; Displaying the arguments of a function (ELDoc)
(add-hook 'irony-mode-hook 'irony-eldoc)
(add-hook 'irony-mode-hook 'irony-eldoc)
(add-hook 'python-mode-hook 'eldoc-mode)
(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
(with-eval-after-load 'eldoc
  (setq eldoc-idle-delay 0) ; No delay
  )

;; Yasnippet
(add-hook 'company-mode-hook 'yas-minor-mode)

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
  (add-to-list 'company-backends 'company-jedi)
  (run-python (python-shell-parse-command)) ;; eldoc needs this, but it's a bug
  )
(add-hook 'python-mode-hook 'my-python-mode-backend-hook)

(defun my-c-mode-backend-hook ()
  (add-to-list 'company-backends 'company-irony)
  (add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
(add-hook 'c-mode-hook 'my-c-mode-backend-hook)
(add-hook 'c++-mode-hook 'my-c-mode-backend-hook)


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
(add-to-list 'auto-mode-alist '("\\.[ds]?vh?\\'" . verilog-mode))

;; Load templates
(auto-insert-mode)
(setq auto-insert-query nil)
(setq auto-insert-directory "~/home/templates/")
(define-auto-insert "\.sv" "template.sv")

;; SML stuff - copied from 15150
;; this points to where SML happens to live on local
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

;; End of .emacs ;;
;; Color theme
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(comint-highlight-prompt ((t (:inherit minibuffer-prompt))))
 '(minibuffer-prompt ((t (:background "color-236" :foreground "white" :box (:line-width -1 :color "red" :style released-button) :weight bold)))))
