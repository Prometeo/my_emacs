(require 'git-gutter)
(require 'flycheck)
(require 'helm-mode)
(require 'highlight-parentheses)
(require 'ido)
(require 'paredit)
(require 'rainbow-delimiters)



(cua-mode 1)                   ;;; enabliz ctrl-z, ctrl-v ...
(electric-pair-mode 1)         ;; Electric pair mode
(fset 'yes-or-no-p 'y-or-n-p)
(global-git-gutter-mode +1)    ;;; Show +, - and = on left side, by git status
(global-hl-line-mode 1)        ;;; Highlight current line always
(global-linum-mode 1)          ;;; Show line numbers globally
(global-undo-tree-mode)        ;;; Global undo tree
(global-set-key (kbd "M-x") 'helm-M-x)   ;;; enable global helm on M-x
(helm-mode 1)                  ;;; Turn on completion for commands
(highlight-parentheses-mode 1) ;;; Highlight pair parentheses
(ido-mode t)
(kill-buffer "*scratch*")
(load-theme 'monokai t)        ;;; Colorized theme
(menu-bar-mode -1)             ;;; Disable menu
(scroll-bar-mode -1)           ;;; Disable scrollbar
(show-paren-mode t)
(smartparens-global-mode 1)
(tool-bar-mode -1)             ;;; Disable toolbar


;; setting up ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)


;; Calling neotree globally at the start
;;(neotree-show)


;; enabling flycheck
(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))
(global-flycheck-mode)


;;; Disable overwrite mode-line
(define-key global-map [(insert)] nil)

(defun format-current-buffer()
  (indent-region (point-min) (point-max)))
(defun untabify-current-buffer()
  (if (not indent-tabs-mode)
      (untabify (point-min) (point-max)))
  nil)
(add-to-list 'write-file-functions 'untabify-current-buffer)
(add-to-list 'write-file-functions 'delete-trailing-whitespace)

(powerline-default-theme)
(setq visible-bell t)


;; make undo-tree split on one side
(defadvice undo-tree-visualize (around undo-tree-split-side-by-side activate)
  "Split undo-tree side-by-side"
  (let ((split-height-threshold nil)
        (split-width-threshold 0))
ad-do-it))


(add-hook 'prog-mode-hook #'rainbow-delimiters-mode) ;; Highliht parentheses
(git-gutter:linum-setup)
(setq rainbow-delimiters-max-face-count 9)
