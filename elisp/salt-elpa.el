;;; salt-elpa.el --- package manager with use-package -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2020 cervelleless
;;
;; Author: cervelleless <http://github/felix>
;; Maintainer: cervelleless <cervelleless@gmail.com>
;; Created: December 02, 2020
;; Modified: December 02, 2020
;; Version: 0.0.1
;; Keywords:
;; Homepage: https://github.com/felix/salt-corepkg
;; Package-Requires: ((emacs 27.1) (cl-lib "0.5"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  core pkgs
;;
;;; Code:

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))



(setq straight-use-package-by-default t)
(straight-use-package 'use-package)
(setq use-package-always-ensure t)
(use-package git) ;; ensure we can install from git sources

;; test straight.el
;; ;; melpa
;; ;; (require 'package)
;; (setq package-user-dir (concat user-emacs-directory "quelpa/"))
;; ;; (add-to-list 'load-path (concat package-user-dir "use-package-20201110.2133/"))
;; ;; (add-to-list 'load-path (concat package-user-dir "bind-key-20200805.1727/"))
;; (setq package-archives '(("melpa" . "https://melpa.org/packages/")
;; ;;                          ;;  Comment/uncomment this line to enable MELPA Stable if desired.
;; ;;                          ;;  ("melpa-stable" . "https://stable.melpa.org/packages/")
;;                           ("org" . "https://orgmode.org/elpa/")
;;                           ("elpa" . "https://elpa.gnu.org/packages/")))
;; ;; (package-initialize)

;; (eval-when-compile
;;   (require 'package)
;;   (package-initialize)
;;   (unless (package-installed-p 'use-package)
;;     (package-refresh-contents)
;;     (package-install 'use-package))
;;   (require 'use-package)
;;   (setq use-package-always-ensure t))

;; (eval-when-compile
;;   (require 'use-package))
;; (package-initialize)
;; (require 'bind-key)

;; (use-package quelpa
;;   :defer t
;;   :init (setq quelpa-update-melpa-p nil)
;;   :commands quelpa)

;; (use-package quelpa-use-package
;;   :defer t
;;   :init
;;   (setq use-package-ensure-function 'quelpa))

(provide 'salt-elpa)
;;; salt-elpa.el ends here
