;;; salt-pkgs.el --- packages -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2020 cervelleless
;;
;; Author: cervelleless <http://github/felix>
;; Maintainer: cervelleless <cervelleless@gmail.com>
;; Created: December 02, 2020
;; Modified: December 02, 2020
;; Version: 0.0.1
;; Keywords:
;; Homepage: https://github.com/felix/salt-pkgs
;; Package-Requires: ((emacs 27.1) (cl-lib "0.5"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  packages
;;
;;; Code:

(eval-when-compile
  (require 'use-package))
(require 'quelpa-use-package)

;; (require 'bind-key)

;; core packages

;; auto-compile
(use-package auto-compile
  :defer t
  :config
  (auto-compile-on-save-mode)
  (auto-compile-on-load-mode))

;; dash
(use-package dash
  :defer t)

(use-package diminish
  :defer t)

(use-package rainbow-mode
  :quelpa (rainbow-mode :fetcher github :repo "emacsmirror/rainbow-mode")
  :defer t)

;; emojify
;; (use-package emojify
;;  :ensure t
;;  :commands emojify-mode)

;; eshell
(use-package eshell
  :defer t
  :commands (eshell/pushd eshell/pwd)
  :init
  (setq eshell-directory-name (concat user-emacs-directory ".local/eshell/")))

(use-package eshell-z
  :defer t
  :hook ((eshell-mode . (lambda () (require 'eshell-z)))
         (eshell-z-change-dir .  (lambda () (eshell/pushd (eshell/pwd))))))

(use-package esh-help
  :defer t
  :config
  (setup-esh-help-eldoc))

;; ace-window
(use-package ace-window
  :defer t
  :commands ace-window
  :config
  (define-key global-map (kbd "M-o") 'ace-window))

;; expand-region
(use-package expand-region
  :defer t)

;; rainbow-delimiters
(use-package rainbow-delimiters
  :defer t
  :hook (emacs-lisp-mode . rainbow-delimiters-mode))

;; lispy

(use-package lispy
  :defer t
  :init
  (setq show-paren-delay 0
        show-paren-style 'parenthesis)
  :hook
  (emacs-lisp-mode . lispy-mode)
  (racket-mode-hook . lispy-mode)
  (lispy-mode-hook . show-paren-mode))

;; undo tree
(use-package undo-tree
  :quelpa (undo-tree :fetcher github :repo "emacsmirror/undo-tree")
  :defer t
  :commands (undo-tree-undo global-undo-tree-mode)
  :config
  (global-undo-tree-mode)
  (setq undo-tree-visualizer-timestamps t
        undo-tree-visualizer-diff t))

;; recentf
(use-package recentf
  :defer t
  :commands recentf-mode
  :config
  (setq recentf-max-saved-items 200
        recentf-max-menu-items 15)
  (recentf-mode))

;; magit
(use-package magit
 :defer t)

;; yaml
(use-package yaml-mode
  :defer t)

;; markdown
(use-package markdown-mode
  :defer t)

;; web
(use-package web
  :defer t)

;; js2-mode
(use-package js2-mode
  :defer t)

;; crux
(use-package crux
  :defer t
  :commands crux-beginning-of-line)

;; ;; super save
(use-package super-save
   :defer t)


;; eazy-kill
(use-package easy-kill
   :defer t)

;; smartparens
(use-package smartparens
   :defer t)


;; ;; ob-racket
;; (use-package racket-mode
;;   :defer t
;;   :commands (racket-mode racket-xp-mode))

; (use-package ob-racket
;;   :defer t
;;   :load-path "elisp/emacs-ob-racket"
;;   :config
;;   )


;; ;;
(use-package anzu
  :defer t)
;;
(use-package ranger
  :defer t)

;; wgrep
(use-package wgrep
  :defer t)

;; benchmark
(use-package benchmark-init
  :defer t
  :config
  ;; To disable collection of benchmark data after init is done.
  (add-hook 'after-init-hook 'benchmark-init/deactivate))

;; flyspell
(use-package flyspell
  :defer t
  :hook (emacs-lisp-mode . flyspell-prog-mode))



(provide 'salt-pkgs)
;;; salt-pkgs.el ends here
