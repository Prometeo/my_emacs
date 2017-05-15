
;; code
(require 'python)
(require 'autopep8)

(setq ropemacs-enable-autoimport t)
(require 'py-autopep8)

(elpy-enable)


(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))

(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
(setq elpy-rpc-backend "jedi")
