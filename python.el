(require 'python)

(setq ropemacs-enable-autoimport t)
(require 'py-autopep8)

(elpy-enable)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))

;; jedi autocomplete
(add-hook 'python-mode-hook 'jedi:setup) ;; requires -x jedi:install-server
(setq jedi:complete-on-dot t)

(elpy-enable)
(setq elpy-rpc-backend "jedi")
