;;; Package --- Summary
;;; Commentary:
;;; Settings for WEB-development

;;; Code:

(require 'web-mode)
(require 'less-css-mode)
(require 'emmet-mode)
(require 'json-mode)

;;; Comment:
;;; Uncomment for compiling less at save
;; (setq less-css-compile-at-save t)

(autoload 'web-mode "web-mode" "" t)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.bowerrc\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))



(add-hook 'web-mode-hook (lambda ()
                           (setq web-mode-markup-indent-offset 2)
                           (setq web-mode-css-indent-offset 2)
                           (setq web-mode-code-indent-offset 2)
                           (setq web-mode-indent-style 2)
                           (setq web-mode-enable-auto-pairing t)
                           (setq web-mode-enable-css-colorization t)
                           (setq web-mode-enable-current-element-highlight t)
                           (setq web-mode-enable-current-column-highlight t)
))


(setq web-mode-enable-current-column-highlight t)
(setq web-mode-enable-current-element-highlight t)


(setq web-mode-enable-comment-keywords t)
(setq web-mode-enable-css-colorization t)
(setq web-mode-enable-block-face t)


(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))


;; Associate to a content type
(add-to-list 'auto-mode-alist '("\\.api\\'" . web-mode))
(add-to-list 'auto-mode-alist '("/some/react/path/.*\\.js[x]?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.blade\\.php\\'" . web-mode))


(setq web-mode-content-types-alist
      '(("json" . "/some/path/.*\\.api\\'")
        ("xml"  . "/other/path/.*\\.api\\'")
("jsx" . "/some/react/path/.*\\.js[x]?\\'")))


;; Enable emmet mode
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)
(add-hook 'less-mode-hook 'emmet-mode)
(add-hook 'emmet-mode-hook
          (lambda ()
            (setq emmet-indentation 2)))
(setq emmet-preview-default nil)


(setq web-mode-enable-auto-pairing t)

(setq web-mode-ac-sources-alist
  '(("css" . (ac-source-css-property))
    ("html" . (ac-source-words-in-buffer ac-source-abbrev))))
