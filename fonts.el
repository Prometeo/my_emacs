;;; Pacakge --- Summary
;;; Commentary:
;;; Font settings
;;; Code:

(set-face-attribute 'default nil :height 100)

(when (member "DejaVu Sans Mono" (font-family-list))
  (set-face-attribute 'default nil :font "DejaVu Sans Mono"))

;;; fonts.el ends here
