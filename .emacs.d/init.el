(when window-system
  (cond((featurep 'carbon-emacs-package)

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; For Carbon Emacs

					;言語を日本語にするよ
	(set-language-environment'Japanese)

					;極力UTF-8とする
					;(prefer-coding-system'utf-8)

	;;改行コードを表示
	(setq eol-mnemonic-dos "(CRLF)")
	(setq eol-mnemonic-mac "(CR)")
	(setq eol-mnemonic-unix "(LF)")

	;;1行ずつスクロール
	(setq scroll-conservatively 35
	      scroll-margin 0
	      scroll-step 1)
	(setq comint-scroll-show-maximum-output t) ;;for shell mode

	;;マウスホイールでスクロール
	(defun scroll-down-with-lines()
	  ""
	  (interactive)
	  (scroll-down 1)
	  )
	(defun scroll-up-with-lines()
	  ""
	  (interactive)
	  (scroll-up 1)
	  )

	;;yatex
	(setq auto-mode-alist
	      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
	(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
	(setq tex-command "platex")
	(setq tex-command "~/Library/TexShop/bin/platex2pdf-euc"
	      dvi2-command "open -a TeXShop")
	(setq load-path (cons (expand-file-name "/Applications/Emacs.app/Contents/Resources/site-lisp/yatex") load-path))
	(setq tex-command "platex --kanji=euc --fmt=platex-euc")
	(setq tex-command "~/Library/TexShop/bin/platex2pdf-utf8")

	(setq load-path (cons "/Application/Emacs.app/Resources/site-lisp" load-path))
					;auto new line
	(add-hook ' yatex-mode-hook'(lambda () (setq auto-fill-function nil)))
					;install-elisp
	(require 'install-elisp)
	(setq install-elisp-repository-directory "/Applications/Emacs.app/Contents/Resources/site-lisp")

	;;php-completion
	(add-hook 'php-mode-hook
		  (lambda ()
		    (require 'php-completion)
		    (php-completion-mode t)
		    (define-key php-mode-map (kbd "C-o") 'phpcmp-complete)
		    (when (require 'auto-complete nil t)
		      (make-variable-buffer-local 'ac-sources)
		      (add-to-list 'ac-sources 'ac-source-php-completion)
		      (auto-complete-mode t))))

					;css-mode
	(autoload 'css-mode "css-mode")
	(setq auto-mode-alist
	      (cons '("\\.css\\'" . css-mode) auto-mode-alist))
	(setq cssm-indent-function #'cssm-c-style-indenter)

					;mmm-mode
	(require 'mmm-auto)
	(setq mmm-global-mode 'maybe)
	(set-face-background 'mmm-default-submode-face nil) ;背景色が不要な場合
	(mmm-add-classes
	 '((embedded-css
	    :submode css-mode
	    :front "<style[^>]*>"
	    :back "</style>")))
	(mmm-add-mode-ext-class nil "\\.html\\'" 'embedded-css)

					;2012/5/29 window 最大化
	(set-frame-position (selected-frame) 0 0)
	(set-frame-size (selected-frame) 189 46)


	;; Carbon Emacsの設定で入れられた. メニューを隠したり．
	(custom-set-variables
	 '(display-time-mode t)
	 '(tool-bar-mode nil)
	 '(transient-mark-mode t))
	(custom-set-faces
	 )


	;;Color
	(if window-system (progn
			    (set-background-color "Black")
			    (set-foreground-color "LightGray")
			    (set-cursor-color "Gray")
			    (set-frame-parameter nil 'alpha 80)
			    ))

	;;ansi-term 色変更
	(setq term-default-bg-color nil)
	(setq term-default-fg-color nil)

	;; backspace C-h 2012/5/29
	(global-set-key "\C-h" 'delete-backward-char)

	;; auto-complete mode 2012/11/2
	(require 'auto-complete)

	;;ビープ音消す 2012/11/12
	(setq visible-bell t)

	;;auto-install.el 2012/11/21
	(require 'auto-install)
	(setq auto-install-directory "~/.emacs.d/auto-install/")
	(auto-install-update-emacswiki-package-name t)
	(auto-install-compatibility-setup)             ; 互換性確保
	(setq load-path(append(list(expand-file-name "~/.emacs.d/auto-install/"))load-path))

	;; anything 2012/11/21
	(require 'anything-startup)
	(define-key global-map (kbd "C-l") 'anything)
	(setq anything-sources
	      '(anything-c-source-buffers+
		anything-c-source-recentf
		anything-c-source-man-pages
		anything-c-source-emacs-commands
		anything-c-source-emacs-functions
		anything-c-source-files-in-current-dir
		))
	;; recentf-ext 2013/01/25
	(require 'recentf-ext)

	;; kakko 2012/12/9
	(show-paren-mode t)

	;; ansi-term Japanese 2012/12/12
	(setq locale-coding-system 'utf-8)

	;; utf-8 2013/02/9
	(set-terminal-coding-system 'utf-8)
	(set-keyboard-coding-system 'utf-8)
	(set-buffer-file-coding-system 'utf-8)
	(setq default-buffer-file-coding-system 'utf-8)
	)
       ((featurep 'ns)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; For Cocoa Emacs

	;;load-path
	;;(setq load-path
	;;    (append'("/Applications/MacPorts/Emacs.app/Contents/Resources/site-lisp")
	;;     load-path))

	;;auto-install
	(require 'auto-install)
	(setq auto-install-directory "/Applications/MacPorts/Emacs.app/Contents/Resources/site-lisp")
	(auto-install-update-emacswiki-package-name t)
	(auto-install-compatibility-setup)             ; 互換性確保

	;;言語を日本語にするよ
	(set-language-environment'Japanese)

	;;改行コードを表示
	(setq eol-mnemonic-dos "(CRLF)")
	(setq eol-mnemonic-mac "(CR)")
	(setq eol-mnemonic-unix "(LF)")

	;;Color
	(if window-system (progn
			    (set-background-color "Black")
			    (set-foreground-color "LightGray")
			    (set-cursor-color "Gray")
			    (set-frame-parameter nil 'alpha 80)
			    ))

	;;ansi-term 色変更
	(setq term-default-bg-color nil)
	(setq term-default-fg-color nil)

	;; Carbon Emacsの設定で入れられた. メニューを隠したり．
	(custom-set-variables
	 '(display-time-mode t)
	 '(tool-bar-mode nil)
	 '(transient-mark-mode t))
	(custom-set-faces
	 )


	;; backspace C-h 2012/5/29
	(global-set-key "\C-h" 'delete-backward-char)

	;;ビープ音消す 2012/11/12
	(setq visible-bell t)

	;; kakko 2012/12/9
	(show-paren-mode t)

	;; ansi-term Japanese 2012/12/12
	(setq locale-coding-system 'utf-8)

	;; utf-8 2013/02/9
	(set-terminal-coding-system 'utf-8)
	(set-keyboard-coding-system 'utf-8)
	(set-buffer-file-coding-system 'utf-8)
	(setq default-buffer-file-coding-system 'utf-8)

	;; anything 2012/11/21
	(require 'anything-startup)
	(define-key global-map (kbd "C-l") 'anything)
	(setq anything-sources
	      '(anything-c-source-buffers+
		anything-c-source-recentf
		anything-c-source-man-pages
		anything-c-source-emacs-commands
		anything-c-source-emacs-functions
		anything-c-source-files-in-current-dir
		))

	;;yatex
	(setq auto-mode-alist
	      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
	(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
	(setq tex-command "platex")
	(setq tex-command "~/Library/TexShop/bin/platex2pdf-euc"
	      dvi2-command "open -a TeXShop")
	(setq load-path (cons (expand-file-name "/Applications/MacPorts/Emacs.app/Contents/Resources/site-lisp/yatex") load-path))
	(setq tex-command "platex --kanji=euc --fmt=platex-euc")
	(setq tex-command "~/Library/TexShop/bin/platex2pdf-utf8")
	(add-hook ' yatex-mode-hook'(lambda () (setq auto-fill-function nil)))　;勝手に改行しない

	;;font
	(create-fontset-from-ascii-font "Menlo-14:weight=normal:slant=normal" nil "menlokakugo")
	(set-fontset-font "fontset-menlokakugo"
			  'unicode
			  (font-spec :family "Hiragino Kaku Gothic ProN" :size 16)
			  nil
			  'append)
	(add-to-list 'default-frame-alist '(font . "fontset-menlokakugo"))

	;; オートコンプリートモードON
					;(require 'auto-complete)
	(require 'auto-complete-config)
	(global-auto-complete-mode t)




	))
  )
