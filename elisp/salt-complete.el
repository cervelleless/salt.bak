;;; salt-complete.el --- completion utils -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2020 cervelleless
;;
;; Author: cervelleless <http://github.com/cervelleless>
;; Maintainer: cervelleless <cervelleless@gmail.com>
;; Created: December 02, 2020
;; Modified: December 02, 2020
;; Version: 0.0.1
;; Keywords:
;; Homepage: https://github.com/felix/salt-complete
;; Package-Requires: ((emacs 27.1) (cl-lib "0.5"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  completion utils
;;
;;; Code:

(eval-when-compile
  (require 'use-package))
;; (require 'bind-key)

;; company
(use-package company
  :defer 2
  :init
  (setq company-idle-delay 0.25)
  (setq company-show-numbers t)
  (setq company-tooltip-limit 10)
  (setq company-minimum-prefix-length 2)
  (setq company-tooltip-align-annotations t)
  ;; invert the navigation direction if the the completion popup-isearch-match
  ;; is displayed on top (happens near the bottom of windows)
  (setq company-tooltip-flip-when-above t)
  :hook (after-init . global-company-mode))

;; yassnippet
(use-package yasnippet
  :defer t
  :commands (yas-minor-mode yas-reload-all)
  :config
  (yas-reload-all)
  :hook (prog-mode . yas-minor-mode))

(use-package auto-yasnippet
  :defer t
  )


(provide 'salt-complete)
;;; salt-complete.el ends here
