(use-package treemacs
             :ensure t
             :defer t
             :config
             (progn
               (setq treemacs-change-root-without-asking nil
                     treemacs-collapse-dirs              (if (executable-find "python") 3 0)
                     treemacs-file-event-delay           5000
                     treemacs-follow-after-init          t
                     treemacs-follow-recenter-distance   0.1
                     treemacs-goto-tag-strategy          'refetch-index
                     treemacs-indentation                2
                     treemacs-indentation-string         " "
                     treemacs-is-never-other-window      nil
                     treemacs-never-persist              nil
                     treemacs-no-png-images              nil
                     treemacs-recenter-after-file-follow nil
                     treemacs-recenter-after-tag-follow  nil
                     treemacs-show-hidden-files          t
                     treemacs-silent-filewatch           nil
                     treemacs-silent-refresh             nil
                     treemacs-sorting                    'alphabetic-desc
                     treemacs-tag-follow-cleanup         t
                     treemacs-tag-follow-delay           1.5
                     treemacs-width                      35)

               (treemacs-follow-mode t)
               (treemacs-filewatch-mode t))
             :bind
             (:map global-map
                   ([f8]        . treemacs-toggle)
                   ([f9]        . treemacs-projectile-toggle)
                   ("M-0"       . treemacs-select-window)
                   ("C-c 1"     . treemacs-delete-other-windows)
                   ))
