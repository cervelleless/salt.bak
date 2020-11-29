;;; early-init.el --- I exist before everything!! -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2020 cervelleless
;;
;; Author: cervelle <http://github.com/cervelleless>
;; Maintainer: cervelle <cervelleless@vivaldi.net>
;; Created: November 17, 2020
;; Modified: November 17, 2020
;; Keywords:
;; Package-Requires: ((emacs 27.1) (cl-lib "0.5"))
;;
;;; License: GPLv3
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  I exist before everything!!
;;
;; Emacs HEAD (27+) introduces early-init.el, which is run before init.el,
;; before the package system and GUI is initialized.
;;
;;; Code:

;; In Emacs 27+, package initialization occurs before `user-init-file' is
;; loaded, but after `early-init-file'. We must prevent Emacs from doing
;; it early!
(setq package-enable-at-startup nil)

;; garbage collection
;; The default is 800 kilobytes.  Measured in bytes.
(defvar last-file-name-handler-alist file-name-handler-alist)
(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.75
      file-name-handler-alist nil)

;; ... your whole emacs config here ...

;; after startup, it is important you reset this to some reasonable default. A large
;; gc-cons-threshold will cause freezing and stuttering during long-term
;; interactive use. I find these are nice defaults:
(add-hook! 'emacs-startup-hook
  (setq gc-cons-threshold 16777216
        gc-cons-percentage 0.1
        file-name-handler-alist last-file-name-handler-alist))

;;; early-init.el ends here
