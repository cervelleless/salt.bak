;;; salt-ui.el --- ui with doom-themes -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2020 cervelleless
;;
;; Author: cervelleless <http://github/felix>
;; Maintainer: cervelleless <cervelleless@gmail.com>
;; Created: December 02, 2020
;; Modified: December 02, 2020
;; Version: 0.0.1
;; Keywords:
;; Homepage: https://github.com/felix/salt-ui
;; Package-Requires: ((emacs 27.1) (cl-lib "0.5"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  ui with doom-themes
;;
;;; Code:

(eval-when-compile
  (require 'use-package))
;; (require 'bind-key)

;; theme
(use-package doom-themes
  :init (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
              doom-themes-enable-italic t) ; if nil, italics is universally disabled
  :config
  (load-theme 'doom-one t))

(use-package minions
  :defer t
  :hook (doom-modeline-mode . minions-mode)
  :custom
  (minions-mode-line-lighter ""))

(use-package doom-modeline
  :defer t
  :hook (after-init . doom-modeline-mode)
  :custom-face
  (mode-line ((t (:height 1.0))))
  (mode-line-inactive ((t (:height 1.0))))
  :init
  (setq doom-modeline-height 15
        doom-modeline-bar-width 6
        doom-modeline-lsp t
        doom-modeline-github nil
        doom-modeline-mu4e nil
        doom-modeline-irc nil
        doom-modeline-minor-modes t
        doom-modeline-persp-name nil
        doom-modeline-buffer-file-name-style 'truncate-except-project
        doom-modeline-major-mode-icon nil))



(provide 'salt-ui)
;;; salt-ui.el ends here
