;;; package --- Summary
;;; Commentary:
;;; Main EMACS settings file, load settings from parts.

;;; Code:


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

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
 '(company-preview-common ((t (:inherit company-preview :foreground "brightcyan"))))
 '(company-preview-search ((t (:inherit company-preview :background "black"))))
 '(company-scrollbar-bg ((t (:background "dark green"))))
 '(company-scrollbar-fg ((t (:background "red"))))
 '(company-template-field ((t (:background "black" :foreground "chartreuse"))))
 '(company-tooltip ((t (:background "black" :foreground "yellow green"))))
 '(company-tooltip-search ((t (:background "dark khaki" :underline "blue"))))
 '(company-tooltip-selection ((t (:background "honeydew" :foreground "dark green"))))
 '(magit-diff-added ((t (:background "green" :foreground "white"))))
 '(magit-diff-added-highlight ((t (:background "olive drab" :foreground "cyan"))))
 '(magit-diff-removed ((t (:background "red" :foreground "#ffdddd"))))
 '(magit-diff-removed-highlight ((t (:background "dark red" :foreground "navajo white"))))
 '(neo-vc-ignored-face ((t (:foreground "dark gray"))))
 '(neo-vc-missing-face ((t (:foreground "red"))))
 '(neo-vc-removed-face ((t (:box (:line-width 2 :color "yellow" :style released-button)))))
 '(neo-vc-unregistered-face ((t (:foreground "turquoise"))) t)
 '(neo-vc-up-to-date-face ((t (:foreground "dark olive green"))))
 '(neo-vc-user-face ((t (:foreground "red" :slant italic))))
 '(powerline-active1 ((t (:inherit mode-line :background "sienna"))))
 '(powerline-active2 ((t (:inherit mode-line :background "dark green"))))
 '(whitespace-empty ((t (:foreground "sienna"))))
 '(whitespace-hspace ((t (:background "grey24" :foreground "MistyRose4"))))
 '(whitespace-indentation ((t (:foreground "dim gray"))))
 '(whitespace-line ((t (:underline (:color foreground-color :style wave)))))
 '(whitespace-newline ((t (:foreground "dark green" :weight normal))))
 '(whitespace-space ((t (:foreground "DarkOrchid4"))))
 '(whitespace-space-after-tab ((t (:foreground "firebrick"))))
 '(whitespace-space-before-tab ((t (:foreground "firebrick"))))
 '(whitespace-tab ((t (:foreground "magenta"))))
 '(whitespace-trailing ((t (:foreground "yellow" :weight bold)))))
(put 'upcase-region 'disabled nil)
