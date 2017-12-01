(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-by-copying t)
 '(backup-directory-alist (quote (("." . "~/.emacs.d/.emacs_saves"))))
 '(blink-cursor-mode nil)
 '(c-basic-offset 2)
 '(c-max-one-liner-length 120)
 '(cider-repl-display-help-banner nil)
 '(column-number-mode t)
 '(command-line-default-directory "~/" t)
 '(css-indent-offset 2)
 '(current-language-environment "Korean")
 '(default-input-method "korean-hangul3")
 '(delete-old-versions t)
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(exec-path
   (quote
    ("/usr/local/bin" "/usr/bin" "/bin" "/usr/sbin" "/sbin" "/usr/local/Cellar/emacs/24.5/libexec/emacs/24.5/x86_64-apple-darwin14.5.0")))
 '(fringe-mode (quote (nil . 0)) nil (fringe))
 '(global-hl-line-mode t)
 '(help-at-pt-display-when-idle (quote (flymake-overlay)) nil (help-at-pt))
 '(help-at-pt-timer-delay 0.5)
 '(hightlight-parenthese-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message "")
 '(ivy-count-format "(%d/%d) ")
 '(ivy-use-virtual-buffers t)
 '(js-indent-level 2)
 '(js2-basic-offset 2)
 '(js2-global-externs
   (quote
    ("$" "_" "setTimeout" "require" "define" "describe" "it" "after" "before" "expect" "xdescribe")))
 '(js2-mode-show-parse-errors nil)
 '(js2-mode-show-strict-warnings nil)
 '(kept-new-versions 6)
 '(kept-old-versions 2)
 '(lua-indent-level 2)
 '(markdown-enable-math t)
 '(markdown-indent-on-enter nil)
 '(markdown-list-indent-width 2)
 '(mmm-global-mode (quote maybe) nil (mmm-mode))
 '(neo-hidden-regexp-list (quote ("\\.pyc$" "~$" "^#.*#$" "\\.elc$")))
 '(neo-theme (quote nerd))
 '(neo-window-fixed-size nil)
 '(ns-right-alternate-modifier (quote none))
 '(org-cycle-separator-lines 1)
 '(org-default-priority 50)
 '(org-emphasis-alist
   (quote
    (("*" bold)
     ("/" italic)
     ("_" underline)
     ("=" org-verbatim verbatim)
     ("~" org-code verbatim)
     ("-"
      (:strike-through t))
     ("`" org-code verbatim))))
 '(org-enable-priority-commands t)
 '(org-hide-emphasis-markers t)
 '(org-highest-priority 49)
 '(org-lowest-priority 51)
 '(org-todo-keyword-faces
   (quote
    (("PENDING" . "deep pink")
     ("IN-PROGRESS" . "blue"))))
 '(org-todo-keywords (quote ((sequence "TODO" "IN-PROGRESS" "PENDING" "DONE"))))
 '(package-archives
   (quote
    (("melpa" . "https://melpa.org/packages/")
     ("gnu" . "http://elpa.gnu.org/packages/"))))
 '(package-selected-packages
   (quote
    (cider-mode find-file-in-project web-mode 2048-game expand-region clj-refactor json-mode counsel swiper ivy magit yaml-mode which-key visual-regexp-steroids use-package try tern-auto-complete stylus-mode restclient paredit-menu org-journal neotree move-text mmm-mode markdown-mode+ langtool js2-refactor goto-last-change flycheck fish-mode exec-path-from-shell emmet-mode duplicate-thing cider)))
 '(recentf-exclude (quote (".*/\\.emacs\\.d\\/elpa/.*el")))
 '(recentf-max-saved-items 100)
 '(scroll-bar-mode nil)
 '(shell-file-name "/bin/bash")
 '(show-paren-mode t)
 '(speedbar-indentation-width 2)
 '(speedbar-supported-extension-expressions
   (quote
    (".org" ".el" ".emacs" ".java" ".js" ".s?html" ".clj" ".json" ".md" ".css")))
 '(speedbar-use-images nil)
 '(split-height-threshold 80)
 '(split-width-threshold 300)
 '(standard-indent 1)
 '(tab-stop-list nil)
 '(tab-width 2)
 '(text-mode-hook (quote (visual-line-mode)))
 '(tool-bar-mode nil)
 '(tramp-default-method "ssh")
 '(version-control t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:background "#ffa"))))
 '(js2-function-call ((t (:inherit default :foreground "dark blue"))))
 '(markdown-bold-face ((t (:inherit font-lock-variable-name-face :foreground "Red" :weight semi-bold))))
 '(markdown-header-face ((t (:inherit font-lock-function-name-face :weight semi-bold))))
 '(markdown-italic-face ((t (:inherit font-lock-variable-name-face :slant normal))))
 '(mode-line ((t (:background "light blue" :foreground "black" :box (:line-width -1 :style released-button)))))
 '(org-code ((t (:inherit nil :foreground "deep pink")))))

(put 'erase-buffer 'disabled nil)

(setq default-directory "~/")
(add-hook 'before-save-hook 'whitespace-cleanup)
(global-unset-key (kbd  "s-t"))         ; disable Cmd+t which shows font dialog.
(global-unset-key (kbd  "s-n"))         ; disable Cmd+n which opens a new frame.
(global-set-key (kbd "s-<return>") 'toggle-frame-fullscreen)

(exec-path-from-shell-initialize)

;; packages
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package projectile
  :ensure t
  :config
  (projectile-mode))

(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-on))

(use-package ivy
  :ensure t
  :init
  (ivy-mode t)
  (recentf-mode t)
  :bind (("s-f" . swiper)
         ("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-x M-j" . counsel-file-jump)
         ("C-x C-r" . counsel-recentf)
         ("C-x C-g" . counsel-git-grep)))

(use-package magit
  :ensure t
  :bind (("<f9>" . magit-status)))

(use-package neotree
  :bind (("<f8>" . neotree-toggle)))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package emmet-mode                 ; zen coding
  :config
  (add-hook 'sgml-mode-hook 'emmet-mode)
  (add-hook 'web-mode-hook 'emmet-mode))

(use-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C->" . mc/mark-all-like-this)))

(use-package expand-region
  :bind (("C-=" . er/expand-region)
         ("C--" . er/contract-region)))

(use-package visual-regexp
  :bind (("C-c r" . vr/replace)
         ("C-c q" . vr/query-replace)
         ("C-c m" . vr/mc-mark)))

(use-package visual-regexp-steroids)

(use-package yasnippet
  :init
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  (yas-global-mode t)
  :config
  (defun yas/org-very-safe-expand ()
    (let ((yas-fallback-behavior 'return-nil)) (yas-expand)))
  (add-hook 'org-mode-hook
            (lambda ()
              (make-variable-buffer-local 'yas/trigger-key)
              (setq yas/trigger-key [tab])
              (add-to-list 'org-tab-first-hook 'yas/org-very-safe-expand)
              (define-key yas-keymap [tab] 'yas/next-field))))

(use-package company
  :ensure t
  :bind (("C-c /" . company-complete))
  :config
  (global-company-mode))

(use-package auto-complete
  :init
  (global-auto-complete-mode t)
  (auto-complete-mode t)
  (ac-set-trigger-key "TAB")
  :bind
  (:map ac-complete-mode-map
        ("\C-p" . ac-previous)
        ("\C-n" . ac-next)))

(use-package cider
  :ensure t
  :config
  (add-hook 'clojure-mode-hook 'cider-mode)
  (add-hook 'cider-mode-hook 'eldoc-mode)
  :bind
  (:map cider-repl-mode-map
        ("C-c C-k" . cider-repl-clear-buffer)))

(use-package js2-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))

(use-package js2-refactor
  :ensure t)

(use-package web-mode
  :ensure t
  :config
;  (setq web-mode-enable-current-element-highlight t)
;  (setq web-mode-enable-current-column-highlight t)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-ac-sources-alist
  '(("html" . (ac-source-emmet-html-aliases ac-source-emmet-html-snippets))
    ("css" . (ac-source-css-property ac-source-emmet-css-snippets))))
  (add-hook 'web-mode-before-auto-complete-hooks
            '(lambda ()
               (let ((web-mode-cur-language (web-mode-language-at-pos)))
                 (if (string= web-mode-cur-language "css")
                     (setq emmet-use-css-transform t)
                   (setq emmet-use-css-transform nil)))))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.ejs\\'" . web-mode)))

(use-package lua-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
  (add-to-list 'interpreter-mode-alist '("lua" . lua-mode)))

(use-package restclient
  :config
  (add-to-list 'auto-mode-alist '("\\.http\\'" . restclient-mode)))

(use-package langtool
  :init
  (setq langtool-language-tool-jar "/usr/local/LanguageTool-3.3/languagetool-commandline.jar")
  (setq langtool-default-language "en-US")
  :bind (("C-x 4 w" . langtool-check)
         ("C-x 4 W" . langtool-check-done)
         ("C-x 4 l" . langtool-switch-default-language)
         ("C-x 4 4" . langtool-show-message-at-point)
         ("C-x 4 c" . langtool-correct-buffer)))

(use-package ace-window
  :bind ("M-p" . ace-window))

;; font
(set-fontset-font "fontset-default" '(#x1100 . #xffdc) "AppleMyungjo")

;; font size
(define-key global-map (kbd "s-=") 'text-scale-increase)
(define-key global-map (kbd "s--") 'text-scale-decrease)
(defun text-scale-default ()
  (interactive)
  (text-scale-adjust 0))
(define-key global-map (kbd "s-0") 'text-scale-default)

(set-frame-width (selected-frame) 100)
(set-frame-height (selected-frame) 60)

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
   (markdown-tex1 :submode tex-mode     :front "\n\n$$\n"     :back "$$$")
   (markdown-tex2 :submode tex-mode     :front "{% math %}\n" :back "{% endmath %}")
   (markdown-java :submode java-mode    :front "```java\n"    :back "```")
   (markdown-clj  :submode clojure-mode :front "```clojure\n" :back "```")))

;;; Add html-js, embedded-css and html-ejs to html-mode
(add-to-list 'mmm-mode-ext-classes-alist '(web-mode nil html-js))
(add-to-list 'mmm-mode-ext-classes-alist '(web-mode nil html-css))
(add-to-list 'mmm-mode-ext-classes-alist '(web-mode nil html-ejs))
(add-to-list 'mmm-mode-ext-classes-alist '(markdown-mode nil markdown-tex1))
(add-to-list 'mmm-mode-ext-classes-alist '(markdown-mode nil markdown-tex2))
(add-to-list 'mmm-mode-ext-classes-alist '(markdown-mode nil markdown-clj))
(add-to-list 'mmm-mode-ext-classes-alist '(markdown-mode nil markdown-java))

;; Set up unicode
;; (set-terminal-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system       'utf-8)
(setq buffer-file-coding-system 'utf-8)

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

(defun open-line-below ()
  (interactive)
  (end-of-line)
  (open-line 1)
  (forward-line))

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

;; insert date
(defun insert-date ()
  (interactive)
  (insert (format-time-string "%Y-%m-%d")))

(global-set-key (kbd "C-c .") 'insert-date)
