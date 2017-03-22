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
     ;;aggressive-indent-mode
     avi
     company-flx
     company-jedi
     company-mode
     company-tern
     company-web
     el-get
     elpy
     emacs-neotree
     emacs-fish
     expand-region
     emmet-mode
     expand-region
     fill-column-indicator
     flycheck
     flycheck-pos-tip
     git-gutter
     helm
     helm-ls-git
     helm-projectile
     helm-swoop
     highlight-parentheses
     indent-guide
     jedi
     json-mode
     js2-mode
     less-css-mode
     livedown
     magit
     mark-down-mode
     mo-git-blame
     monokai-theme
     multiple-cursors
     neotree
     paredit
     php-mode
     pip-requirements
     py-autopep8
     pyenv
     powerline
     projectile
     py-autopep8
     py-isort
     restclient
     smartparens
     tern
     undo-tree
     web-mode
     xclip
     yasnippet
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
