;;; mercury.el --- leader man -*- lexical-binding: t; -*-
;
;; Copyright (C) 2020 cervelleless
;;
;; Author: cervelleless <http://github.com/cervelleless>
;; Maintainer: cervelleless <cervelleless@gmail.com>
;; Created: December 02, 2020
;; Modified: December 02, 2020
;; Version: 0.0.1
;; Keywords:
;; Homepage: https://github.com/cervelleless/mercury
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

;; leader
(defhydra mercury (:color blue :columns 5 :post sulfur/body)
  "Launch!"
  ("b" mercury-buffers/body "+buffers")
  ("f" mercury-files/body "+files")
  ("h" mercury-helps/body "+help")
  ("p" mercury-project/body "+projects")
  ("t" mercury-toggle/body "+toggles")
  ("q" nil "cancel")
  ("SPC" counsel-M-x "counsel-M-x")
  ("<escape>" sulfur/body "Exit"))

;; Toggles
(defhydra mercury-toggle (:color amaranth :clounms 5 :post salfur/body)
  "Toggle command"
  ("l" toggle-truncate-lines "Truncating of long line")
  ("e" eshell :color blue))

;; Helpful
(defhydra mercury-helps (:color blue :cloumns 5 :post sulfur/body)
  "Helpful description"
  ("f" helpful-callable "Describe function")
  ("F" helpful-function "Describe function")
  ("c" helpful-command "Describe interactive functions")
  ("k" helpful-key "Describe key")
  ("m" describe-mode "Describe mode")
  ("v" help-variable "Describe variable")
  ("<escape>" sulfur/body "Exit" :exit t))

;; search
(defhydra mercury-search (:color blue :cloumns 5 :post sulfur/body)
  "Searching Toolkit"
  )
;; buffers
(defhydra mercury-buffers (:color amaranth :columns 5 :post sulfur/body)
  "Buffer Toolset"
  ("b" ibuffer "ibuffer")
  ("n" next-buffer "Next buffer")
  ("p" previous-buffer "Previous buffer")
  ("s" basic-save-buffer "Save buffer")
  ("<escape>" sulfur/body "Exit" :exit t))

;; files
(defhydra mercury-files (:color blue :columns 5 :foreign-keys run :post sulfur/body)
  "File Toolset"
  ("f" counsel-find-file "Find file" :exit t)
  ("d" deer "Launch dired in a minimal ranger window" :color blue)
  ("q" mercury/body "Previous page" :exit t)
  ("r" counsel-recentf "Recent file")
  ("s" save-buffer "Save file")
  ("<escape>" sulfur/body "Exit" :exit t))

;;  projectile
(defhydra mercury-project (:color amaranth :columns 5 :post sulfur/body)
  "Project"
  ("a" projectile-add-known-project "Add new project" :color blue)
  ("b" counsel-projectile-switch-to-buffer "Switch to project buffer" :color blue)
  ("c" project-compile "Compile in project")
  ("f" counsel-projectile-find-file "Find file in project" :color blue)
  ("i" projectile-invalidate-cache "Invalidate project cache")
  ("p" counsel-projectile-switch-project "Switch project" :exit t)
  ("<escape>" sulfur/body "Exit" :exit t))


(provide 'mercury)
;;; mercury.el ends here
