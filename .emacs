(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(c-max-one-liner-length 120)
 '(column-number-mode t)
 '(css-indent-offset 2)
 '(current-language-environment "Korean")
 '(default-input-method "korean-hangul3")
 '(hightlight-parenthese-mode t)
 '(indent-tabs-mode nil)
 '(js-indent-level 2)
 '(js2-basic-offset 2)
 '(package-archives (quote (("marmalade" . "http://marmalade-repo.org/packages/") ("ELPA" . "http://tromey.com/elpa/") ("gnu" . "http://elpa.gnu.org/packages/") ("MELPA" . "http://melpa.milkbox.net/packages/"))))
 '(recenter-positions (quote (top middle bottom)))
 '(scala-interpreter "scala -deprecation")
 '(show-paren-mode t)
 '(standard-indent 1)
 '(tab-stop-list nil)
 '(tab-width 2)
 '(text-mode-hook (quote (turn-off-auto-fill text-mode-hook-identify)))
 '(tool-bar-mode nil))

(add-hook 'before-save-hook 'whitespace-cleanup)

(package-initialize)

(set-frame-width (selected-frame) 86)
(set-frame-height (selected-frame) 47)

(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.emacs_saves"))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)       ; use versioned backups

;; multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C->") 'mc/mark-all-like-this)

;; projectile
(require 'projectile)
(projectile-global-mode)

;; helm
(require 'helm-config)
(setq helm-idle-delay 0.1)
(setq helm-input-idle-delay 0.1)
(global-set-key (kbd "M-t") 'helm-for-files)

;; helm-projectile
(require 'helm-projectile)
(global-set-key (kbd "C-x p") 'helm-projectile)

;; powerline
;;(add-to-list 'load-path "~/.emacs.d/powerline")
;;(require 'powerline)
;;(powerline-default)

;; js-hint
(require 'flymake-jshint-autoloads)

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



;; ;; switch buffers with arrow(left, right) key
;; (defun next-user-buffer ()
;;   "Switch to the next user buffer in cyclic order. User buffers are those not starting with *."
;;   (interactive)
;;   (next-buffer)
;;   (let ((i 0))
;;     (while (and (string-match "^*" (buffer-name)) (< i 50))
;;       (setq i (1+ i)) (next-buffer) )))

;; (defun previous-user-buffer ()
;;   "Switch to the previous user buffer in cyclic order. User buffers are those not starting with *."
;;   (interactive)
;;   (previous-buffer)
;;   (let ((i 0))
;;     (while (and (string-match "^*" (buffer-name)) (< i 50))
;;       (setq i (1+ i)) (previous-buffer) ))
;;   )

;; (global-set-key [M-left] 'previous-user-buffer)
;; (global-set-key [M-right] 'next-user-buffer)



;; yasnippet
(add-to-list 'load-path
             "~/.emacs.d/elpa/yasnippet-20131014.928")
(setq yas-snippet-dirs '("~/.emacs.d/snippets" "~/.emacs.d/elpa/yasnippet-20131203.720/snippets"))
(require 'yasnippet)
(yas-global-mode 1)


;; auto-complete
;(add-to-list 'load-path "~/.emacs.d/elpa/popup-0.5")
;(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-1.4")
(require 'auto-complete)
(global-auto-complete-mode t)
(auto-complete-mode t)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(ac-set-trigger-key "TAB")

(defun run-current-file ()
  "Execute or compile the current file.
   For example, if the current buffer is the file x.pl,
   then it'll call ¡°perl x.pl¡± in a shell.
   The file can be php, perl, python, ruby, javascript, bash, ocaml, vb, elisp.
   File suffix is used to determine what program to run."
  (interactive)
  (let (suffixMap fname suffix progName cmdStr)
    ;; a keyed list of file suffix to comand-line program path/name
    (setq suffixMap
          '(
            ("py"    . "python")
            ("rb"    . "ruby")
            ("js"    . "node")
            )
          )
    (save-buffer)
    (setq fname (buffer-file-name))
    (setq suffix (file-name-extension fname))
    (setq progName (cdr (assoc suffix suffixMap)))
    (setq cmdStr (concat progName " \""   fname "\""))

    (if (string-equal suffix "el") ; special case for emacs lisp
        (load-file fname)
      (if progName
    (progn
      (message "Running...")
      ;;(generalized-shell-command cmdStr)
      (shell-command cmdStr "*run-current-file output*" )
      (switch-to-buffer-other-window "*run-current-file output*" )
      (previous-multiframe-window)
      )
        (message "No recognized program file suffix for this file.")
        )
      )))
;; (global-set-key [C-c C-c] 'run-current-file)
(global-set-key (kbd "C-c C-c") 'run-current-file)

;; ;; Scala mode
;; (add-to-list 'load-path "~/.emacs.d/plugins/scala-mode")
;; (require 'scala-mode-auto)
;; (add-hook 'scala-mode-hook
;;           '(lambda ()
;;              (progn
;;                (yas/minor-mode-on)
;;                (local-unset-key (kbd "C-c C-C"))
;;                (local-set-key (kbd "C-c C-c") 'scala-eval-buffer))))

;; (require 'scala-mode)

;; (add-to-list 'auto-mode-alist '("\\.scala$" . scala-mode))
;; (add-to-list 'load-path "~/.emacs.d/ensime_2.9.2-RC1-0.9.3.RC4/elisp/")
;; (require 'ensime)
;; (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; (push "/PL/scala-2.9.0.1/bin" exec-path)
;; (push "/Tools/sbt" exec-path)

;; js2-mode
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(defun open-line-below ()
  (interactive)
  (end-of-line)
  (open-line 1)
  (next-line))

(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (open-line 1))

;; (global-set-key [C-o] 'open-line-below)
;; (global-set-key [C-S-o] 'open-line-above)
(global-unset-key (kbd  "C-o"))
(global-set-key (kbd "C-o") 'open-line-below)
(global-set-key (kbd "C-S-o") 'open-line-above)

(defun open-dot-emacs()
  (interactive)
  (find-file "~/.emacs"))
(global-set-key [f12] 'open-dot-emacs)

;; (defun open-bash-profile ()
;;   (interactive)
;;   (find-file "~/.bash_profile"))

(add-hook 'js2-mode-hook (lambda () (flymake-mode t)))
(add-hook 'eshell-mode-hook
          'lambda nil
          (let ((bashpath (shell-command-to-string "/bin/bash -l -c 'printenv PATH'")))
            (let ((pathlst (split-string bashpath ":")))
              (setq exec-path pathlst))
            (setq eshell-path-env bashpath)
            (setenv "PATH" bashpath)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(italic ((t (:slant normal)))))
(put 'erase-buffer 'disabled nil)



(require 'js2-refactor)
