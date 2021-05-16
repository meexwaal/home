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
    (yaml-mode tea-time plur ws-butler tree-mode persp-mode autopair highlight-doxygen 0xc 2048-game avy json-mode json-reformat json-snatcher multi-term yasnippet markdown-mode tldr matlab-mode jump-char undo-tree neotree browse-kill-ring ace-window)))
 '(persp-keymap-prefix "p")
 '(ring-bell-function (quote ignore))
 '(term-bind-key-alist
   (quote
    (("M-e" . term-send-esc)
     ("C-p" . previous-line)
     ("C-n" . next-line)
     ("C-s" . isearch-forward)
     ("M-r" . isearch-backward)
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
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(comint-highlight-prompt ((t (:inherit minibuffer-prompt))))
 '(minibuffer-prompt ((t (:background nil :foreground "white" :box (:line-width -1 :color "red" :style released-button) :weight bold))))
 '(mode-line ((t (:background "gray30" :box (:line-width 1 :color "dark orchid") :family "Menlo"))))
 '(persp-face-lighter-buffer-not-in-persp ((t (:background "dark gray" :foreground "#444444" :weight bold)))))
