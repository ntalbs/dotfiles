;;; init.el --- My init.el file.

;;; Commentary:

;;; Code:

;; Hide toolbar
(tool-bar-mode -1)

;; Enter fullscreen mode
;(toggle-frame-fullscreen)

(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-by-copying t)
 '(backup-directory-alist '(("." . "~/.emacs.d/.emacs_saves")))
 '(blink-cursor-mode nil)
 '(c-basic-offset 2)
 '(c-max-one-liner-length 120)
 '(cider-repl-display-help-banner nil)
 '(column-number-mode t)
 '(command-line-default-directory "~/" t)
 '(css-indent-offset 2)
 '(custom-safe-themes
   '("2540689fd0bc5d74c4682764ff6c94057ba8061a98be5dd21116bf7bf301acfb" default))
 '(default-input-method "korean-hangul3")
 '(delete-old-versions t)
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(flycheck-python-pycompile-executable "/usr/local/bin/python3")
 '(global-hl-line-mode t)
 '(groovy-indent-offset 2)
 '(help-at-pt-display-when-idle '(flymake-overlay) nil (help-at-pt))
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
   '("$" "_" "setTimeout" "require" "fetch" "define" "describe" "it" "after" "before" "expect" "xdescribe"))
 '(js2-mode-show-parse-errors nil)
 '(js2-mode-show-strict-warnings nil)
 '(kept-new-versions 6)
 '(kept-old-versions 2)
 '(lsp-ui-doc-border "gray55")
 '(lua-indent-level 2)
 '(magit-refresh-status-buffer nil)
 '(markdown-enable-math t)
 '(markdown-indent-on-enter nil)
 '(markdown-list-indent-width 2)
 '(neo-hidden-regexp-list '("\\.pyc$" "~$" "^#.*#$" "\\.elc$"))
 '(neo-theme 'nerd)
 '(neo-window-fixed-size nil)
 '(nrepl-use-ssh-fallback-for-remote-hosts t)
 '(ns-right-alternate-modifier 'none)
 '(org-agenda-files nil)
 '(org-cycle-separator-lines 1)
 '(org-default-priority 50)
 '(org-enable-priority-commands t)
 '(org-hide-emphasis-markers t)
 '(org-highest-priority 49)
 '(org-lowest-priority 51)
 '(org-priority-default 50)
 '(org-priority-enable-commands t)
 '(org-priority-highest 49)
 '(org-priority-lowest 51)
 '(org-table-default-size "3x2")
 '(org-todo-keyword-faces
   '(("PENDING" . "deep pink")
     ("IN-PROGRESS" . "blue")
     ("LATER" . "DarkOrange1")))
 '(org-todo-keywords '((sequence "TODO" "IN-PROGRESS" "PENDING" "DONE")))
 '(package-archives '(("melpa" . "https://melpa.org/packages/")))
 '(package-enable-at-startup nil)
 '(package-selected-packages
   '(0x0 edit-indirect emmet-mode lua-mode 0blayout hlinum flycheck-rust markdown-mode cargo-mode cider company company-lsp counsel counsel-projectile dockerfile-mode duplicate-thing exec-path-from-shell find-file-in-project flycheck flycheck-mmark flycheck-plantuml graphviz-dot-mode iedit ivy json-mode json-navigator lsp-java lsp-typescript magit markdown-mode mmm-mode move-dup move-text neotree org-journal package-lint paredit paredit-menu plantuml-mode poly-markdown polymode powerline projectile queue restclient rust-auto-use rust-mode rustic s stylus-mode swiper sws-mode tern tiny typescript-mode visual-regexp-steroids web-mode yasnippet multiple-cursors yaml-mode))
 '(plantuml-default-exec-mode 'executable)
 '(plantuml-executable-path "/usr/local/bin/plantuml")
 '(plantuml-indent-level 2)
 '(python-shell-interpreter "python3")
 '(recentf-exclude '(".*/\\.emacs\\.d\\/elpa/.*el"))
 '(recentf-max-saved-items 200)
 '(safe-local-variable-values '((flycheck-disabled-checkers . javascript-standard)))
 '(scroll-bar-mode nil)
 '(shell-file-name "/bin/bash")
 '(show-paren-mode t)
 '(speedbar-indentation-width 2)
 '(speedbar-supported-extension-expressions
   '(".org" ".el" ".emacs" ".java" ".js" ".s?html" ".clj" ".json" ".md" ".css"))
 '(speedbar-use-images nil)
 '(split-height-threshold 80)
 '(split-width-threshold 300)
 '(standard-indent 1)
 '(tab-stop-list nil)
 '(tab-width 2)
 '(text-mode-hook '(visual-line-mode))
 '(tool-bar-mode nil)
 '(tramp-default-method "ssh")
 '(typescript-indent-level 2)
 '(version-control t)
 '(vr/command-python
   "python3 /Users/seongjun/.emacs.d/elpa/visual-regexp-steroids-20170222.253/regexp.py"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-scrollbar-bg ((t (:background "dark gray"))) t)
 '(company-scrollbar-fg ((t (:background "dark blue"))) t)
 '(company-template-field ((t (:background "LightBlue1" :foreground "black"))))
 '(company-tooltip ((t (:background "light gray" :foreground "black"))))
 '(hl-line ((t (:background "#ddd"))))
 '(js2-function-call ((t (:inherit default :foreground "dark blue"))))
 '(lsp-ui-sideline-code-action ((t (:foreground "SpringGreen4"))))
 '(lsp-ui-sideline-current-symbol ((t (:foreground "dark blue" :box (:line-width -1 :color "white") :weight ultra-bold :height 0.99))))
 '(markdown-bold-face ((t (:inherit font-lock-variable-name-face :foreground "Red" :weight semi-bold))))
 '(markdown-header-face ((t (:inherit font-lock-function-name-face :weight semi-bold))))
 '(markdown-italic-face ((t (:inherit font-lock-variable-name-face :slant normal))))
 '(mode-line ((t (:background "light blue" :foreground "black" :box (:line-width -1 :style released-button)))))
 '(org-code ((t (:inherit nil :foreground "deep pink"))))
 '(org-level-1 ((t (:inherit outline-1 :foreground "gray30" :weight bold :height 1.2))))
 '(org-table ((t (:foreground "Black" :height 0.9))))
 '(powerline-inactive1 ((t (:inherit mode-line-inactive :background "grey11" :foreground "gray55")))))

(setq default-directory "~/")
(add-hook 'before-save-hook 'whitespace-cleanup)
(global-unset-key (kbd "s-t"))         ; disable Cmd+t which shows font dialog.
(global-unset-key (kbd "s-n"))         ; disable Cmd+n which opens a new frame.
(global-unset-key (kbd "s-p"))         ; disable Cmd+p which prints buffer.
(global-unset-key (kbd "C-x C-r"))     ; disable C-x C-r which runs find file read-only.
(global-set-key (kbd "s-<return>") 'toggle-frame-fullscreen)

(exec-path-from-shell-initialize)

;; font
(set-fontset-font "fontset-default" '(#x1100 . #xffdc) "AppleMyungjo")

;; font size
(set-face-attribute 'default nil :height 150) ; 15pt

(define-key global-map (kbd "s-=") 'text-scale-increase)
(define-key global-map (kbd "s--") 'text-scale-decrease)
(defun text-scale-default ()
  "Scale to default."
  (interactive)
  (text-scale-adjust 0))
(define-key global-map (kbd "s-0") 'text-scale-default)

(defun next-user-buffer ()
  "Switch to the next user buffer in cyclic order.
User buffers are those not starting with *."
  (interactive)
  (next-buffer)
  (let ((i 0) (buf-cnt (length (buffer-list))))
    (while (and (string-match "^*" (buffer-name)) (< i buf-cnt))
      (setq i (1+ i)) (next-buffer) )))

(defun previous-user-buffer ()
  "Switch to the previous user buffer in cyclic order.
User buffers are those not starting with *."
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
  "Open a line below the current position."
  (interactive)
  (end-of-line)
  (open-line 1)
  (forward-line))

(defun open-line-above ()
  "Open a line above the current position."
  (interactive)
  (beginning-of-line)
  (open-line 1))

(global-unset-key (kbd  "C-o"))
(global-set-key (kbd "C-o") 'open-line-below)
(global-set-key (kbd "C-S-o") 'open-line-above)

(defun open-init-file ()
  "Open init.el file."
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key [f12] 'open-init-file)

(defun open-todo ()
  "Open todo.org file."
  (interactive)
  (find-file "~/Documents/orgs/todo.org"))
(global-set-key [f11] 'open-todo)

(eval-after-load "paredit.el"
  '(require 'paredit-menu))

;; Cmd+delete
(defun delete-to-line-start ()
  "Delete everything from the current position to the beginning of the line."
  (interactive)
  (push-mark)
  (move-beginning-of-line 1)
  (kill-region (mark) (point)))

(global-set-key (kbd "s-<backspace>") 'delete-to-line-start)

(defun join-lines-in-region (beg end)
  "Apply \\='join-line over region.
BEG beginning of the region.
END end of the region."
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
  "Insert date."
  (interactive)
  (with-no-warnings
    (require 'org)
    (let* ((dt (org-time-stamp nil))
           (len (length dt)))
      (backward-delete-char-untabify len)
      (insert (substring dt 1 11)))))

(global-set-key (kbd "C-c .") 'insert-date)

;; suppress ad-handle-definition: warning
(setq ad-redefinition-action 'accept)

;; manual map from ext to mode
(add-to-list 'auto-mode-alist '("\\.sh\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("ssh-dev" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.bashrc-macbook\\'" . sh-mode))

;; packages

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

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
  :hook (sgml-mode web-mode))

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

(use-package company
  :ensure t
  :config
  (global-company-mode)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (add-to-list 'company-backends 'company-dabbrev-code))

(use-package rust-mode
  :hook ((rust-mode . flycheck-rust-setup)
         (rust-mode . flycheck-rust)
         (rust-mode . lsp)
         (rust-mode . lsp-lens-mode)
         (rust-mode . cargo-minor-mode)
         (rust-mode . eldoc-mode))
  :custom
  (lsp-rust-server 'rust-analyzer))

(use-package cider
  :ensure t
  :hook ((clojure-mode . cider-mode)
         (cider-mode . eldoc-mode))
  :bind
  (:map cider-repl-mode-map
        ("C-c C-k" . cider-repl-clear-buffer)))

(use-package json-mode)

(use-package js2-mode
  :hook ((js2-mode . tern-mode))
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))

(use-package web-mode
  :config
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.ejs\\'" . web-mode)))

(defun auto-margin ()
  "Set margins in current buffer."
  (interactive)
  (setq right-fringe-width 0)
  (let ((margin 0)
        (desired-width 80)
        (actual-width (window-total-width)))
    (setq margin (- actual-width desired-width))
    (if (> margin 0)
        (setq right-margin-width margin))))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :hook ((markdown-mode . flycheck-mode))
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'"       . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)
         ("\\.mmark\\'"    . markdown-mode)))

(use-package restclient
  :config
  (add-to-list 'auto-mode-alist '("\\.http\\'" . restclient-mode)))

(use-package ace-window
  :bind ("M-p" . ace-window))

(use-package mmm-mode
  :init
  (setq mmm-global-mode 'maybe)
  :config
  (mmm-add-classes
   '((md-tex  :submode tex-mode     :front "\\$\\$\\%math\n" :back "\\$\\$")
     (md-clj  :submode clojure-mode :front "```clojure\n" :back "```\n")
     (md-lisp :submode lisp-mode    :front "```lisp\n"    :back "```\n")
     (md-java :submode java-mode    :front "```java\n"    :back "```\n")
     (md-rust :submode rust-mode    :front "```rust\n"    :back "```\n")))
  (with-no-warnings
    (mmm-add-mode-ext-class 'markdown-mode nil 'md-tex)
    (mmm-add-mode-ext-class 'markdown-mode nil 'md-clj)
    (mmm-add-mode-ext-class 'markdown-mode nil 'md-lisp)
    (mmm-add-mode-ext-class 'markdown-mode nil 'md-java)
    (mmm-add-mode-ext-class 'markdown-mode nil 'md-rust)))

(use-package goto-last-change
  :bind ("C-." . goto-last-change))

(use-package move-text
  :config (move-text-default-bindings))

(use-package duplicate-thing
  :bind ("M-s-<down>" . duplicate-thing))

(use-package powerline
  :config
  (powerline-default-theme))

(use-package plantuml-mode
  :config
  (setq plantuml-java-command "/usr/local/bin/plantuml")
  (setq plantuml-jar-path "")
  (add-to-list 'auto-mode-alist '("\\.\\(plant\\)?uml\\'" . plantuml-mode)))

(use-package graphviz-dot-mode)

(use-package tiny
  :config
  (with-no-warnings
    (tiny-setup-default)))

;; Disable backup
(setq backup-inhibited t)
;; Disable auto save
(setq auto-save-default nil)

;; Set up unicode
(prefer-coding-system           'utf-8)
(set-default-coding-systems     'utf-8)
(setq buffer-file-coding-system 'utf-8)

;; background color
;; (set-background-color "#eee")

;;; init.el ends here
