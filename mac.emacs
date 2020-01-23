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
;; avy
;; browse-kill-ring
;; epl
;; json-mode
;; json-reformat
;; json-snatcher
;; jump-char
;; multi-term
;; neotree
;; nerd-tab
;; tldr
;; undo-tree
;; yasnippet

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
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
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (browse-kill-ring tldr epl 0xc 2048-game json-reformat json-snatcher jump-char multi-term neotree nerdtab ace-window avy json-mode undo-tree yasnippet)))
 '(ring-bell-function (quote ignore))
 '(term-bind-key-alist
   '(("M-e" . term-send-esc)
     ("C-p" . previous-line)
     ("C-n" . next-line)
     ("C-s" . isearch-forward)
     ("M-r" . isearch-backward)
     ("M-p" . term-send-up)
     ("M-n" . term-send-down)
     ("C-h" . term-send-backward-kill-word)
     ("M-DEL" . term-send-backward-kill-word)
     ("<C-left>" . term-send-backward-word)
     ("<C-right>" . term-send-forward-word)))
 '(vc-follow-symlinks t)
 '(verilog-auto-newline (quote nil))
 '(verilog-indent-level 2)
 '(verilog-indent-level-declaration 2)
 '(verilog-indent-level-module 2))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               ;;
;;      Common Keybindings       ;;
;;                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Mac keys
;; https://www.emacswiki.org/emacs/EmacsForMacOS#toc31
(setq mac-command-modifier 'meta)
(setq mac-right-command-modifier 'control)
(setq mac-control-modifier 'super)

;; Move arrow keys
(define-key key-translation-map (kbd "M-j") (kbd "<left>"))
(define-key key-translation-map (kbd "M-l") (kbd "<right>"))
(define-key key-translation-map (kbd "M-i") (kbd "<up>"))
(define-key key-translation-map (kbd "M-k") (kbd "<down>"))
(define-key key-translation-map (kbd "C-M-j") (kbd "C-<left>"))
(define-key key-translation-map (kbd "C-M-l") (kbd "C-<right>"))
(define-key key-translation-map (kbd "C-M-i") (kbd "C-<up>"))
(define-key key-translation-map (kbd "C-M-k") (kbd "C-<down>"))

;; Credit: https://stackoverflow.com/a/683575/5135869
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
  (if (fboundp 'multi-term-remote)
      (multi-term-remote host)
      (message "multi-term-remote not defined"))
  (split-window-horizontally)
  (find-file (concat "/ssh:" host ":" directory)))

(defun scv-remote ()
  (interactive)
  (open-remote "scv" "~"))

;; Highlight bad whitespace and long lines
(setq whitespace-style '(face tabs lines-tail trailing)) ;; empty
(global-whitespace-mode t)     ;; Enable always
;; Except when you can't edit

;(add-hook 'find-file-hook
;          '(lambda() (whitespace-mode -1)))
;          '(lambda() (when buffer-read-only (whitespace-mode -1))))

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

;; Highlight the current line
;(hl-line-mode)

;; Find file at point
(global-set-key (kbd "C-x C-d") 'find-file-at-point)

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
(global-set-key (kbd "C-h") 'my-delete-back)
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
(global-set-key (kbd "M-r") 'undo-tree-redo)
(global-set-key (kbd "M-f") 'undo-tree-undo)

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               ;;
;;         Loading files         ;;
;;                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Load packages
(add-to-list 'load-path "~/home/lisp/")

;; Multi-term extensions, particularly remote
(require 'multi-term-ext)

;; Verilog mode
(autoload 'verilog-mode "verilog-mode" "Verilog mode" t )
(add-to-list 'auto-mode-alist '("\\.[ds]?vh?\\(.erb\\)?\\'" . verilog-mode))

;; eRuby mode
(load "eruby-mode")

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

;; Equivalent of Alt-. in bash
(defun term-tcsh-history ()
  "Add the last argument of the last command at point in shell"
  (interactive)
  (term-send-raw-string "!!:$\C-[ "))

;; Read the next character and send it as a raw string to multi-term
(defun term-send-raw-control ()
  "Read a character and send it to multiterm."
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

;; Color theme
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(comint-highlight-prompt ((t (:inherit minibuffer-prompt))))
 '(minibuffer-prompt ((t (:background "color-236" :foreground "white" :box (:line-width -1 :color "red" :style released-button) :weight bold))))
 '(mode-line ((t (:background "gray30" :box (:line-width 1 :color "dark orchid") :family "Menlo")))))

;; Disable graphical scroll bar and toolbar
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
