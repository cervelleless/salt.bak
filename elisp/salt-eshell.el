;;; salt-eshell.el --- Eshell -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2020 cervelleless
;;
;; Author: cervelleless <http://github/felix>
;; Maintainer: cervelleless <cervelleless@gmail.com>
;; Created: December 02, 2020
;; Modified: December 02, 2020
;; Version: 0.0.1
;; Keywords:
;; Homepage: https://github.com/felix/salt-org
;; Package-Requires: ((emacs 27.1) (cl-lib "0.5"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Eshell configuration.
;;
;;; Code:
;; eshell

(eval-when-compile
  (require 'use-package))


(use-package eshell
  :defer t
  :commands (eshell/pushd eshell/pwd)
  :init
  (setq eshell-directory-name (concat user-emacs-directory ".local/eshell/")))

(use-package eshell-z
  :defer t
  :hook ((eshell-mode . (lambda () (require 'eshell-z)))
	 (eshell-z-change-dir .  (lambda () (eshell/pushd (eshell/pwd))))))

(use-package esh-help
  :defer t
  :config
  (setup-esh-help-eldoc))

(provide 'salt-eshell)
;;; salt-eshell.el ends here
