(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(c-max-one-liner-length 120)
 '(column-number-mode t)
 '(command-line-default-directory "~/" t)
 '(css-indent-offset 2)
 '(current-language-environment "Korean")
 '(default-input-method "korean-hangul3")
 '(exec-path (quote ("/Users/ntalbs/bin" "/usr/local/bin" "/usr/bin" "/bin" "/usr/sbin" "/sbin" "/usr/local/share/npm/bin")))
 '(fringe-mode (quote (nil . 0)) nil (fringe))
 '(global-hl-line-mode t)
 '(help-at-pt-display-when-idle (quote (flymake-overlay)) nil (help-at-pt))
 '(help-at-pt-timer-delay 0.5)
 '(hightlight-parenthese-mode t)
 '(indent-tabs-mode nil)
 '(initial-scratch-message "")
 '(js2-basic-offset 2)
 '(js2-global-externs (quote ("$" "_" "setTimeout" "require" "define" "describe" "it" "after" "before" "expect" "xdescribe")))
 '(js2-mode-show-strict-warnings t)
 '(package-archives (quote (("MELPA" . "http://melpa.milkbox.net/packages/"))))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(speedbar-indentation-width 2 t)
 '(speedbar-supported-extension-expressions (quote (".org" ".el" ".emacs" ".java" ".js" ".s?html" ".clj" ".json" ".md" ".css")))
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
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:background "azure"))))
 '(italic ((t (:slant normal))))
 '(js2-function-call ((t (:inherit default :foreground "dark blue"))))
 '(markdown-bold-face ((t (:inherit font-lock-variable-name-face :foreground "Red" :weight semi-bold))))
 '(markdown-header-face ((t (:inherit font-lock-function-name-face :weight semi-bold))))
 '(markdown-italic-face ((t (:inherit font-lock-variable-name-face :slant normal)))))
(put 'erase-buffer 'disabled nil)

(package-initialize)

(setq default-directory "~/")
(add-hook 'before-save-hook 'whitespace-cleanup)

(defun set-ejs-mode ()
  (when (and (stringp buffer-file-name)
             (string-match "\\.ejs\\'" buffer-file-name))
    (html-mode)))
(add-hook 'find-file-hook 'set-ejs-mode)

(add-hook 'clojure-mode-hook 'cider-mode)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

(exec-path-from-shell-initialize)

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

;; (set-frame-width (selected-frame) 86)
;; (set-frame-height (selected-frame) 47)

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
(require 'mmm-auto)
(setq mmm-global-mode 'maybe)
(mmm-add-classes
 '((html-ejs :submode js-mode :front "<%[#=]?" :back "-?%>"
             :match-face (("<%#" . mmm-comment-submode-face)
                          ("<%=" . mmm-output-submode-face)
                          ("<%" . mmm-code-submode-face))
             :insert ((?% ejs-code nil @ "<%" @ " " _ " " @ "%>" @)
                      (?# ejs-comment nil @ "<%#" @ " " _ " " @ "%>" @)
                      (?= ejs-expression nil @ "<%=" @ " " _ " " @ "%>" @)))))

;;; Add html-js, embedded-css and html-ejs to html-mode
(mmm-add-mode-ext-class 'html-mode nil 'html-js)
(mmm-add-mode-ext-class 'html-mode nil 'html-css)
(mmm-add-mode-ext-class 'html-mode nil 'html-ejs)

;; multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C->") 'mc/mark-all-like-this)

;; projectile
(projectile-global-mode)
(setq projectile-completion-system 'default)

;; helm
;; (require 'helm-config)
;; (setq helm-idle-delay 0.1)
;; (setq helm-input-idle-delay 0.1)
;; (global-set-key (kbd "M-t") 'helm-for-files)

;; helm-projectile
(require 'helm-projectile)
(global-set-key (kbd "C-x p") 'helm-projectile)

;; Set up unicode
;; (set-terminal-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system       'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;; ;; From Emacs wiki
;; (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
;; ;; MS Windows clipboard is UTF-16LE
;; (set-clipboard-coding-system 'utf-16le-dos)

;; move line or region with arrow(up, down) key like in eclipse.
(defun move-text-internal (arg)
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
        (exchange-point-and-mark))
    (let ((column (current-column))
          (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (let ((column (current-column)))
      (beginning-of-line)
      (when (or (> arg 0) (not (bobp)))
        (forward-line)
        (when (or (< arg 0) (not (eobp)))
          (transpose-lines arg))
        (forward-line -1))
      (move-to-column column t)))))

(defun move-text-down (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines down."
  (interactive "*p")
  (move-text-internal arg))

(defun move-text-up (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines up."
  (interactive "*p")
  (move-text-internal (- arg)))

(defun duplicate-current-line-or-region-down (arg)
  "Duplicates the current line or region ARG times.
   If there's no region, the current line will be duplicated. However, if
   there's a region, all lines that region covers will be duplicated."
  (interactive "p")
  (let (beg end (origin (point)))
    (if (and mark-active (> (point) (mark)))
        (exchange-point-and-mark))
    (setq beg (line-beginning-position))
    (if mark-active
        (exchange-point-and-mark))
    (setq end (line-end-position))
    (let ((region (buffer-substring-no-properties beg end)))
      (dotimes (i arg)
        (goto-char end)
        (newline)
        (insert region)
        (setq end (point))))))


(defun duplicate-current-line-or-region-up (arg)
  (duplicate-current-line-or-region-down (arg)))

(global-set-key [C-M-up] 'duplicate-current-line-or-region-up)
(global-set-key [C-M-down] 'duplicate-current-line-or-region-down)
(global-set-key [M-up] 'move-text-up)
(global-set-key [M-down] 'move-text-down)

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

(global-set-key [s-left] 'previous-buffer)
(global-set-key [s-right] 'next-buffer)
(global-set-key [S-s-left] 'previous-user-buffer)
(global-set-key [S-s-right] 'next-user-buffer)

(global-set-key (kbd "M-s-<left>") 'windmove-left)
(global-set-key (kbd "M-s-<right>") 'windmove-right)
(global-set-key (kbd "M-s-<up>") 'windmove-up)
(global-set-key (kbd "M-s-<down>") 'windmove-down)

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
;(add-hook 'js2-mode-hook 'flymake-jshint-load)
(add-hook 'js2-mode-hook
          (lambda ()
            (setq-local jshint-configuration-path
                        (expand-file-name ".jshintrc" (locate-dominating-file default-directory ".jshintrc")))
            (flymake-jshint-load)))

;; tern
(add-to-list 'load-path "~/.emacs.d/elpa/tern-20130828.716/")
(autoload 'tern-mode "tern.el" nil t)
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

(defun open-dot-emacs ()
  (interactive)
  (find-file "~/.emacs"))
(global-set-key [f12] 'open-dot-emacs)

(defun open-todo ()
  (interactive)
  (find-file "~/todo.org"))
(global-set-key [f11] 'open-todo)

(eval-after-load "paredit.el"
  '(require 'paredit-menu))

;; Cmd+delete
(fset 'delete-to-line-start [?\S-\C-a backspace])
(global-set-key [s-backspace] 'delete-to-line-start)

;(setq clojure-defun-style-default-indent t)
;(setq lisp-indent-offset 2)

(global-unset-key (kbd "s-s"))
(global-set-key (kbd "s-s s-s") 'sr-speedbar-toggle)

;; ido
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; join-line from top
;; http://emacsredux.com/blog/2013/05/30/joining-lines/
;; (defun top-join-line ()
;;   "Join the current line with the line beneath it."
;;   (interactive)
;;   (delete-indentation 1))

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
