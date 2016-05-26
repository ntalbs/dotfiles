(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(c-basic-offset 2)
 '(c-max-one-liner-length 120)
 '(cider-repl-display-help-banner nil)
 '(column-number-mode t)
 '(command-line-default-directory "~/" t)
 '(css-indent-offset 2)
 '(current-language-environment "Korean")
 '(default-input-method "korean-hangul3")
 '(exec-path
   (quote
    ("/usr/bin" "/bin" "/usr/sbin" "/sbin" "/usr/local/bin" "/usr/local/Cellar/emacs/24.5/libexec/emacs/24.5/x86_64-apple-darwin14.5.0")))
 '(fringe-mode (quote (nil . 0)) nil (fringe))
 '(global-hl-line-mode t)
 '(help-at-pt-display-when-idle (quote (flymake-overlay)) nil (help-at-pt))
 '(help-at-pt-timer-delay 0.5)
 '(hightlight-parenthese-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message "")
 '(js-indent-level 2)
 '(js2-basic-offset 2)
 '(js2-global-externs
   (quote
    ("$" "_" "setTimeout" "require" "define" "describe" "it" "after" "before" "expect" "xdescribe")))
 '(js2-mode-show-strict-warnings t)
 '(markdown-enable-math t)
 '(markdown-indent-on-enter nil)
 '(markdown-list-indent-width 2)
 '(mmm-global-mode (quote maybe) nil (mmm-mode))
 '(ns-right-alternate-modifier (quote none))
 '(org-default-priority 50)
 '(org-enable-priority-commands t)
 '(org-highest-priority 49)
 '(org-lowest-priority 51)
 '(org-todo-keyword-faces
   (quote
    (("PENDING" . "deep pink")
     ("IN-PROGRESS" . "blue"))))
 '(org-todo-keywords (quote ((sequence "TODO" "IN-PROGRESS" "PENDING" "DONE"))))
 '(package-archives
   (quote
    (("MELPA" . "http://melpa.milkbox.net/packages/")
     ("gnu" . "http://elpa.gnu.org/packages/"))))
 '(recentf-exclude (quote (".*/\\.emacs\\.d\\/elpa/.*el")))
 '(scroll-bar-mode nil)
 '(sentence-end-double-space nil)
 '(shell-file-name "/bin/bash")
 '(show-paren-mode t)
 '(speedbar-indentation-width 2)
 '(speedbar-supported-extension-expressions
   (quote
    (".org" ".el" ".emacs" ".java" ".js" ".s?html" ".clj" ".json" ".md" ".css")))
 '(speedbar-use-images nil)
 '(split-height-threshold 80)
 '(sr-speedbar-max-width 50)
 '(sr-speedbar-right-side nil)
 '(sr-speedbar-skip-other-window-p t)
 '(sr-speedbar-width-x 50)
 '(standard-indent 1)
 '(tab-stop-list nil)
 '(tab-width 2)
 '(text-mode-hook (quote (visual-line-mode)))
 '(tool-bar-mode nil)
 '(tramp-default-method "ssh"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:background "#ffa"))))
 '(italic ((t (:slant normal))))
 '(js2-function-call ((t (:inherit default :foreground "dark blue"))))
 '(markdown-bold-face ((t (:inherit font-lock-variable-name-face :foreground "Red" :weight semi-bold))))
 '(markdown-header-face ((t (:inherit font-lock-function-name-face :weight semi-bold))))
 '(markdown-italic-face ((t (:inherit font-lock-variable-name-face :slant normal)))))
(put 'erase-buffer 'disabled nil)

(setq default-directory "~/")
(add-hook 'before-save-hook 'whitespace-cleanup)
(global-unset-key (kbd  "s-t"))         ; disable Cmd+t which shows font dialog.

(defun set-ejs-mode ()
  (when (and (stringp buffer-file-name)
             (string-match "\\.ejs\\'" buffer-file-name))
    (html-mode)))
(add-hook 'find-file-hook 'set-ejs-mode)

(add-hook 'clojure-mode-hook 'cider-mode)
(add-hook 'cider-mode-hook 'eldoc-mode)

;(exec-path-from-shell-initialize)

;; zen coding
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)

;; font
;; (set-face-font 'default "Monaco-12")
(set-fontset-font "fontset-default" '(#x1100 . #xffdc) "AppleMyungjo")

;; font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C-=") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)
(defun text-scale-default ()
  (interactive)
  (text-scale-adjust 0))
(define-key global-map (kbd "C-0") 'text-scale-default)

(set-frame-width (selected-frame) 100)
(set-frame-height (selected-frame) 60)

;; backup settings
(setq-default
 backup-by-copying t            ; don't clobber symlinks
 backup-directory-alist '(("." . "~/.emacs_saves")) ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)             ; use versioned backups

;; goto last change
(global-set-key [(control ?.)] 'goto-last-change)

;; mmm-mode
(load-library "mmm-auto")
(mmm-add-classes
 '((html-ejs :submode js2-mode :front "<%[#=]?" :back "-?%>"
             :match-face (("<%#" . mmm-comment-submode-face)
                          ("<%=" . mmm-output-submode-face)
                          ("<%" . mmm-code-submode-face))
             :insert ((?% ejs-code nil @ "<%" @ " " _ " " @ "%>" @)
                      (?# ejs-comment nil @ "<%#" @ " " _ " " @ "%>" @)
                      (?= ejs-expression nil @ "<%=" @ " " _ " " @ "%>" @)))
   (markdown-tex :submode tex-mode :front "{% math %}\n" :back "{% endmath %}")
   (markdown-clj :submode clojure-mode :front "```clojure\n" :back "```")
   (markdown-java :submode java-mode :front "```java\n" :back "```")))

;;; Add html-js, embedded-css and html-ejs to html-mode
(add-to-list 'mmm-mode-ext-classes-alist '(html-mode nil html-js))
(add-to-list 'mmm-mode-ext-classes-alist '(html-mode nil html-css))
(add-to-list 'mmm-mode-ext-classes-alist '(html-mode nil html-ejs))
(add-to-list 'mmm-mode-ext-classes-alist '(markdown-mode nil markdown-tex))
(add-to-list 'mmm-mode-ext-classes-alist '(markdown-mode nil markdown-clj))
(add-to-list 'mmm-mode-ext-classes-alist '(markdown-mode nil markdown-java))

;; multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C->") 'mc/mark-all-like-this)

;; Set up unicode
;; (set-terminal-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system       'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;; move line or region with arrow(up, down) key like in eclipse.
(move-text-default-bindings)
;; duplicate line or region.
(global-set-key [M-s-down] 'duplicate-thing)

(defun next-user-buffer ()
  "Switch to the next user buffer in cyclic order. User buffers are those not starting with *."
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (and (string-match "^*" (buffer-name)) (< i 50))
      (setq i (1+ i)) (next-buffer) )))

(defun previous-user-buffer ()
  "Switch to the previous user buffer in cyclic order. User buffers are those not starting with *."
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (and (string-match "^*" (buffer-name)) (< i 50))
      (setq i (1+ i)) (previous-buffer) )))

(global-set-key [S-s-left] 'previous-buffer)
(global-set-key [S-s-right] 'next-buffer)
(global-set-key [s-left] 'previous-user-buffer)
(global-set-key [s-right] 'next-user-buffer)

(global-set-key [s-home]  'windmove-left)
(global-set-key [s-end]   'windmove-right)
(global-set-key [s-prior] 'windmove-up)
(global-set-key [s-next]  'windmove-down)

(defun delete-after (fn)
  `(lambda () (interactive)
      (,fn)
      (delete-window)))

(global-set-key (kbd "C-s-<right>") (delete-after 'windmove-right))
(global-set-key (kbd "C-s-<left>") (delete-after 'windmove-left))
(global-set-key (kbd "C-s-<down>") (delete-after 'windmove-down))
(global-set-key (kbd "C-s-<up>") (delete-after 'windmove-up))

;; visual-regexp
(require 'visual-regexp)
(require 'visual-regexp-steroids)

(define-key global-map (kbd "C-c r") 'vr/replace)
(define-key global-map (kbd "C-c q") 'vr/query-replace)
(define-key global-map (kbd "C-c m") 'vr/mc-mark)
(define-key esc-map (kbd "C-r") 'vr/isearch-backward) ;; C-M-r
(define-key esc-map (kbd "C-s") 'vr/isearch-forward) ;; C-M-s

;; yasnippet
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(require 'yasnippet)
(yas-global-mode t)

;; auto-complete
(require 'auto-complete)
(global-auto-complete-mode t)
(auto-complete-mode t)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(ac-set-trigger-key "TAB")

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(require 'js2-refactor)

;; flymake-jshint
(require 'flymake-jshint)
(add-hook 'js2-mode-hook
          (lambda ()
            (setq-local jshint-configuration-path
                        (expand-file-name ".jshintrc" (locate-dominating-file default-directory ".jshintrc")))
            (flymake-jshint-load)
            (ac-js2-mode)))

;; tern
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (setq tern-ac-on-dot t)
     (tern-ac-setup)))

(defun open-line-below ()
  (interactive)
  (end-of-line)
  (open-line 1)
  (next-line))

(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (open-line 1))

(global-unset-key (kbd  "C-o"))
(global-set-key (kbd "C-o") 'open-line-below)
(global-set-key (kbd "C-S-o") 'open-line-above)

(defun open-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key [f12] 'open-init-file)

(defun open-todo ()
  (interactive)
  (find-file "~/Documents/todo.org"))
(global-set-key [f11] 'open-todo)

(eval-after-load "paredit.el"
  '(require 'paredit-menu))

;; Cmd+delete
(fset 'delete-to-line-start [?\S-\C-a backspace])
(global-set-key [s-backspace] 'delete-to-line-start)

;; sr-speedbar
(global-unset-key (kbd "s-s"))
(global-set-key (kbd "s-s s-s") 'sr-speedbar-toggle)

;; ;; ido
;; (ido-mode 1)
;; (setq ido-enable-flex-matching t)
;; (setq ido-everywhere t)
(ivy-mode t)

(defun join-lines-in-region (beg end)
  "Apply join-line over region."
  (interactive "r")
  (if mark-active
      (let ((beg (region-beginning))
            (end (copy-marker (region-end))))
        (goto-char beg)
        (while (< (point) end)
          (join-line 1)))
    (delete-indentation 1)))

(global-set-key (kbd "C-^") 'join-lines-in-region)

;; langtool
(setq langtool-language-tool-jar "/usr/local/LanguageTool-3.2/languagetool-commandline.jar")
(setq langtool-default-language "en-US")
(global-set-key "\C-x4w" 'langtool-check)
(global-set-key "\C-x4W" 'langtool-check-done)
(global-set-key "\C-x4l" 'langtool-switch-default-language)
(global-set-key "\C-x44" 'langtool-show-message-at-point)
(global-set-key "\C-x4c" 'langtool-correct-buffer)

;; recent file list
(require 'recentf)
(recentf-mode t)
(global-set-key (kbd "C-x C-r") 'ivy-recentf)
(setq recentf-max-saved-items 25)

;; restclient mode
(add-to-list 'auto-mode-alist '("\\.req\\'" . restclient-mode))

;; prevent from creating new frame by cmd-N
(global-unset-key (kbd  "s-n"))
