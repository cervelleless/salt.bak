;;; azuoth.el --- dashboard -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2020 cervelleless
;;
;; Author: cervelleless <http://github.com/cervelleless>
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
;;  Azoth dashboard.
;;
;;; Code:

;;; version
(defvar azoth-version "0.0.1"
  "Version.")

;;; Startup page
(defvar azoth-astrolabe-name "*astrolabe*"
  "Buffer name of Azoth.")

;;; azoth-mode keymap
(defvar azoth-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "h") nil)
    (define-key map (kbd "j") nil)
    (define-key map (kbd "k") nil)
    (define-key map (kbd "l") nil)
    ;; (define-key map (kbd "SPC") 'mercury/body)
    map)
  "The keymap for azoth-mode."
  )

;;; azoth major mode
(define-derived-mode azoth-mode special-mode
  (format "Azoth v%s" azoth-version)
  "Major mode for dashboard buffer"
  :syntax-table nil
  :abbrev-table nil)


;;; Azoth initialize
(defun azoth-astrolabe ()
  (with-current-buffer (get-buffer-create azoth-astrolabe-name)
    (progn (azoth-mode)
	   (current-buffer))))

;; (add-hook 'before-init-hook 'azoth-initialize)
(setq initial-buffer-choice 'azoth-astrolabe)

(provide 'azoth)
;;; azoth.el ends here.
