;;; init.el --- 
;;; Commentary:
;;;     My super customized Emacs init.el
;;; Code:

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives
			   '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

(load "~/.emacs.d/misc_settings") 
(load "~/.emacs.d/init_keybinding") 
(load "~/.emacs.d/init_evil")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:foreground "dark gray" :slant italic))))
 '(font-lock-doc-face ((t (:inherit font-lock-string-face :slant italic))))
 '(font-lock-function-name-face ((t (:foreground "blue" :weight bold))))
 '(font-lock-keyword-face ((t (:foreground "magenta4" :weight bold))))
 '(font-lock-string-face ((t (:foreground "orange red"))))
 '(font-lock-type-face ((t (:foreground "ForestGreen" :weight bold))))
 '(font-lock-variable-name-face ((t (:foreground "black")))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(column-number-mode 1)
 '(evil-overriding-maps
   (quote
	((color-theme-mode-map)
	 (comint-mode-map)
	 (compilation-mode-map)
	 (grep-mode-map)
	 (dictionary-mode-map)
	 (ert-results-mode-map . motion)
	 (Info-mode-map . motion)
	 (speedbar-key-map)
	 (speedbar-file-key-map)
	 (speedbar-buffers-key-map)
	 (Buffer-menu-mode-map))))
 '(global-hl-line-mode t)
 '(global-linum-mode nil)
 '(ido-enable-flex-matching t)
 '(ido-ignore-buffers (quote ("\\ ")))
 '(ido-ignore-files
   (quote
	("\\`CVS/" "\\`#" "\\`.#" "\\`\\.\\./" "\\`\\./" "\\`.+\\.mod" "\\`.+\\.out" "\\`.+\\.log" "\\`.+\\.pdf" "\\`.+\\.npy" "\\`.+\\.dvi")))
 '(inhibit-startup-screen t)
 '(safe-local-variable-values (quote ((flycheck-gcc-language-standard . "gnu99"))))
 '(scroll-bar-mode nil)
 '(standard-indent 2)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(x-select-enabled-clipboard t))

(setq mouse-wheel-progressive-speed nil)  ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't)  ;; scroll window under mouse
;; (global-visual-line-mode t)  ;; wrap at WORD boundary
(set-default 'truncate-lines t)  ;; truncate instead of wrap
;; (when (executable-find "ipython")
;;   (setq python-shell-interpreter "ipython"))
;; (put 'dired-find-alternate-file 'disabled nil)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; increase-decrease font size
(global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
(global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)

;; Doesn't work with evil. See (evil-cross-lines) in init_evil.el
;; (setq line-move-visual t)

(set-frame-font "Ubuntu Mono-12")  ;; set text font and size
(print (font-family-list))

;; Fill Column Indicator (vertical line at 80)
(add-hook 'emacs-lisp-mode-hook (lambda() (fci-mode t)))
(add-hook 'latex-mode-hook (lambda() (fci-mode t)))
(add-hook 'python-mode-hook (lambda() (fci-mode t)))
(setq fci-rule-column 80)

(provide 'init)
;;; init.el ends here
