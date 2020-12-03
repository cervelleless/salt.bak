;;; salt-leader.el --- leader man -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2020 cervelleless
;;
;; Author: cervelleless <http://github/felix>
;; Maintainer: cervelleless <cervelleless@gmail.com>
;; Created: December 02, 2020
;; Modified: December 02, 2020
;; Version: 0.0.1
;; Keywords:
;; Homepage: https://github.com/felix/salt-leader
;; Package-Requires: ((emacs 27.1) (cl-lib "0.5"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  leader man
;;
;;; Code:
(require 'hydra)

(defhydra salt-launcher (:color blue :columns 5 :post salt-vi/body :foreign-keys warn)
  "Launch!"
  ("SPC" counsel-M-x "counsel-M-x")
  ("b" salt-launcher-buffers/body "+buffers" :exit t)
  ("f" salt-launcher-files/body "+Files" :exit t)
  ("s" shell "shell")
  ("q" nil "cancel")
  ("<escape>" salt-vi/body "Exit" :exit t))

;; buffers
(defhydra salt-launcher-buffers (:color blue :columns 5 :foreign-keys warn :post salt-vi/body)
  "Buffer Toolset"
  ("b" ibuffer "ibuffer")
  )

;; files
(defhydra salt-launcher-files (:color blue :columns 5 :foreign-keys warn :post salt-vi/body)
  "File Toolset"
  ("f" counsel-find-file "Find file")
  ("q" salt-launcher/body "Previous page" :exit t)
  ("r" counsel-recentf "Recent file")
  ("s" save-buffer "Save file")
  ("<escape>" salt-vi/body "Exit" :exit t))

(provide 'salt-leader)
;;; salt-leader.el ends here
