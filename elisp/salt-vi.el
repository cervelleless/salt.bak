;;; salt-vi.el --- Vi emulator -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2020 cervelleless
;;
;; Author: cervelleless <http://github.com/cervelleless>
;; Maintainer: cervelleless <cervelleless@gmail.com>
;; Created: November 27, 2020
;; Modified: November 27, 2020
;; Version: 0.0.1
;; Keywords:
;; Homepage: https://github.com/felix/salt-vi
;; Package-Requires: ((emacs 27.1) (cl-lib "0.5"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Vi emulator. It's rudimentary, but enough.
;;
;;; Code:

(require 'crux)
(require 'hydra)
;; (require 'bind-key)

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
  ("r" (lambda () (interactive)
           (insert (read-char))
           (delete-char 1)))
  ("s" swiper)
  ("t" nil)
  ("u" undo-tree-undo)
  ("v" nil)
  ("w" forward-word)
  ("x" (delete-char 1))
  ("y" nil)
  ("z" nil)
  ("A" (lambda () (interactive)
         (move-end-of-line nil)
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

(add-hook 'minibuffer-exit-hook 'salt-vi/body)

(provide 'salt-vi)
;;; salt-vi.el ends here
