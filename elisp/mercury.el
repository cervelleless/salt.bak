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
(defhydra mercury (:color blue :columns 5)
  "Launch!"
  ("b" mercury-buffers/body "+buffers")
  ("f" mercury-files/body "+files")
  ("h" mercury-help/body "+help & info")
  ("p" mercury-project/body "+projects")
  ("s" mercury-search/body "+search")
  ("t" mercury-toggles/body "+toggles")
  ("q" nil "cancel")
  ("SPC" counsel-M-x "counsel-M-x")
  ("<escape>" enter-sulfur-cmd-mode "Exit"))

;; Help & Info
(defhydra mercury-help (:color blue :columns 5)
  "Help & Info"
  ("f" helpful-callable "Describe function")
  ("F" helpful-function "Describe function")
  ("c" helpful-command "Describe interactive functions")
  ("k" helpful-key "Describe key")
  ("m" describe-mode "Describe mode")
  ("v" helpful-variable "Describe variable")
  ("<escape>" enter-sulfur-cmd-mode "Exit"))

;; Help & Info
(defhydra mercury-search (:color blue :columns 5)
  "Search"
  ("a" anzu-query-replace "Anzu Query-Replace")
  ("b" swiper "Search in current buffer")
  ("p" counsel-projectile-rg "Search the current project with rg")
  ("<escape>" enter-sulfur-cmd-mode "Exit"))

;; buffers
(defhydra mercury-buffers (:color blue :columns 5)
  "Buffers & Bookmarks"
  ("b" ibuffer "ibuffer")
  ("c" counsel-bookmark "counsel-bookmark")
  ("n" next-buffer "Next buffer")
  ("p" previous-buffer "Previous buffer")
  ("s" basic-save-buffer "Save buffer")
  ("<escape>" enter-sulfur-cmd-mode "Exit")
  )

;; file
(defhydra mercury-files (:color blue :columns 5)
  "File Toolset"
  ("f" counsel-find-file "Find file")
  ("d" deer "deer")
  ("q" mercury/body "Previous page")
  ("r" counsel-recentf "Recent file")
  ("s" save-buffer "Save file")
  ("<escape>" (enter-sulfur-cmd-mode) "Exit"))

;; toggles
(defhydra mercury-toggles (:color blue :columns 5)
  "Mercury toggles"
  ("l" toggle-truncate-lines "Truncating of long line")
  ("s" eshell "Eshell")
  ("<escape>" enter-sulfur-cmd-mode "Exit"))

;;  projectile
(defhydra mercury-project (:color blue :columns 5)
  "Project"
  ("a" projectile-add-known-project "Add new project")
  ("b" counsel-projectile-switch-to-buffer "Switch to project buffer")
  ("c" project-compile "Compile in project")
  ("d" projectile-remove-known-project "Remove known project")
  ("f" counsel-projectile-find-file "Find file in project")
  ("i" projectile-invalidate-cache "Invalidate project cache")
  ("p" counsel-projectile-switch-project "Switch project")
  ("<escape>" enter-sulfur-cmd-mode "Exit"))


(provide 'mercury)
;;; mercury.el ends here
