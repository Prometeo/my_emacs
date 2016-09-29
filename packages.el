;;; Package --- Summary
;;; Commentary:
;;; Required packages for automatic install

;;; Code:

;;; Install el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

(setq required-packages
      (append
       ;; list of packages we use straight from official recipes
       '(
	 ac-html
	 auto-complete
	 el-get
	 emacs-neotree
	 emmet-mode
	 fill-column-indicator
	 flycheck
	 flycheck-pos-tip
	 git-gutter
	 helm
	 highlight-parentheses
	 indent-guide
	 json-mode
	 js2-mode
	 less-css-mode
	 ;;mode-icons
	 monokai-theme
	 paredit
	 php-mode
	 powerline
	 rainbow-delimiters
	 smartparens
	 tern
	 undo-tree
	 web-mode
         )

       (mapcar 'el-get-as-symbol (mapcar 'el-get-source-name el-get-sources))))

(el-get 'sync required-packages)


;;; Install required packages from MELPA STABLE
(require 'package)
(require 'cl)

(defvar elpa-packages '(
			web-beautify
                        ))

(defun cfg:install-packages ()
  (let ((pkgs (remove-if #'package-installed-p elpa-packages)))
    (when pkgs
      (message "%s" "Emacs refresh packages database...")
      (package-refresh-contents)
      (message "%s" " done.")
      (dolist (p elpa-packages)
        (package-install p)))))

(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(package-initialize)

(cfg:install-packages)

;;; packages.el ends here
