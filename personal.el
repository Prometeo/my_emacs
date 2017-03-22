;;; package --- Summary
;;; Commentary:
;;; Main EMACS settings file, load settings from parts.

;;; Code:

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
(require 'linum)

(cua-mode 1)                   ;; enable ctrl-z, ctrl-v ...
(dired-omit-mode 1)
(electric-pair-mode 1)         ;; Electric pair mode
(fset 'yes-or-no-p 'y-or-n-p)
(global-git-gutter-mode +1)    ;; Show +, - and = on left side, by git status
(global-hl-line-mode 1)        ;; Highlight current line always
(global-undo-tree-mode)        ;; Global undo tree
(global-set-key (kbd "M-x") 'helm-M-x)   ;;; enable global helm on M-x
(helm-mode 1)                  ;; Turn on completion for commands
(highlight-parentheses-mode 1) ;; Highlight pair parentheses
(ido-mode t)
(kill-buffer "*scratch*")
(load-theme 'monokai t)        ;; Colorized theme
(menu-bar-mode -1)             ;; Disable menu
(scroll-bar-mode -1)           ;; Disable scrollbar
(show-paren-mode t)
(smartparens-global-mode 1)
(tool-bar-mode -1)             ;; Disable toolbar
(tooltip-mode -1)
(setq-default user-full-name "crandel") ;; The full name of the user logged in
(setq ido-enable-flex-matching t)  ;; setting up ido mode
(setq ido-everywhere t)
(setq dired-listing-switches "-alk")  ;; setting up dired mode
(setq directory-free-space-args "-Pm")
(setq search-highlight        t)  ;; Highlight search results
(setq query-replace-highlight t)
(setq column-number-mode 1)                          ;; Show column number
(setq use-dialog-box nil)                            ;; Not user GUI dialogs, only minibuffer
(auto-fill-mode -1)                                  ;; ?????
(setq-default indent-tabs-mode nil)                  ;; Do not use TABS.
(setq-default tab-width          4)                  ;; Replace TAB to 4 spaces
(setq-default c-basic-offset     4)
(setq-default standart-indent    4)                  ;; Set indent width 4 spaces
;; Disable backup/autosave files
(setq backup-inhibited t)                            ;; Do not create backup files
(setq make-backup-files        nil)
(setq auto-save-default        nil)
(setq auto-save-list-file-name nil)
(setq auto-save-default nil)                         ;; Disable autosave
(setq scroll-preserve-screen-position 10)            ;; Set next 10 lines after cursor go to page down
(setq neo-window-width 35)
(global-prettify-symbols-mode 1);;; Replace "lambda" to λ, function to
(setq inhibit-splash-screen   t)
(setq inhibit-startup-message t)
;;cursor
(setq-default cursor-type 'bar)
(set-cursor-color "#BE81F7")
;;Imenu
(setq imenu-auto-rescan      t) ;; actualizar automáticamente la lista de funciones en el búfer
(setq imenu-use-popup-menu nil) ;; diálogo imenu sólo en el minibuffer
(semantic-mode 1)
(setq frame-title-format "%b")  ;; Display the name of the current buffer in the title bar
;; Coding-system settings
(set-language-environment 'UTF-8)
(setq buffer-file-coding-system 'utf-8)
(setq-default coding-system-for-read    'utf-8)
(setq file-name-coding-system           'utf-8)
(set-selection-coding-system            'utf-8)
(set-keyboard-coding-system        'utf-8-unix)
(set-terminal-coding-system             'utf-8)
(prefer-coding-system 'utf-8)
;; Linum plugin
(line-number-mode   t) ;; Show line number in mode-line
(global-linum-mode  t) ;; Show line numbers in all buffers
(column-number-mode t) ;; Show column number in mode-line
(setq linum-format " %d") ;; Set the numbering format for strings
;; Fringe settings
(fringe-mode '(8 . 0)) ;; Text delimiter left only
(setq-default indicate-buffer-boundaries 'left) ;; Indication only on the left
;; Display file size/time in mode-line
(setq display-time-24hr-format t) ;; 24-hour time format in mode-lin
(display-time-mode             t) ;; Show hours in mode-line
(size-indication-mode          t) ;; File size in% -s
(defun add-mode-line-dirtrack ()
    (add-to-list 'mode-line-buffer-identification
       '(:propertize (" " default-directory " ") face dired-directory)))
(add-hook 'shell-mode-hook 'add-mode-line-dirtrack)

;; Clipboard settings
(setq x-select-enable-clipboard t)


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


;;Agressive indent
;(global-aggressive-indent-mode 1)
;(add-to-list 'aggressive-indent-excluded-modes 'html-mode)

;;;personal.el ends here
