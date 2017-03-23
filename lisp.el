(require 'lisp-mode)
(add-to-list 'auto-mode-alist '("\\.el$" . lisp-mode))

(defun my-lisp-hooks()
    (progn
     (eval-after-load "company"
              '(progn
                   (unless (member 'company-elisp (car company-backends))
                            (setq comp-back (car company-backends))
                            (push 'company-elisp comp-back)
                            (setq company-backends (list comp-back)))
                   ))))
(add-hook 'lisp-interaction-mode-hook 'my-lisp-hooks)
