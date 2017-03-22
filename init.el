;;; package --- Summary
;;; Commentary:
;;; Main EMACS settings file, load settings from parts.

;;; Code:

(load "~/.emacs.d/packages.el")
(load "~/.emacs.d/personal.el")
(load "~/.emacs.d/fonts.el")
(load "~/.emacs.d/web.el")
(load "~/.emacs.d/js2.el")
(load "~/.emacs.d/lisp.el")
(load "~/.emacs.d/python.el")
(load "~/.emacs.d/ibuffer.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(magit-log-arguments
   (quote
    ("--graph" "--color" "--decorate" "--show-signature" "--follow" "-n256")))
 '(neo-vc-state-char-alist
   (quote
    ((up-to-date . 32)
     (edited . 69)
     (added . 43)
     (removed . 45)
     (missing . 33)
     (needs-merge . 77)
     (conflict . 33)
     (unlocked-changes . 33)
     (needs-update . 85)
     (ignored . 38)
     (user . 85)
     (unregistered . 40)
(nil . 40)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
