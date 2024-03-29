;;; salt-ivy.el --- ivy counsel swiper and so on. -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2020 cervelleless
;;
;; Author: cervelleless <http://github/felix>
;; Maintainer: cervelleless <cervelleless@gmail.com>
;; Created: December 02, 2020
;; Modified: December 02, 2020
;; Version: 0.0.1
;; Keywords:
;; Homepage: https://github.com/cervelleless/salt-counsel
;; Package-Requires: ((emacs 27.1) (cl-lib "0.5"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  ivy, counsel, swiper, projectile, hydra and so on.
;;
;;; Code:

(eval-when-compile
  (require 'use-package))
;; (require 'bind-key)

;; hydra
(use-package hydra
  :defer t)

;; wgrep
(use-package wgrep
  :defer t
  :config (setq wgrep-auto-save-buffer t))

;; avy
(use-package avy
  :defer t)

;; ivy counsel swiper
(use-package ivy
  :defer t
  :diminish
  :commands ivy-wgrep-change-to-wgrep-mode
  :init
  (setq ivy-use-virutal-buffers t
        enable-recursive-minibuffers t
        ivy-height 15)
  :hook (after-init . ivy-mode)
  :config
  (define-key ivy-minibuffer-map (kbd "ESC") 'minibuffer-keyboard-quit))


(use-package swiper
  :defer t
  :config
  (define-key swiper-map (kbd "ESC") 'minibuffer-keyboard-quit))

(use-package counsel
  :defer t
  :init
  (define-key global-map (kbd "M-x") 'counsel-M-x)
  (define-key global-map (kbd "C-x C-f") 'counsel-find-file))

;; prescient
;; after remove :after (:all perscient ivy) , it works.
(use-package ivy-prescient
  :defer t
  :after ivy
  :hook (ivy-mode . ivy-prescient-mode)
  :hook (ivy-prescient-mode . prescient-persist-mode))

;; projectile
(use-package projectile
  :defer t
  :config
  (setq projectile-completion-system 'ivy
        projectile-enable-caching t
	projectile-indexing-method 'hybrid
        projectile-ignored-projects '("~/" "/tmp")))

(use-package counsel-projectile
  :defer t
  :hook (ivy-mode . counsel-projectile-mode)
  :config (setq counsel-projectile-sort-files t))

(use-package all-the-icons
  :defer t)
;; You must run (all-the-icons-install-fonts) one time after
;; installing this package!

(use-package all-the-icons-ivy-rich
  :ensure t
  :hook (counsel-projectile-mode . all-the-icons-ivy-rich-mode))

(use-package ivy-rich
  :defer t
  :hook (all-the-icons-ivy-rich-mode . ivy-rich-mode)
  :config
  (setq ivy-rich-parse-remote-buffer nil))

;; anzy
(use-package anzu
  :defer t)

(provide 'salt-ivy)
;;; salt-ivy.el ends here
