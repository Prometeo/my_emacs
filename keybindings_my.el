;; Custom keybindings

;; Moving
;; DOWN
(global-set-key (kbd "C-c k") 'kill-sentence)
;; RIGHT
(global-set-key (kbd "C-c d") 'downcase-word)
;; RIGHT WORD
(key-chord-define-global "kk" 'forward-word)
;; LEFT WORD
(key-chord-define-global "jj" 'backward-word)


(global-set-key (kbd "C-x C-b") 'electric-buffer-list)
(key-chord-define-global "bb" 'electric-buffer-list)


;; Multiple cursors
(global-set-key (kbd "C-c r") 'mc/mark-next-like-this-word) ; choose same word next
(global-set-key (kbd "C-c l") 'mc/mark-previous-word-like-this) ; choose same word previous
(global-set-key (kbd "M-n") 'mc/mark-next-like-this) ; choose char from next line same position
(global-set-key (kbd "M-m") 'mc/mark-previous-like-this); choose char from previous line same position

(global-set-key (kbd "C-c C-_") 'mc/mark-all-like-this)
(global-set-key (kbd "C-x M-m") 'back-to-indentation)

;; Magit
(global-unset-key (kbd "C-x C-z"))
(global-set-key (kbd "C-x C-z") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup);; Show list of commands availabel in the buffer
;; Mo-git-blame
(global-set-key (kbd "C-c g") 'mo-git-blame-current)
(key-chord-define-global "gg" 'mo-git-blame-current)

;; Git gutter
(global-set-key (kbd "C-c [") 'git-gutter:next-hunk)
(global-set-key (kbd "C-c ]") 'git-gutter:previous-hunk)

;; Helm
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-p") 'helm-multi-files)
(global-set-key [f10] 'helm-semantic-or-imenu)
(global-set-key (kbd "M-p") 'helm-projectile-ag)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

;;Helm-swoop
(global-unset-key (kbd "C-t"))
(global-set-key (kbd "C-t") 'helm-swoop)
(global-set-key (kbd "C-r") 'helm-multi-swoop-current-mode)

;; Smartparent
(global-unset-key (kbd "C-c w"))
(global-set-key (kbd "C-c w") 'sp-rewrap-sexp)
(key-chord-define-global "''" 'sp-rewrap-sexp)


;; Avy
(global-unset-key (kbd "C-_"))
(global-unset-key (kbd "C-/"))
(global-unset-key (kbd "C-c /"))
(global-set-key (kbd "C-_") 'avy-goto-char)
(global-set-key (kbd "C-/") 'avy-goto-char)
(global-set-key (kbd "C-c /") 'avy-goto-line)

;; Expand region
(global-unset-key (kbd "C-q"))
(global-set-key (kbd "C-q") 'er/expand-region)
(key-chord-define-global "**" 'er/expand-region)

;; move line up
(defun move-line-up ()
    (interactive)
    (transpose-lines 1)
    (previous-line 2))
(global-set-key [M-S-up] 'move-line-up)

;; move line down
(defun move-line-down ()
    (interactive)
    (next-line 1)
    (transpose-lines 1)
    (previous-line 1))
(global-set-key [M-S-down] 'move-line-down)


;; duplicate line
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
)
(global-unset-key (kbd "C-x C-d"))
(global-set-key (kbd "C-x C-d") 'duplicate-line)
(key-chord-define-global "yp" 'duplicate-line)

;; copy line
(defun copy-line (arg)
      "Copy lines (as many as prefix argument) in the kill ring"
      (interactive "p")
      (kill-ring-save (line-beginning-position)
                      (line-beginning-position (+ 1 arg)))
      (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

(global-unset-key (kbd "C-c C-k"))
(global-set-key (kbd "C-c C-k") 'copy-line)
(key-chord-define-global "yy" 'copy-line)

;; copy word
(defun get-point (symbol &optional arg)
      "get the point"
      (funcall symbol arg)
      (point)
)

(defun copy-thing (begin-of-thing end-of-thing &optional arg)
  "copy thing between beg & end into kill ring"
   (save-excursion
     (let ((beg (get-point begin-of-thing 1))
           (end (get-point end-of-thing arg)))
      (copy-region-as-kill beg end)))
)
(defun copy-word (&optional arg)
      "Copy words at point into kill-ring"
       (interactive "P")
       (copy-thing 'backward-word 'forward-word arg)
       ;;(paste-to-mark arg)
)
(global-unset-key (kbd "C-c C-w"))
(global-set-key (kbd "C-c C-w") 'copy-word)
(key-chord-define-global "ww" 'copy-word)

;; delete line
(defun my-delete-line ()
  "Delete text from current position to end of line char."
  (interactive)
  (kill-region
   (move-beginning-of-line 1)
   (save-excursion (move-end-of-line 1) (point)))
  (delete-char 1)
)
(key-chord-define-global "ññ" 'my-delete-line)


(key-chord-define-global "xx" 'save-buffer)
(key-chord-define-global "qq" 'delete-other-windows)
(key-chord-define-global "vv" 'save-buffers-kill-terminal)

(provide 'keybindings_my)
