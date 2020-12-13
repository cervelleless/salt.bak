;;; salt-org.el --- org-mode -*- lexical-binding: t; -*-
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
;;  org-mode
;;
;;; Code:

;; org
(use-package org
  :defer t
  :mode ("\\.org\\'" . org-mode)
  :init
  (setq org-directory "~/Repository/org/"
        org-todo-keywords '((sequence "TODO(t)" "IN-PROGRESS(p!)" "|" "DONE(d!)" "CANCEL(c@)"))
        org-log-state-notes-into-drawer t
        org-capture-templates '(
                                ("t" "Todo" entry (file+headline "/Users/felix/Repository/org/capture/gtd.org" "Tasks")
                                 "* TODO %?\n  %i\n  %a")
                                ("j" "Journal" entry (file+datetree "/Users/felix/Repository/org/capture/journal.org" "Journal")
                                 "* %?\nEntered on %U\n  %i\n  %a")
                                ("n" "Notes" entry (file+datetree "/Users/felix/Repository/org/capture/notes.org" "Notes")
                                 "* %?\nEntered on %U\n  %i\n  %a")
                                ("m" "Mottos" entry (file+datetree "/Users/felix/Repository/org/capture/mottos.org" "Mottos")
                                 "* %?\nEntered on %U\n  %i\n  %a"))
        org-src-window-setup 'split-window-right))

(use-package worf
  :defer t
  :hook
  (org-mode . worf-mode))


(provide 'salt-org)
;;; salt-org.el ends here
