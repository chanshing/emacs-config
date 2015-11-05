;; C-w TO DELETE WORD IN MINIBUFFER
(define-key minibuffer-local-map (kbd "C-w") 'backward-kill-word)

;; C-% INSTEAD OF C-M-%
(define-key global-map (kbd "C-%") 'query-replace-regexp)

;; BUFFER SELECTION
(global-set-key (kbd "C-x C-b") 'bs-show)

;; BUFFER KILL
(global-set-key (kbd "C-c k") 'kill-buffer)

;; SWITCH TO PREVIOUS BUFFER
(defun switch-to-previous-buffer ()
      (interactive)
      (switch-to-buffer (other-buffer (current-buffer) 1)))
(global-set-key (kbd "C-c b") 'switch-to-previous-buffer)

;; NEWLINE AND INDENT
(define-key global-map (kbd "RET") 'newline-and-indent)
