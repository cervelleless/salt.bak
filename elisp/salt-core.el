;;; salt-core.el --- The base matter of salt. -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2020 cervelleless
;;
;; Author: cervelleless <http://github.io/cervelleless>
;; Maintainer: cervelleless <cervelleless@gmail.com>
;; Created: November 27, 2020
;; Modified: November 27, 2020
;; Version: 0.0.1
;; Keywords:
;; Homepage:
;; Package-Requires: ((emacs 27.1) (cl-lib "0.5"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  The base matter of salt
;;
;;; Code:

;; custom variables
(setq custom-file (concat user-emacs-directory "private/custom.el"))

;; disable vc
(setq vc-handled-backends nil)

;;
(setq default-directory (concat (getenv "HOME") "/"))

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold (* 100 1000 1000))

;; y and n
(fset 'yes-or-no-p 'y-or-n-p)

;;
(setq load-prefer-newer t)

;;
;; (setq backup-directory-alist '(("." . (concat user-emacs-directory ".cache/saves/"))))
;;
(setq auto-save-list-file-prefix (concat user-emacs-directory ".cache/autosave/"))

;; inhibit startup screen
(setq inhibit-startup-screen t)

;; delete menu-bar
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; ESC cancel all
;; (global-set-key (kbd "C-<escape>") 'keyboard-escape-quit)

;; Set up the visible bell
(setq visible-bell t)

;;; font and frame size
;; frame size
(setq initial-frame-alist
      '((top . 1) (left . 10) (width . 280) (height . 150)))

;; font
(add-to-list 'default-frame-alist
             '(font . "M+ 1mn Light-18"))



;; setup by myself
(defun salt/reload-emacs-configuration ()
  (interactive)
  (load-file (expand-file-name "init.el" user-emacs-directory)))

(provide 'salt-core)
;;; salt-core.el ends here
