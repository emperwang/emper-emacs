;;http://www.linuxidc.com/Linux/2012-10/72341p2.htm
;;小技巧：当你编辑~/.emacs配置文件的时候，每一次要看到效果都必须重新启动
;;emacs，非常麻烦。你可以用emacs打开.emacs文件并加入你想要的lisp代码后，
;;使用C-x C-s保存，接着在minibuffer输入：M-x eval-buffer，它会立即生效。
;;你可以试验一下，非常方便和简单。

;; .emacs

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8) 

;; Don't display menu bar. Type M-x menu-bar-mode to display it
(menu-bar-mode '-1)
;; Don't display tool bar. Type M-x tool-bar-mode to display it
(if (not (equal (getenv "HOSTTYPE") "sparc"))
    (tool-bar-mode '-1))

;;设置滚动栏在窗口右侧，默认是在左侧
(customize-set-variable 'scroll-bar-mode' left)

; line number
(setq display-line-numbers-mode t) 
(setq linum-format "%3d  ")
;;关闭出错时的提示声
(setq visible-bell t)

;;关闭emacs启动时的画面
(setq inhibit-startup-message nil)

;;关闭gnus启动时的画面
(setq gnus-inhibit-startup-message nil)

;;允许屏幕左移
(put 'scroll-left 'disabled nil) 

;;允许屏幕右移
(put 'scroll-right 'disabled nil) 

;; use space replace tab
;; (setq-default indent-tabs-mode nil)

;;括号匹配时可以高亮显示另外一边的括号，但光标不会烦人的跳到另一个括号处。
(setq show-paren-style 'parenthesis)

;;让 Emacs 可以直接打开和显示图片。
;(setq auto-image-file-mode t)

;; 不自动保存模式
(setq auto-save-mode nil)

;;允许emacs和外部其他程序的粘贴
(setq x-select-enable-clipboard t)

;; 自动的在文件末增加一新行
;(setq require-final-newline t)

;; 当光标在行尾上下移动的时候，始终保持在行尾。
;(setq track-eol t)


;; 回车缩进
;;(global-set-key "\C-m" 'newline-and-indent)
;;(global-set-key (kbd "C-<return>") 'newline)


(defun linux-c-mode ()
	"C mode with adjusted defaults for use with the Linux kernel."
	(interactive)
	(c-mode)
	(c-set-style "K&R")
	(setq tab-width 8)
	(setq indent-tabs-mode t)
	(setq c-basic-offset 8)
)

(defun	my-c-mode ()
	"C mode with adjusted defaults for use with the C sources."
	(interactive)
	(c-mode)
	(c-set-style "K&R")
	(setq tab-width 8)
	(setq indent-tabs-mode t)
	(setq c-basic-offset 8)
)

(defun	my-c++-mode ()
	"C++ mode with adjusted defaults for use with the C++ sources."
	(interactive)
	(c++-mode)
	(c-set-style "K&R")
	(setq tab-width 4)
	;;(setq indent-tabs-mode t)
	(setq c-basic-offset 4)
)

(defun	my-asm-mode ()
	"ASM mode with adjusted defaults for use with the asm sources."
	(interactive)
	(asm-mode)
	(setq tab-width 8)
	(setq indent-tabs-mode t)
	(setq c-basic-offset 8)
)

(setq auto-mode-alist (cons '(".*\\.\\(inl$\\|cxx$\\|hxx$\\|cpp$\\|hpp$\\)" .
			my-c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '(".*\\.\\(inc$\\|[Ss]$\\)" .
			my-asm-mode) auto-mode-alist))
(setq auto-mode-alist (cons '(".*\\.\\(inl$\\|c$\\|h$\\)" .
			my-c-mode) auto-mode-alist))
(setq auto-mode-alist (cons '(".*/*linux.*/+.*\\.[ch]$" .
			linux-c-mode) auto-mode-alist))


;; Add color to a shell running in emacs ‘M-x shell’
;;(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
;;(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;Then set the colors:

;;(custom-set-faces
;; custom-set-faces was added by Custom — don’t edit or cut/paste it!
;; Your init file should contain only one such instance.
;;'(comint-highlight-prompt ((t (:foreground "white")))))



(add-to-list 'load-path "~/.emacs.d/emacs-color-theme-solarized")
;;(require 'color-theme)
;;(color-theme-initialize)
;;(color-theme-oswald)



;;(require 'ansi-color)
;;(ansi-color-for-comint-mode-on)
;;(shell)


;;(setq ansi-color-names-vector ; better contrast colors
;;      ["black" "red4" "green4" "yellow4"
;;       "blue3" "magenta4" "cyan4" "white"])
;;(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)


;;(setq eshell-ask-to-save-history 'always)
(setq eshell-save-history-on-exit t)


;;(setq witch-function-mode t)
;;(setq which-function-mode t)
(which-func-mode)



;;默认的Ctrl-z是什么来着，关闭emacs吧，好像还是强行关闭，不好，用C-x c就好了 
;;我就将Ctrl-z作为我的键的绑定 
(define-prefix-command 'ctl-z-map) 
(global-set-key (kbd "C-z") 'ctl-z-map) 


;; Set foreground and background. black or dimgrey may be choosed
(set-foreground-color "white")
;;(set-foreground-color "lightgreen")
;;(set-foreground-color "tan")
;;(set-foreground-color "Gray")

(set-background-color "Gray11")
;;(set-background-color "Gray22")
;;(set-background-color "Black")
;(set-background-color "CornflowerBlue")
;(set-background-color "DarkSlateBlue")
;(set-background-color "MidnightBlue")
;(set-background-color "Black")

;; Set the mouse and cursor color
;;(set-mouse-color "green")
(set-cursor-color "green")

(setq Man-overstrike-face 'info-node)
(setq Man-underline-face 'info-xref)


;;; Emacs has a built in shell, eshell.  With Alt-eshell you can create a buffer in which you can enter shell commands. The output of the commands is displayed in the same buffer

;;; The power of a shell within emacs is that you can combine shell input and output with ordinary text editing. You can more easily copy from other emacs buffers into the shell buffer than when you would have used a shell in a separate window. Similarly it is easier to copy from your emacs shell buffer to another emacs buffer than using clipboard copy and paste between a shell and a separate text editor.

;;; The default configuration of the emacs eshell has a small problem however. Full text editing the emacs eshell buffer is difficult because the up and down arrow keys are bound to repeating the previous and the next command. I would prefer to use the up and down keys for moving the cursor around in the buffer. Repeating the previous and the next command can be bound to CTRL-P and CTRL-N.

;;; To accomplish this I put the following lisp code in my .emacs file:


(defun m-eshell-hook ()

; define control p, control n and the up/down arrow

;  (define-key eshell-mode-map [(control p)] 'eshell-previous-matching-input-from-input)
;  (define-key eshell-mode-map [(control n)] 'eshell-next-matching-input-from-input)

  (define-key eshell-mode-map [up] 'previous-line)
  (define-key eshell-mode-map [down] 'next-line)
)

(add-hook 'eshell-mode-hook 'm-eshell-hook)


;;; C-a to beginning of command line or beginning of line?

;;; I use the following code. It makes C-a go to the beginning of the command line, unless it is already there, in which case it goes to the beginning of the line. So if you are at the end of the command line and want to go to the real beginning of line, hit C-a twice:

(defun eshell-maybe-bol ()
  (interactive)
  (let ((p (point)))
    (eshell-bol)
    (if (= p (point))
	(beginning-of-line))))

(add-hook 'eshell-mode-hook
	  '(lambda () (define-key eshell-mode-map "\C-a" 'eshell-maybe-bol)))




;;(shell)
;;(rename-buffer "make-shell")
;;(shell)
;;(rename-buffer "1111-shell")
;;(shell)
;;(rename-buffer "2222-shell")
;;(shell)
;;(rename-buffer "3333-shell")
;;(shell)
;;(rename-buffer "4444-shell")
;;(shell)
;;(rename-buffer "5555-shell")
;;
;;(shell)
;;(rename-buffer "adb-shell")
;;
;;(eshell)
;;(rename-buffer "boot-shell")
;;(eshell)
;;(rename-buffer "kernel-shell")
;;(eshell)
;;(rename-buffer "nfsroot-shell")
;;(eshell)
;;(rename-buffer "tftboot-shell")
;;(eshell)
;;(rename-buffer "svnshell")
;;(eshell)
;;(rename-buffer "work-shell")
;;
;;(eshell)
;;(rename-buffer "ffff-shell")
;;(eshell)
;;(rename-buffer "eeee-shell")
;;(eshell)
;;(rename-buffer "dddd-shell")
;;(eshell)
;;(rename-buffer "cccc-shell")
;;(eshell)
;;(rename-buffer "bbbb-shell")
;;(eshell)
;;(rename-buffer "aaaa-shell")
;;

(show-paren-mode)
(global-auto-revert-mode)

;;; uncomment this line to disable loading of "default.el" at startup
;;(setq inhibit-default-init t)

;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;; enable visual feedback on selections
(setq transient-mark-mode t)

(add-hook 'comint-output-filter-functions
	'comint-watch-for-password-prompt)

(setq display-time-24hr-format t)
(setq display-time-day-and-date nil)
(display-time)


(setq make-backup-files nil)

(setq ps-font-size 8)
(defun my-ps-print-buffer()
	(interactive)
	(message "  print ... ")
	(setq filename "~/tmp/1.ps")
	(ps-print-buffer-with-faces filename))

(global-set-key "\M-\C-p" 'my-ps-print-buffer)
(global-set-key "\C-g" 'goto-line)

(put 'scroll-left 'disabled nil)



;; 如果运行仍旧失败，并提示
;; Symbol's value as variable is void: stack-trace-on-error
;; 在你的emacs配置中加上(setq stack-trace-on-error t)
(setq stack-trace-on-error t)




; Load CEDET
;(load-file "~/.emacs.d/cedet/common/cedet.el")


(global-ede-mode t)
;(require 'semantic-ia)
;(require 'semantic-gcc)
;(global-srecode-minor-mode 1)


;;;; 使函数体能够折叠或展开

;; Enable source code folding

;(global-semantic-tag-folding-mode 1)



 
;; Key bindings

;(defun my-cedet-hook ()
;
;  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
;
;  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
;
;  (local-set-key "\C-cd" 'semantic-ia-fast-jump)
;
;  (local-set-key "\C-cr" 'semantic-symref-symbol)
;
;  (local-set-key "\C-cR" 'semantic-symref))
;
;(add-hook 'c-mode-common-hook 'my-cedet-hook)


;;;; 当输入"."或">"时，在另一个窗口中列出结构体或类的成员


;(defun my-c-mode-cedet-hook ()
;
;  (local-set-key "." 'semantic-complete-self-insert)
;
;  (local-set-key ">" 'semantic-complete-self-insert))
;
;(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)




;(add-to-list 'load-path "~/.emacs.d/ecb-2.40")
(add-to-list 'load-path "~/.emacs.d/ecb-snap")
(require 'ecb-autoloads)

;; 各窗口间切换

(global-set-key [M-left] 'windmove-left)

(global-set-key [M-right] 'windmove-right)

(global-set-key [M-up] 'windmove-up)

(global-set-key [M-down] 'windmove-down) 




;; enabel ecb-autoloads
;(ecb-minor-mode)
;(ecb-hide-ecb-windows '-1)

(add-to-list 'load-path "~/.emacs.d/popup")

(add-to-list 'load-path "~/.emacs.d/auto-complete")
(require 'auto-complete)
(global-auto-complete-mode t)
(setq ac-auto-start 3)
;;(define-key ac-complete-mode-map "\C-n" 'ac-next)
;;(define-key ac-complete-mode-map "\C-p" 'ac-previous)
;;(define-key ac-complete-mode-map "\t" 'ac-complete)
;;(define-key ac-complete-mode-map "\r" nil)
;;
(define-key ac-complete-mode-map "\t" 'ac-next)
;;(define-key ac-complete-mode-map "\C-p" 'ac-previous)
(define-key ac-complete-mode-map "\r" 'ac-complete)
;;(define-key ac-complete-mode-map "\r" nil)



(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )


;;;###autoload
(defun switch-source-file ()
  (interactive)
  (setq file-name (buffer-file-name))
  (if (string-match "\\.cpp" file-name)
      (find-file (replace-regexp-in-string "\\.cpp" "\.h" file-name)))
  (if (string-match "\\.h" file-name)
      (find-file (replace-regexp-in-string "\\.h" "\.cpp" file-name))))

(defun switch-source-buffer ()
  (interactive)
  (setq file-name (buffer-file-name))
  (if (string-match "\\.cpp" file-name)
      (switch-to-buffer (replace-regexp-in-string "\\.cpp" "\.h" (file-name-nondirectory file-name))))
  (if (string-match "\\.h" file-name)
      (switch-to-buffer (replace-regexp-in-string "\\.h" "\.cpp"  (file-name-nondirectory file-name)))))
(global-set-key [C-f11] 'switch-source-file)
(global-set-key [f11] 'switch-source-buffer)



(put 'downcase-region 'disabled nil)

(put 'upcase-region 'disabled nil)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(require 'google-c-style)
;(add-hook 'c-mode-common-hook 'google-set-c-style)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun cpplint ()
  "check source code format according to Google Style Guide"
  (interactive)
  (compilation-start (concat "python ~/bin/cpplint.py " (buffer-file-name))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(add-to-list 'load-path' "~/.emacs.d/xcscope")
(require 'xcscope)
(add-hook 'c-mode-common-hook '(lambda() (require 'xcscope)))
(setq cscope-do-not-update-database t)

(define-key global-map [(control f3)]  'cscope-set-initial-directory)
(define-key global-map [(control f4)]  'cscope-unset-initial-directory)
(define-key global-map [(control f5)]  'cscope-find-this-symbol)
(define-key global-map [(control f6)]  'cscope-find-global-definition)
(define-key global-map [(control f7)]  'cscope-find-global-definition-no-prompting)
(define-key global-map [(control f8)]  'cscope-pop-mark)
(define-key global-map [(control f9)]  'cscope-next-symbol)
(define-key global-map [(control f10)] 'cscope-next-file)
(define-key global-map [(control f11)] 'cscope-prev-symbol)
(define-key global-map [(control f12)] 'cscope-prev-file)
(define-key global-map [(meta f9)]     'cscope-display-buffer)
(define-key global-map [(meta f10)]    'cscope-display-buffer-toggle)


;;git-emacs
(add-to-list 'load-path "~/.emacs.d/git-emacs")
(require 'git-emacs)

(add-to-list 'load-path "~/.emacs.d/sessions")
(require 'sessions)
(add-hook 'after-init-hook  'session-initialize)
;(add-to-list 'load-path "~/.emacs.d/doxymacs/no-autoconf/")
;(require 'doxymacs)
(add-to-list 'load-path "~/.emacs.d/cedet/")
(require 'cedet)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;name uniquify   post-forward
;(setq uniquify-buffer-name-style t)

(setq x-select-enable-clipboard t)
(global-linum-mode t)

;;解决emacs shell乱码
;(setq ansi-color-for-comint-mode t)
;(setq ansi-color-names-vector ["black" "red" "green" "blue" "yellow" "magenta" "cyan" "white"])
;(setq verilog-auto-lineup (quote all))
;(customize-group 'ansi-colors)
;(kill-this-buffer);;关闭customize窗口



;;w3m
(add-to-list 'load-path "~/.emacs.d/w3m-lisp")
;; apt install w3m
(add-to-list 'exec-path "/usr/bin/w3m")
(require 'w3m-load)
(setq w3m-use-favicon nil)
(setq w3m-command-arguments '("-cookie" "-F"))
(setq w3m-use-cookies t)
(setq w3m-home-page "http://www.baidu.com")
(setq w3m-default-display-inline-image t) ;;display image
(setq w3m-default-toggle-inline-image t) 



