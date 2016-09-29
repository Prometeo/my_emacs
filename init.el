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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
