;;; Package --- Summary
;;; Commentary:
;;; Settings for JS2-mode

;;; Code:

(require 'js2-mode)
(require 'flycheck)
(require 'tern)
(require 'web-beautify)

(add-hook 'js2-mode-hook (lambda ()(flycheck-mode t)))
(add-hook 'js2-mode-hook (lambda ()(tern-mode t)))
(add-hook 'js2-mode-hook (lambda ()(js2-highlight-unused-variables-mode t)))
(add-hook 'js2-mode-hook (lambda ()(add-hook 'before-save-hook 'web-beautify-js-buffer t t)))

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(setq js2-pretty-multiline-declarations 'now)
(setq js2-highlight-unused-variables 1)

(require 'web-beautify)
(eval-after-load 'js2
  '(add-hook 'js2-mode-hook
             (lambda ()
               (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

(eval-after-load 'js2-mode
  '(add-hook 'js2-mode-hook
             (lambda ()
               (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

;; Or if you're using 'js-mode' (a.k.a 'javascript-mode')
(eval-after-load 'js
  '(add-hook 'js-mode-hook
             (lambda ()
               (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

(eval-after-load 'json-mode
  '(add-hook 'json-mode-hook
             (lambda ()
               (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

;;; js2.el ends here