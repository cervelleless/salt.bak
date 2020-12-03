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

;;; early-init.el ends here
