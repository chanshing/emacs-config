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

;; (require 'flx-ido)
;; (ido-mode 1)
;; (ido-everywhere 1)
;; (flx-ido-mode 1)
;; (setq ido-enable-flex-matching t)
;; ;; disable ido faces to see flx highlights.
;; (setq ido-use-faces nil)

;; (require 'ido-ubiquitous)
;; (ido-ubiquitous-mode 1)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

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
 '(font-lock-variable-name-face ((t (:foreground "black"))))
 '(hl-line ((t (:background "white smoke"))))
 '(linum ((t (:inherit (shadow default) :foreground "gray"))))
 '(linum-highlight-face ((t (:inherit default :foreground "black")))))

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
 '(custom-enabled-themes (quote (leuven)))
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
 '(global-linum-mode t)
 '(ido-ignore-buffers (quote ("\\ ")))
 '(ido-ignore-files
   (quote
	("\\`CVS/" "\\`#" "\\`.#" "\\`\\.\\./" "\\`\\./" "\\`.+\\.mod" "\\`.+\\.out" "\\`.+\\.log" "\\`.+\\.pdf" "\\`.+\\.npy" "\\`.+\\.dvi" "\\`\\.")))
 '(inhibit-startup-screen t)
 '(safe-local-variable-values (quote ((flycheck-gcc-language-standard . "gnu99"))))
 '(scroll-bar-mode nil)
 '(standard-indent 2)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(x-select-enabled-clipboard t))

(blink-cursor-mode 0)  ;; blinking cursor off
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

;; Fill Column Indicator (vertical line at 80)
(add-hook 'emacs-lisp-mode-hook (lambda() (fci-mode t)))
(add-hook 'latex-mode-hook (lambda() (fci-mode t)))
(add-hook 'python-mode-hook (lambda() (fci-mode t)))
(setq fci-rule-column 80)

;; extension of linum to hl current line number
(require 'hlinum)
(hlinum-activate)

;; (require 'smooth-scroll)
;; (smooth-scroll-mode t)

;; scroll margin
(require 'smooth-scrolling)
(smooth-scrolling-mode 1)

(require 'sublimity)
(require 'sublimity-scroll)
;; (require 'sublimity-map)
;; (require 'sublimity-attractive)

(sublimity-mode 1)

(setq
   backup-by-copying t
   backup-directory-alist '(("." . "~/.emacs.d/backups/"))
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)

(setq auto-save-file-name-transforms `((".*" "~/.emacs.d/autosaves/" t)))

;; (setq tramp-backup-directory-alist backup-directory-alist)

;; (setq tramp-auto-save-directory "~/emacs/tramp-autosaves") 

(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)

(require 'latex-pretty-symbols)

(autoload 'latex-math-preview-expression "latex-math-preview" nil t)
(autoload 'latex-math-preview-insert-symbol "latex-math-preview" nil t)
(autoload 'latex-math-preview-save-image-file "latex-math-preview" nil t)
(autoload 'latex-math-preview-beamer-frame "latex-math-preview" nil t)

(setq octave-comment-char 37)

(provide 'init)
;;; init.el ends here
