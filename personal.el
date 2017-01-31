(require 'dired)
(require 'helm-mode)
(require 'highlight-parentheses)
(require 'ibuffer)
(require 'ido)
(require 'fill-column-indicator)
(require 'flycheck)
(require 'git-gutter)
(require 'neotree)
(require 'paredit)
(require 'rainbow-delimiters)
(require 'undo-tree)


(cua-mode 1)                   ;;; enabliz ctrl-z, ctrl-v ...
(dired-omit-mode 1)
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

;; setting up dired mode
(setq dired-listing-switches "-alk")
(setq directory-free-space-args "-Pm")

;; Highlight search results
(setq search-highlight        t)
(setq query-replace-highlight t)

(setq column-number-mode 1)                          ;; Show column number
(setq use-dialog-box nil)                            ;; Not user GUI dialogs, only minibuffer
(auto-fill-mode -1)                                  ;; ?????
(setq-default indent-tabs-mode nil)                  ;; Do not use TABS.
(setq-default tab-width          4)                  ;; Replace TAB to 4 spaces
(setq-default c-basic-offset     4)
(setq-default standart-indent    4)                  ;; Set indent width 4 spaces
(setq backup-inhibited t)                            ;; Do not create backup files
(setq auto-save-default nil)                         ;; Disable autosave
(setq scroll-preserve-screen-position 10)            ;; Set next 10 lines after cursor go to page down
(setq neo-window-width 35)
(global-prettify-symbols-mode 1) ;;; Replace "lambda" to λ, function to


;; Calling neotree globally at the start
;;(neotree-show)


;; enabling flycheck
(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))
(global-flycheck-mode)


;; Setting up fill-column-indicator
(define-globalized-minor-mode
  global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode t)
(setq fci-rule-column 80)
(setq fci-rule-width 1)
(setq fci-rule-color "darkblue")

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

;; make undo-tree split on one side
(defadvice undo-tree-visualize (around undo-tree-split-side-by-side activate)
  "Split undo-tree side-by-side"
  (let ((split-height-threshold nil)
        (split-width-threshold 0))
ad-do-it))


;; Keybinding to move between frames
(global-set-key (kbd "C-c <left>") 'windmove-left)        ; move to left window
(global-set-key (kbd "C-c <right>") 'windmove-right)      ; move to right window
(global-set-key (kbd "C-c <up>") 'windmove-up)            ; move to upper window
(global-set-key (kbd "C-c <down>") 'windmove-down)        ; move to lower window
