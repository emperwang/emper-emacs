
;; -*- coding: utf-8 -*-
(setq emacs-load-start-time (current-time))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

;; line number
;(global-linum-mode 1) ; always show line numbers
;(setq linum-format "%d| ")  ;set format

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-w32-system-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)

(progn
  ;; load elpa package system
  ;; require emacs 24
  (require 'package)
  ;; Add MELPA repository.
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

  (when (< emacs-major-version 27) (package-initialize))
  ;;
  )

(require 'lsp-mode)
(require 'go-mode)							    
									    
(add-hook 'go-mode-hook 'lsp-deferred)					    
(add-hook 'go-mode-hook 'subword-mode)					    
;(add-hook 'before-save-hook 'gofmt-before-save)			    
;(add-hook 'go-mode-hook (lambda ()					    
;			  (setq tab-width 4)				    
;			  (flycheck-add-next-checker 'lsp 'go-vet)	    
;			  (flycheck-add-next-checker 'lsp 'go-staticcheck)))







































































































































(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init.el ends here

