;;; salt-counsel.el --- ivy counsel swiper and so on. -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2020 cervelleless
;;
;; Author: cervelleless <http://github/felix>
;; Maintainer: cervelleless <cervelleless@gmail.com>
;; Created: December 02, 2020
;; Modified: December 02, 2020
;; Version: 0.0.1
;; Keywords:
;; Homepage: https://github.com/felix/salt-counsel
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

;; ivy counsel swiper
(use-package ivy
  :defer t
  :init
  (setq ivy-use-virutal-buffers t
        enable-recursive-minibuffers t
        ivy-height 15)
  :config
  (define-key ivy-minibuffer-map (kbd "ESC") 'minibuffer-keyboard-quit)
  (ivy-mode 1))

(use-package ivy-rich
  :defer t
  :commands ivy-rich-mode
  :config
  (ivy-rich-mode 1))

(use-package swiper
  :defer t
  :config
  (define-key swiper-map (kbd "ESC") 'minibuffer-keyboard-quit))

(use-package counsel
  :defer t
  :init
  (define-key global-map (kbd "M-x") 'counsel-M-x)
  (define-key global-map (kbd "C-x C-f") 'counsel-find-file)
  :config
  (counsel-mode 1))

;; prescient
(use-package prescient
  :defer t
  :commands prescient-persist-mode
  :config
  (prescient-persist-mode 1))

(use-package ivy-prescient
  :defer t
  :after (:all prescient ivy)
  :config
  (ivy-prescient-mode 1))

;; projectile
(use-package projectile
  :defer t
  :after ivy
  :init
  (setq projectile-completion-system 'ivy))

(use-package counsel-projectile
  :defer t
  :requires (projectile counsel))

;; avy
(use-package avy
  :defer t)

(provide 'salt-counsel)
;;; salt-counsel.el ends here
