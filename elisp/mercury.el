;;; mercury.el --- leader man -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2020 cervelleless
;;
;; Author: cervelleless <http://github.com/cervelleless>
;; Maintainer: cervelleless <cervelleless@gmail.com>
;; Created: December 02, 2020
;; Modified: December 02, 2020
;; Version: 0.0.1
;; Keywords:
;; Homepage: https://github.com/felix/mercury
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
(defhydra mercury (:color blue :columns 5 :post sulfur/body :foreign-keys warn)
  "Launch!"
  ("SPC" counsel-M-x "counsel-M-x")
  ("b" mercury-buffers/body "+buffers" :exit t)
  ("f" mercury-files/body "+files" :exit t)
  ("h" mercury-helps/body "+help" :exit t)
  ;; ("s" eshell "eshell")
  ("q" nil "cancel")
  ("p" mercury-project/body "+projects" :exit t)
  ("<escape>" sulfur/body "Exit" :exit t))

;; Help
(defhydra mercury-helps (:color blue :cloumns 5 :foreign-keys warn :post sulfur/body)
  "Help and Info"
  ("f" describe-function "Describe function")
  ("k" describe-key "Describe key")
  ("v" describe-variable "Describe variable")
  ("m" describe-mode "Describe mode")
("<escape>" sulfur/body "Exit" :exit t))


; buffers
(defhydra mercury-buffers (:color blue :columns 5 :foreign-keys warn :post sulfur/body)
  "Buffer Toolset"
  ("b" ibuffer "ibuffer")
  ("p" previous-buffer "Previous buffer")
  ("n" next-buffer "Next buffer")
  ("s" basic-save-buffer "Save buffer")
  ("<escape>" sulfur/body "Exit" :exit t))

;; files
(defhydra mercury-files (:color blue :columns 5 :foreign-keys warn :post sulfur/body)
  "File Toolset"
  ("f" counsel-find-file "Find file" :exit t)
  ("q" mercury/body "Previous page" :exit t)
  ("r" counsel-recentf "Recent file")
  ("s" save-buffer "Save file")
  ("<escape>" sulfur/body "Exit" :exit t))

;;  projectile
(defhydra mercury-project (:color blue :columns 5 :foreign-keys warn :post sulfur/body)
  "Project"
  ("p" counsel-projectile-switch-project "Switch project" :exit t)
  ("f" counsel-projectile-find-file "Find file in project" :eit t)
  ("a" projectile-add-known-project "Add new project")
  ("b" counsel-projectile-switch-to-buffer "Switch to project buffer" :exit t)
  ("c" project-compile "Compile in project")
  ("i" projectile-invalidate-cache "Invalidate project cache")
  ("<escape>") sulfur/body "Exit" :exit t)


(provide 'mercury)
;;; mercury.el ends here
