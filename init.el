;;; init.el --- Here am I. -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2020 cervelle
;;
;; Author: cervelle <http://github.io/cervelleless>
;; Maintainer: cervelle <cervelleless@gmail.com>
;; Created: November 17, 2020
;; Modified: November 17, 2020
;; Version: 0.0.1
;; Keywords:
;; Homepage:
;; Package-Requires: ((emacs 27.1) (cl-lib "0.5"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Here am I.
;;
;;; Code:
;; 
;; Profile emacs startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "*** Emacs loaded in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))


(let (file-name-handler-alist)
  ;; Ensure Emacs is running out of this file's directory
  (setq user-emacs-directory (file-name-directory load-file-name)))

(add-to-list 'load-path (expand-file-name "elisp/" user-emacs-directory))

;;; write here first.
;; custom variables
(setq custom-file (concat user-emacs-directory "private/custom.el"))

;; disable vc
(setq vc-handled-backends nil)

;;
(setq default-directory (concat (getenv "HOME") "/"))

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold (* 100 1000 1000))

;; y and n
(fset 'yes-or-no-p 'y-or-n-p)

;;
(setq load-prefer-newer noninteractive)

;;
;; (setq backup-directory-alist '(("." . (concat user-emacs-directory ".cache/saves/"))))
;;
(setq auto-save-list-file-prefix (concat user-emacs-directory ".cache/autosave/"))

;; inhibit startup screen
(setq inhibit-startup-screen t)

;; delete menu-bar
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; ESC cancel all
;; (global-set-key (kbd "C-<escape>") 'keyboard-escape-quit)

;; Set up the visible bell
(setq visible-bell t)

;;; font and frame size
;; frame size
(setq initial-frame-alist
      '((top . 1) (left . 10) (width . 280) (height . 150)))

;; font
(add-to-list 'default-frame-alist
             '(font . "M+ 1mn Light-18"))


;; melpa
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ;;  Comment/uncomment this line to enable MELPA Stable if desired.
                         ;;  ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)


;;; core packages

;; theme
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t))

;; You must run (all-the-icons-install-fonts) one time after
;; installing this package!

(use-package minions
  :ensure t
  :hook (doom-modeline-mode . minions-mode)
  :custom
  (minions-mode-line-lighter ""))

(use-package doom-modeline
  :ensure t
  :after eshell     ;; Make sure it gets hooked after eshell
  :hook (after-init . doom-modeline-init)
  :custom-face
  (mode-line ((t (:height 1.0))))
  (mode-line-inactive ((t (:height 1.0))))
  :custom
  (doom-modeline-height 15)
  (doom-modeline-bar-width 6)
  (doom-modeline-lsp t)
  (doom-modeline-github nil)
  (doom-modeline-mu4e nil)
  (doom-modeline-irc nil)
  (doom-modeline-minor-modes t)
  (doom-modeline-persp-name nil)
  (doom-modeline-buffer-file-name-style 'truncate-except-project)
  (doom-modeline-major-mode-icon nil))

;; emojify
;; (use-package emojify
;;  :ensure t
;;  :commands emojify-mode)

;; eshell
(use-package eshell
  :ensure t
  :init
  (setq eshell-directory-name (concat user-emacs-directory ".local/eshell/")))

(use-package eshell-z
  :ensure t
  :hook ((eshell-mode . (lambda () (require 'eshell-z)))
         (eshell-z-change-dir .  (lambda () (eshell/pushd (eshell/pwd))))))

;; hydra
(use-package hydra
  :ensure t)

;; ivy counsel swiper
(use-package ivy
  :ensure t
  :init
  (setq ivy-use-virutal-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-height 15)
  :config
  (ivy-mode 1)
  (define-key ivy-minibuffer-map (kbd "ESC") 'minibuffer-keyboard-quit))

(use-package ivy-rich
  :ensure t
  :config
  (ivy-rich-mode 1))

(use-package swiper
  :ensure t
  :config
  (define-key swiper-map (kbd "ESC") 'minibuffer-keyboard-quit))

(use-package counsel
  :ensure t
  :init
  (bind-keys ("M-x" . counsel-M-x)
             ("C-x C-f" . counsel-find-file))
  :config
  (counsel-mode 1))

;; prescient
(use-package prescient
  :ensure t)

(use-package ivy-prescient
  :ensure t
  :after (prescient ivy)
  :config
  (ivy-prescient-mode 1)
  (prescient-persist-mode 1))

;; projectile
(use-package projectile
  :ensure t
  :after ivy
  :init
  (setq projectile-completion-system 'ivy))

(use-package counsel-projectile
  :ensure t
  :requires (projectile counsel))

;; company
(use-package company
  :ensure t
  :init
  (setq company-idle-delay 0.25)
  (setq company-show-numbers t)
  (setq company-tooltip-limit 10)
  (setq company-minimum-prefix-length 2)
  (setq company-tooltip-align-annotations t)
  ;; invert the navigation direction if the the completion popup-isearch-match
  ;; is displayed on top (happens near the bottom of windows)
  (setq company-tooltip-flip-when-above t)
  :config
  (add-hook 'after-init-hook 'global-company-mode))
;; yassnippet
(use-package yasnippet
  :ensure t
  :config
  (yas-reload-all)
  (add-hook 'prog-mode-hook #'yas-minor-mode))


;; expand-region
(use-package expand-region
  :ensure t)

;; org
(use-package org
  :ensure t)

;; rainbow-delimiters
(use-package rainbow-delimiters
  :ensure t)

;; lispy
(setq show-paren-delay 0)
(setq show-paren-style 'parenthesis)
(make-variable-buffer-local 'show-paren-mode)

(use-package lispy
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))
  (add-hook 'racket-mode-hook (lambda () (lispy-mode 1)))
  (add-hook 'lispy-mode-hook (lambda () (show-paren-mode 1))))

;; undo tree
(use-package undo-tree
  :ensure t
  :config
  (progn
    (global-undo-tree-mode)
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-visualizer-diff t)))

;; recentf
(use-package recentf
  :config
  (progn
    (setq recentf-max-saved-items 200
          recentf-max-menu-items 15)
    (recentf-mode)))

;; magit
(use-package magit
  :ensure t)

;; nlinum
(use-package nlinum
  :ensure t)
(use-package nlinum-relative
  :ensure t)

;; yaml
(use-package yaml-mode
  :ensure t)

;; markdown
(use-package markdown-mode
  :ensure t)

;; web
(use-package web
  :ensure t)

;; crux
(use-package crux
  :ensure t)

;; super save
(use-package super-save
  :ensure t)

;; avy
(use-package avy
  :ensure t)

;; eazy-kill
(use-package easy-kill
  :ensure t)

;; smartparens
(use-package smartparens
  :ensure t)


;; ob-racket
(use-package racket-mode
  :ensure t)

;; ace-window
(use-package ace-window
  :ensure t
  :bind ("M-o" . ace-window))

;;
(use-package anzu
  :ensure t)
;;
(use-package ranger
  :ensure t)

;; wgrep
(use-package wgrep
  :ensure t)

;; benchmark
(use-package benchmark-init
  :ensure t
  :config
  ;; To disable collection of benchmark data after init is done.
  (add-hook 'after-init-hook 'benchmark-init/deactivate))

;; flyspell
(use-package flyspell
  :ensure t)

;; setup by myself

(defhydra salt-launcher (:color blue :columns 5 :post salt-vi/body :foreign-keys warn)
  "Launch!"
  ("SPC" counsel-M-x "counsel-M-x")
  ("f" salt-files/body "+Files" :exit t)
  ("s" shell "shell")
  ("q" nil "cancel")
  ("<escape>" salt-vi/body "Exit" :exit t))

;; files
(defhydra salt-files (:color blue :columns 5 :foreign-keys warn :post salt-vi/body)
  "File toolset:"
  ("f" counsel-find-file "Find file")
  ("q" salt-launcher/body "Previous page" :exit t)
  ("r" counsel-recentf "Recent file")
  ("s" save-buffer "Save file")
  ("<escape>" salt-vi/body "Exit" :exit t))

(require 'crux)
(defhydra salt-vi (:pre (progn (set-cursor-color "#40e0d0")
                               (setq cursor-type 'box))
			:post (progn (setq cursor-type 'bar)
                                     (set-cursor-color "#ffffff"))
			:hint nil
			:color pink)
  "Salt vi emulator"
  ("a" (lambda () (interactive)
	 (progn (unless (eolp)
	    (forward-char))
	  (message "-- INSERT --"))) :color blue)
  ("b" backward-word)
  ("c" nil)
  ("dd" crux-kill-whole-line)
  ("dw" kill-word :color blue)
  ("e" nil)
  ("f" nil)
  ("gg" beginning-of-buffer)
  ("h" (lambda () (interactive)
	 (if (bolp)
	     (message "Beginning of line")
	   (backward-char))))
  ("i" (message "-- INSERT --") :color blue)
  ("j" next-line)
  ("k" previous-line)
  ("l" (lambda () (interactive)
	 (if (eolp)
	     (message "End of line")
	   (forward-char))))
  ("m" nil)
  ("n" nil)
  ("o" (lambda () (interactive)
	 (crux-smart-open-line nil)) :color blue)
  ("p" yank)
  ("q" nil)
  ("r" nil)
  ("s" swiper)
  ("t" nil)
  ("u" undo-tree-undo)
  ("v" nil)
  ("w" forward-word)
  ("x" delete-char)
  ("y" nil)
  ("z" nil)
  ("A" (lambda () (interactive)
	 (move-end-of-line)
	 (message "-- INSERT --")) :color blue)
  ("B" nil)
  ("C" nil)
  ("D" crux-smart-kill-line)
  ("E" nil)
  ("F" nil)
  ("G" end-of-buffer)
  ("H" nil)
  ("I" crux-beginning-of-line :color blue)
  ("J" crux-top-join-line)
  ("K" nil)
  ("L" nil)
  ("M" nil)
  ("N" nil)
  ("O" crux-smart-open-line-above :color blue)   
  ("P" nil)
  ("Q" nil)
  ("R" nil)
  ("S" nil)
  ("T" nil)
  ("U" nil)
  ("V" nil)
  ("W" nil)
  ("X" nil)
  ("Y" nil)
  ("Z" nil)
  ("0" beginning-of-line)
  ("!" shell-command)
  (":ww" save-buffer)
  ("-" er/expand-region)
  ("^" crux-move-beginning-of-line)
  ("$" move-end-of-line)
  ("M-x" counsel-M-x)
  ("<escape>" keyboard-escape-quit)
  ("SPC" salt-launcher/body :color blue))
  

(define-key global-map [escape] (lambda ()
                                  (interactive)
                                  (if (minibufferp)
                                      (keyboard-escape-quit)
                                    (unless (bolp)
                                      (backward-char))
                                    (salt-vi/body))))
;;; hooks
;; (add-hook 'emacs-startup-hook (lambda() (salt/normal-mode 1)))
;; (add-hook 'emacs-startup-hook (lambda() (salt-vi/body)))

(provide 'init)
;;; init.el ends here
