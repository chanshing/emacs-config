(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives
			   '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

(load "~/.emacs.d/misc_settings") 
(load "~/.emacs.d/init_keybinding") 
(load "~/.emacs.d/init_evil")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode 1)
 '(evil-overriding-maps (quote ((color-theme-mode-map) (comint-mode-map) (compilation-mode-map) (grep-mode-map) (dictionary-mode-map) (ert-results-mode-map . motion) (Info-mode-map . motion) (speedbar-key-map) (speedbar-file-key-map) (speedbar-buffers-key-map) (Buffer-menu-mode-map))))
 '(global-hl-line-mode t)
 '(global-linum-mode nil)
 '(ido-enable-flex-matching t)
 '(ido-ignore-buffers (quote ("\\` ")))
 '(ido-ignore-files (quote ("\\`CVS/" "\\`#" "\\`.#" "\\`\\.\\./" "\\`\\./" "\\`.+\\.mod" "\\`.+\\.out")))
 '(inhibit-startup-screen t)
 '(safe-local-variable-values (quote ((flycheck-gcc-language-standard . "gnu99"))))
 '(standard-indent 2)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(scroll-bar-mode nil)
 '(x-select-enabled-clipboard t))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(cursor ((t (:background "dark cyan")))))
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(global-visual-line-mode t)
;; (when (executable-find "ipython")
;;   (setq python-shell-interpreter "ipython"))
;; (put 'dired-find-alternate-file 'disabled nil)

;; Maximize window
(add-to-list 'default-frame-alist '(fullscreen . maximized))
