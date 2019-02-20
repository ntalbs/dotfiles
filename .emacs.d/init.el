(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-trigger-key "TAB")
 '(av-beta "https://atv-deviceproxy-ssl-term-eu-beta.corp.amazon.com")
 '(av-dev-desktop "http://seongjun.aka.corp.amazon.com:8080")
 '(av-gamma "https://atv-guava.amazon.com")
 '(av-prod "https://atv-ext.amazon.com")
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
 '(flycheck-python-pycompile-executable "/usr/local/bin/python3")
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
    ("$" "_" "setTimeout" "require" "fetch" "define" "describe" "it" "after" "before" "expect" "xdescribe")))
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
 '(org-agenda-files (quote ("~/Documents/org/todo.org")))
 '(org-cycle-separator-lines 1)
 '(org-default-priority 50)
 '(org-emphasis-alist
   (quote
    (("*" bold)
     ("/" italic)
     ("_" underline)
     ("=" org-verbatim)
     ("~" org-code)
     ("-" strike-through)
     ("`" org-code))))
 '(org-enable-priority-commands t)
 '(org-hide-emphasis-markers t)
 '(org-highest-priority 49)
 '(org-lowest-priority 51)
 '(org-todo-keyword-faces
   (quote
    (("PENDING" . "deep pink")
     ("IN-PROGRESS" . "blue"))))
 '(org-todo-keywords (quote ((sequence "TODO" "IN-PROGRESS" "PENDING" "DONE"))))
 '(package-archives (quote (("melpa" . "https://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (graphviz-dot-mode plantuml-mode jdecomp powerline iedit duplicate-thing move-dup package-lint duplicate-lines jedi cider exec-path-from-shell markdown-mode auto-complete json-navigator counsel-projectile ace-window projectile lua-mode find-file-in-project web-mode 2048-game expand-region clj-refactor json-mode counsel swiper magit yaml-mode which-key visual-regexp-steroids use-package try tern-auto-complete stylus-mode restclient paredit-menu org-journal neotree move-text mmm-mode markdown-mode+ langtool js2-refactor goto-last-change flycheck fish-mode emmet-mode)))
 '(recentf-exclude (quote (".*/\\.emacs\\.d\\/elpa/.*el")))
 '(recentf-max-saved-items 200)
 '(safe-local-variable-values
   (quote
    ((flycheck-disabled-checkers . javascript-standard))))
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
 '(tramp-default-method "ssh" nil (tramp))
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

;; suppress ad-handle-definition: warning
(setq ad-redefinition-action 'accept)

(setq default-directory "~/")
(add-hook 'before-save-hook 'whitespace-cleanup)
(global-unset-key (kbd "s-t"))         ; disable Cmd+t which shows font dialog.
(global-unset-key (kbd "s-n"))         ; disable Cmd+n which opens a new frame.
(global-unset-key (kbd "C-x C-r"))     ; disable C-x C-r which runs find file read-only.
(global-set-key (kbd "s-<return>") 'toggle-frame-fullscreen)

(exec-path-from-shell-initialize)

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

;; Set up unicode
;; (set-terminal-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system       'utf-8)
(setq buffer-file-coding-system 'utf-8)

(defun next-user-buffer ()
  "Switch to the next user buffer in cyclic order. User buffers are those not starting with *."
  (interactive)
  (next-buffer)
  (let ((i 0) (buf-cnt (length (buffer-list))))
    (while (and (string-match "^*" (buffer-name)) (< i buf-cnt))
      (setq i (1+ i)) (next-buffer) )))

(defun previous-user-buffer ()
  "Switch to the previous user buffer in cyclic order. User buffers are those not starting with *."
  (interactive)
  (previous-buffer)
  (let ((i 0) (buf-cnt (length (buffer-list))))
    (while (and (string-match "^*" (buffer-name)) (< i buf-cnt))
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
  (find-file "~/Documents/orgs/todo.org"))
(global-set-key [f11] 'open-todo)

(eval-after-load "paredit.el"
  '(require 'paredit-menu))

;; Cmd+delete
(defun delete-to-line-start ()
  (interactive)
  (push-mark)
  (move-beginning-of-line 1)
  (kill-region (mark) (point)))

(global-set-key (kbd "s-<backspace>") 'delete-to-line-start)

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
  (with-no-warnings
    (require 'org)
    (let* ((dt (org-time-stamp nil))
           (len (length dt)))
      (backward-delete-char-untabify len)
      (insert (substring dt 1 11)))))

(global-set-key (kbd "C-c .") 'insert-date)

;; load for av-requests
(load "~/workplace/Av-requests/av-requests.el")
;; (load "~/GitHub/duplicate-lines/duplicate-lines.el")
;; (global-set-key (kbd "M-s-<down>") 'duplicate-lines)

;; packages
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package try)

(use-package which-key
  :config (which-key-mode))

(use-package projectile
  :config
  (projectile-mode))

(use-package ivy
  :config
  (ivy-mode t)
  (recentf-mode t)
  :bind (("s-f" . swiper)
         ("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-x M-j" . counsel-file-jump)
         ("C-x C-r" . counsel-recentf)
         ("C-x C-g" . counsel-git-grep)))

;; (use-package counsel-projectile
;;   :config
;;   (counsel-projectile-mode))

(use-package magit
  :bind (("<f9>" . magit-status)))

(use-package neotree
  :bind (("<f8>" . neotree-toggle)))

(use-package flycheck
  :init (global-flycheck-mode))

(use-package emmet-mode                 ; zen coding
  :config
  (add-hook 'sgml-mode-hook 'emmet-mode)
  (add-hook 'web-mode-hook 'emmet-mode))

(use-package iedit
  :ensure t)

(use-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-s->" . mc/skip-to-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-s-<" . mc/skip-to-previous-like-this)
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
  (yas-global-mode t))

(use-package auto-complete
  :config
  (ac-config-default)
  :init
  (global-auto-complete-mode t)
  (auto-complete-mode t)
  :bind
  (:map ac-complete-mode-map
        ("\C-p" . ac-previous)
        ("\C-n" . ac-next)))

(use-package jedi
  :config
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:complete-on-dot t))

(use-package cider
  :config
  (add-hook 'clojure-mode-hook 'cider-mode)
  (add-hook 'cider-mode-hook 'eldoc-mode)
  :bind
  (:map cider-repl-mode-map
        ("C-c C-k" . cider-repl-clear-buffer)))

(use-package json-mode)

(use-package js2-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))

(use-package js2-refactor)

(use-package web-mode
  :config
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
  :config
  (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
  (add-to-list 'interpreter-mode-alist '("lua" . lua-mode)))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

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

(use-package mmm-mode
  :init
  (setq mmm-global-mode 'maybe)
  :config
  (mmm-add-classes
   '((md-tex  :submode tex-mode     :front "<div>$$\n"    :back "$$</div>")
     (md-clj  :submode clojure-mode :front "```clojure\n" :back "```\n")
     (md-lisp :submode lisp-mode    :front "```lisp\n"    :back "```\n")
     (md-java :submode java-mode    :front "```java\n"    :back "```\n")))
  (with-no-warnings
    (mmm-add-mode-ext-class 'markdown-mode nil 'md-tex)
    (mmm-add-mode-ext-class 'markdown-mode nil 'md-clj)
    (mmm-add-mode-ext-class 'markdown-mode nil 'md-lisp)
    (mmm-add-mode-ext-class 'markdown-mode nil 'md-java)))

(use-package goto-last-change
  :bind ("C-." . goto-last-change))

(use-package move-text
  :config (move-text-default-bindings))

(use-package duplicate-thing
  :bind ("M-s-<down>" . duplicate-thing))

(use-package powerline
  :config
  (powerline-default-theme))

(use-package jdecomp
  :config
  (jdecomp-mode 1)
  (setq jdecomp-decompiler-paths '((cfr . "/usr/local/Cellar/cfr-decompiler/0.132/libexec/cfr_0_132.jar"))))

(use-package plantuml-mode
  :config
  (setq plantuml-java-command "/usr/local/bin/plantuml")
  (setq plantuml-jar-path "")
  (add-to-list 'auto-mode-alist '("\\.\\(plant\\)?uml\\'" . plantuml-mode)))

(use-package graphviz-dot-mode)

;; init.el ends here
