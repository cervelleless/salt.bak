;;; sulfur.el --- Vi emulator -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2020 cervelleless
;;
;; Author: cervelleless <http://github.com/cervelleless>
;; Maintainer: cervelleless <cervelleless@gmail.com>
;; Created: November 27, 2020
;; Modified: November 27, 2020
;; Version: 0.0.1
;; Keywords:
;; Homepage: https://github.com/felix/sulfur
;; Package-Requires: ((emacs 27.1) (cl-lib "0.5"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Vi emulator. It's rudimentary, but enough.
;;
;;; Code:


;;  alternative methold the keymap


;;(setq mymap (make-sparse-keymap))
;;(define-key mymap (kbd "f f") 'counsel-find-file)
;;(defun sulfur-cmd ()
;;  (interactive)
;;  (set-transient-map mymap (lambda ()
;;                          	(not (equal (this-command-keys) (kbd "C-g"))))))

;;(global-set-key (kbd "<f12>") 'sulfur-cmd)




(require 'crux)
(require 'hydra)
;; (require 'bind-key)
;; sulfur, salt and mercury.
(defhydra sulfur (:pre (progn (set-cursor-color "#40e0d0")
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
  ("cw" kill-word :color blue )
  ("dd" (lambda () (interactive)
          (crux-kill-whole-line)
          (delete-char 1)))
  ("dw" kill-word)
  ("e" nil)
  ("ff" avy-goto-char-timer)
  ("fj" avy-next)
  ("fk" avy-prev)
  ("gg" beginning-of-buffer)
  ("h" (lambda () (interactive)
         (if (bolp)
             (message "Beginning of line")
           (backward-char))))
  ("i" (message "-- INSERT --") :color blue)
  ("j" next-line)
  ("k" previous-line)
  ("l" (lambda () (interactive)
         (forward-char)
         (if (eolp)
             (progn (message "End of line")
                    (backward-char 1)))))
  ("m" nil)
  ("n" nil)
  ("o" (lambda () (interactive)
         (crux-smart-open-line nil)) :color blue)
  ("p" yank)
  ("q" nil)
  ("r" (lambda () (interactive)
         (insert (read-char))
         (delete-char 1)
         (backward-char)))
  ("sw" swiper)
  ("sr" anzu-query-replace)
  ("ss" avy-goto-char-2) 
  ("t" nil)
  ("uu" undo-tree-undo)
  ("uv" undo-tree-visualize :color blue)
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
  ("I" crux-move-beginning-of-line :color blue)
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
  ("$" (lambda () (interactive) (progn (move-end-of-line nil) (backward-char))))
  ("M-x" counsel-M-x :color blue)
  ;; ("<right>" sulfur/lambda-l)
  ("<escape>" keyboard-escape-quit)
  ("SPC" mercury/body :color blue))

(define-key global-map [escape] (lambda ()
                                  (interactive)
                                  (if (minibufferp)
                                      (keyboard-escape-quit)
                                    (unless (bolp)
                                      (backward-char))
                                    (sulfur/body))))

(add-hook 'after-init-hook 'sulfur/body)
(add-hook 'minibuffer-setup-hook 'sulfur/nil)
(add-hook 'minibuffer-exit-hook 'sulfur/body)
(add-hook 'eshell-mode-hook 'sulfur/nil)
(add-hook 'undo-tree-visualizer-mode 'sulfur/nil)
(advice-add 'undo-tree-visualizer-quit :after 'sulfur/body)
(provide 'sulfur)
;;; sulfur.el ends here
