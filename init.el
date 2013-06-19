

(setq auto-mode-alist
      (cons '("\\.m$" . objc-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.mm$" . objc-mode) auto-mode-alist))


(defun bh-choose-header-mode ()
  (interactive)
  (if (string-equal (substring (buffer-file-name) -2) ".h")
      (progn
        ;; OK, we got a .h file, if a .m file exists we'll assume it's
					; an objective c file. Otherwise, we'll look for a .cpp file.
        (let ((dot-m-file (concat (substring (buffer-file-name) 0 -1) "m"))
	      (dot-mm-file (concat (substring (buffer-file-name) 0 -1) "mm"))
              (dot-cpp-file (concat (substring (buffer-file-name) 0 -1) "cpp")))
          (if (or (file-exists-p dot-m-file) (file-exists-p dot-mm-file))
              (progn
                (objc-mode)
                )
            (if (file-exists-p dot-cpp-file)
                (c++-mode)
              )
            )
          )
        )
    )
  )

(add-hook 'find-file-hook 'bh-choose-header-mode)

;; ----- eugene edit begins


(defconst home-dir
    (getenv "HOME")
      "The full path of the user's home directory.")

(defconst tbh-hostname
    (car (split-string system-name "\\." t))
      "The hostname for the current system.")

;; Set up load path to include all user-local directories that may contain
;; configuration or library files.
(defconst emacs_home
    (expand-file-name ".emacs.d" home-dir)
      "Top level directory for local configuration and code.")

;; (setq emacs_home `"/usr/share/emacs23/")
(add-to-list 'load-path (expand-file-name "site-lisp" emacs_home))


;; (add-to-list 'load-path (expand-file-name "site-lisp/jdee/lisp" emacs_home))
;; (add-to-list 'load-path (expand-file-name "site-lisp/cedet/common" emacs_home))
;; (load-file (expand-file-name "site-lisp/cedet/common/cedet.el" emacs_home))
;; (add-to-list 'load-path (expand-file-name "site-lisp/elib" emacs_home))
;; (semantic-load-enable-code-helpers)

;; (require 'jde)				;http://jdee.sourceforge.net


(show-paren-mode 1)


;; (require 'redo)

;; ido
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t) ;; enable fuzzy matching
;; (iswitchb-mode 1)
;; (setq iswitchb-case t)


;; wordwrap when vertically seperated buffer
(setq truncate-partial-width-windows nil)

;; eugene : fix stop string-match when first match found
;; you have to fix the sourcepair.el to use member-regex instead of member
;; (defun member-regex (extension list)
;;   (let (value)
;;     (dolist (elt list value)
;;       (if (string-match elt extension)
;; 	  (setq value t)))))


;; (load-file (expand-file-name "site-lisp/sourcepair.el" emacs_home))
;; (add-to-list 'sourcepair-source-extensions ".inl")
;; (add-to-list 'sourcepair-source-extensions ".cpp")
;; (add-to-list 'sourcepair-source-extensions ".cpp<.*>")
;; (add-to-list 'sourcepair-source-extensions ".cpp:.*")


;; (add-to-list 'sourcepair-source-extensions ".mm")
;; (add-to-list 'sourcepair-source-extensions ".mm<.*>")
;; (add-to-list 'sourcepair-source-extensions ".mm:.*")
;; (add-to-list 'sourcepair-source-extensions ".m")
;; (add-to-list 'sourcepair-source-extensions ".m<.*>")

;; (add-to-list 'sourcepair-header-extensions ".h")
;; (add-to-list 'sourcepair-header-extensions ".h<.*>")
;; (add-to-list 'sourcepair-header-extensions ".h:.*")

;; (define-key global-map "\C-xz" 'sourcepair-load)

;; (setq sourcepair-source-path    '( "." "../*" ))
;; (setq sourcepair-header-path    '( "." "include" "../include" "../*"))
;; (setq sourcepair-recurse-ignore '( "CVS" "Obj" "Debug" ".svn" "Release" "boost_1_43_0" "boost"))

;; ediff default split 
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-merge-split-window-function 'split-window-horizontally)

;; for smarter dynamic expansion
(setq dabbrev-case-fold-search nil)
(setq dabbrev-case-replace nil)
(global-subword-mode 1)

(global-set-key (kbd "M-n") 'next-error)
(global-set-key (kbd "M-p") 'previous-error)
(setq compilation-scroll-output t)

;; c++

;; automodealist

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.inl\\'" . c++-mode))


(add-hook 'c-mode-common-hook
	  (lambda ()
	    (c-set-style "gnu")
	    (setq tab-width 4)
	    (setq indent-tabs-mode t)
	    (setq c-basic-offset 4)
	    (setq c-subword-mode t)
	    (c-set-offset 'innamespace 0)	;do not indent { inside a namespace 
	    (c-set-offset 'substatement-open 0)
	    (c-set-offset 'brace-list-open 0)
	    (c-set-offset 'case-label '+)
	    (c-set-offset 'arglist-cont-nonempty '+)
	    (c-set-offset 'arglist-intro '+)
	    (c-set-offset 'topmost-intro-cont '+)
	    (c-set-offset 'string '+)
	    (c-set-offset 'statement-case-open 0)
	    (c-toggle-hungry-state 1)
	    (c-toggle-electric-state 1)
	    ;; 		(gtags-mode 1)
					;		(define-key c++-mode-map (kbd "<C-return>") 'semantic-complete-analyze-inline)
	    (local-set-key  (kbd "C-x z") 'ff-find-other-file)

	    ))


;; mysql

(setq auto-mode-alist 
      (append 
       (list 
	;; insert entries for other modes here if needed. 
	(cons "\\.sq$" 'sql-mode)) 
       auto-mode-alist))
(add-hook 'sql-mode-hook 'font-lock-mode) 

;; save minibuffer history
(require 'savehist)
(savehist-mode 1)

;; (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(setenv "PATH" (concat "/usr/local/mysql/bin:" (getenv "PATH")))
(setq exec-path (cons "/usr/local/mysql/bin" exec-path))
(setq exec-path (cons "/usr/local/bin" exec-path))

(setq initial-frame-alist '((top . 1) (left . 1) (width . 300) (height . 200)))


;; midnight mode
(require 'midnight)
(midnight-delay-set 'midnight-delay "7:00am")

;;(setq mac-command-key-is-meta t)
;; (custom-set-variables
;;   ;; custom-set-variables was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(ns-command-modifier (quote meta)))
;; (custom-set-faces
;;   ;; custom-set-faces was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  )


(setq mac-option-key-is-meta t)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)
;; cmake
(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
		("\\.cmake\\'" . cmake-mode))
	      auto-mode-alist))


(require 'find-file)
;; ;; use ff-find-other-file instead
(push ".m" (cadr (assoc "\\.h\\'" cc-other-file-alist)))
(push ".mm" (cadr (assoc "\\.h\\'" cc-other-file-alist)))
(push ".cpp" (cadr (assoc "\\.h\\'" cc-other-file-alist)))
(push '("\\.m\\'" (".h")) cc-other-file-alist)
(push '("\\.mm\\'" (".h")) cc-other-file-alist)
(push '("\\.cpp\\'" (".h")) cc-other-file-alist)

;; cscope
(require 'xcscope)
(defun cscope-select-entry-this-window ()
  (interactive)
  (let ((file (get-text-property (point) `cscope-file))
	(line-number (get-text-property (point) `cscope-line-number)) 
	window)
    (setq window (cscope-show-entry-internal file line-number t (selected-window)))
    (if (windowp window)
	(progn 
	  (select-window window)
	  ))
    ))

(define-key cscope-list-entry-keymap (kbd "m") `cscope-select-entry-this-window)
(add-hook 'objc-mode-hook (function cscope:hook))
(add-hook 'java-mode-hook (function cscope:hook))

(require 'uniquify) 
(setq 
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":")

;; multiple gud in one emacs instance
;; (load-library "multi-gud.el")
;; (load-library "multi-gdb-ui.el")

(require 'psvn)

;; allow dired to be able to delete or copy a whole dir.
;; ‚ÄÏèølways‚Äù means no asking.
;; ‚ÄÏêîop‚Äù means ask once (top = top dir).
;; any other symbol means ask each and every time for a dir and subdir.
(setq dired-recursive-copies (quote always))
(setq dired-recursive-deletes (quote top))

;; The bigger problem is that the header-search algorithm doesn‚ÄÏÖ≥ understand frameworks. So, <sys/types> properly finds /usr/include/sys/types, but <Foundation/Foundation.h> fails. To fix that:

(defadvice ff-get-file-name (around ff-get-file-name-framework
				        (search-dirs
					      fname-stub
					           &optional suffix-list))
    "Search for Mac framework headers as well as POSIX headers."
       (or
	    (if (string-match "\\(.*?\\)/\\(.*\\)" fname-stub)
		(let* ((framework (match-string 1 fname-stub))
		              (header (match-string 2 fname-stub))
			             (fname-stub (concat framework ".framework/Headers/" header)))
		    ad-do-it))
	          ad-do-it))
(ad-enable-advice 'ff-get-file-name 'around 'ff-get-file-name-framework)
(ad-activate 'ff-get-file-name)
;; Unfortunately, there are some libraries that effectively reimplement parts of find-file.el instead of using it, which means you may need to patch more functions if you use those libraries.

;; Of course you‚ÄÏÖ™l also want to add the framework paths to cc-search-directories. I used to have code to extract the gcc defaults for both include directories and framework directories at startup, but that turns out to be not much better than using the built-in defaults, because it doesn‚ÄÏÖ≥ take into account the local values for the project(s) I work on. So now I just hard-code it in my .emacs, and then have project-specific files to eval as needed.

(setq cc-search-directories '("." "../include" "/usr/include" "/usr/local/include/*"
			            "/System/Library/Frameworks" "/Library/Frameworks"))


;; So, any .h file that defines an @interface is objc-mode instead of c-mode. (You could extend this to distinguish C++ from C by looking for class or template definitions, but I haven‚ÄÏÖ≥ bothered.)
(add-to-list 'magic-mode-alist
	     `(,(lambda ()
		  (and (string= (file-name-extension buffer-file-name) "h")
		       (re-search-forward "@\\<interface\\>"
					  magic-mode-regexp-match-limit t)))
	       . objc-mode))

(require 'php-mode)

(defvar sqlite-program  "/usr/bin/sqlite3"
    "Full path name of the SQLITE executable.")

;; nxhtml
;; (load-file (expand-file-name "site-lisp/nxhtml/autostart.el" emacs_home))
;; (autoload 'django-html-mumamo-mode (expand-file-name "site-lisp/nxhtml/autostart.el" emacs_home))
;; (autoload 'django-html-mumamo-mode "~/.emacs.d/site-lisp/nxhtml/autostart.el")
(load (expand-file-name "site-lisp/nxhtml/autostart.el" emacs_home))
(setq auto-mode-alist
            (append '(("\\.html?$" . django-html-mumamo-mode)) auto-mode-alist))
(setq mumamo-background-colors nil)
(add-to-list 'auto-mode-alist '("\\.html$" . django-html-mumamo-mode))

;; Mumamo is making emacs 23.3 freak out:
(when (and (equal emacs-major-version 24)
	   (equal emacs-minor-version 1))
  (eval-after-load "bytecomp"
    '(add-to-list 'byte-compile-not-obsolete-vars
		  'font-lock-beginning-of-syntax-function))
  (eval-after-load "bytecomp"
    '(add-to-list 'byte-compile-not-obsolete-vars
		  'font-lock-syntactic-keywords))
  ;; tramp-compat.el clobbers this variable!
  (eval-after-load "tramp-compat"
    '(add-to-list 'byte-compile-not-obsolete-vars
		  'font-lock-beginning-of-syntax-function)))


;; (add-to-list 'load-path (expand-file-name "site-lisp/org/lisp" emacs_home))
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; for shift-tab in terminal emacs
(add-hook 'term-setup-hook
	            (lambda () (define-key input-decode-map "\e[Z" [backtab])))
(define-key function-key-map [S-tab] [backtab])

;; http://kldp.org/node/110942
(prefer-coding-system 'utf-8)

(setq-default tab-width 4)

;; It's annoying to have your .emacs file modified by Emacs' "custom" library, especially if you check in your .emacs to a source code control system such as Subversion (which you should do) and synchronize it on multiple machines. Keep those customizations in a separate file:
(setq custom-file "~/.emacs-custom.el")
(load custom-file 'noerror)

(require 'undo-tree)
(global-undo-tree-mode)

;; xcodebuild compile
;; (cd ~/Documents/WonderKids/IphoneClient && xcodebuild -workspace IphoneClient.xcworkspace -scheme IphoneClient -sdk iphonesimulator4.3)
;; (cd ~/Documents/WonderKids/IphoneClient && xcodebuild -project IphoneClient.xcodeproj -target IphoneClient -configuration Debug -sdk iphonesimulator4.3)

;; xcodebuild no developer directory found at /developer
;; sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer

;; emacs starter kit
;; git clone http://github.com/eschulte/emacs24-starter-kit.git


(setq-default save-place t)
(require 'saveplace)
;; (require 'desktop)
;; (desktop-save-mode 1)

(add-hook 'c-mode-common-hook   'hs-minor-mode)

;; (require 'android-mode)
;; (setq android-mode-sdk-dir "/DevLibs/android-sdk-macosx/")

;; (add-hook 'gud-mode-hook
;; 	  (lambda ()
;; 	    (add-to-list 'gud-jdb-classpath " ")))


;; (setq default-frame-alist '(
;;                 (width . 88)
;;                 (height . 49) ))

(add-to-list 'load-path (expand-file-name "site-lisp/magit" emacs_home))
(require 'magit)

;; Debugger entered--Lisp error: (error "c-where-wrt-brace-construct: c-beginning-of-decl-1 returned label")
;;   signal(error ("c-where-wrt-brace-construct: c-beginning-of-decl-1 returned label"))
;;   error("c-where-wrt-brace-construct: c-beginning-of-decl-1 returned %s" label)
;;   c-where-wrt-brace-construct()
;;   c-beginning-of-defun(1)
;;   call-interactively(c-beginning-of-defun nil nil)
(make-variable-buffer-local 'beginning-of-defun-function)
(make-variable-buffer-local 'end-of-defun-function)


;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/ensime/elisp"))
;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/scala-mode"))
;; (when (and (require 'scala-mode-auto nil 'noerror) (require 'ensime nil 'noerror))
;;     (add-to-list 'auto-mode-alist '("\\.scala.html$" . scala-mode))
;;     (add-hook 'scala-mode-hook 'ensime-scala-mode-hook))


;; yasnippet
(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/yasnippet"))
(require 'yasnippet)
(yas-global-mode 1)

;; https://github.com/gabrielelanaro/emacs-for-python
;; (load-file "~/.emacs.d/site-lisp/emacs-for-python/epy-init.el")
;; (require 'epy-setup)      ;; It will setup other loads, it is required!
;; (require 'epy-python)     ;; If you want the python facilities [optional]
;; (require 'epy-completion) ;; If you want the autocompletion settings [optional]
;; (require 'epy-editing)    ;; For configurations related to editing [optional]
;; (require 'epy-bindings)   ;; For my suggested keybindings [optional]
;; (require 'epy-nose)       ;; For nose integration

(setq skeleton-pair nil) 
;; (require 'highlight-indentation)
;; (add-hook 'python-mode-hook 'highlight-indentation)


;; django mode
;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/django-mode"))
;; (require 'django-html-mode)
;; (require 'django-mode)
;; (yas/load-directory "~/.emacs.d/site-lisp/django-mode/snippets")
;; (add-to-list 'auto-mode-alist '("\\.djhtml$" . django-html-mode))


;; git push git@github.com:pcompassion/emacs-config.git

;; case insensitivity search .. m-x toggle-case-fold-search

(global-set-key (kbd "C-o") 'newline-and-indent)
(global-set-key (kbd "M-/") 'dabbrev-expand)
(global-set-key (kbd "M-c") 'capitalize-word)
(global-set-key "\C-x," 'tags-loop-continue)


(global-set-key (kbd "C-c C-c") 'comment-region)
(global-set-key (kbd "C-M-;") 'comment-region)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "C-.") 'redo)
(global-set-key (kbd "M-.") 'undo)
(global-set-key (kbd "M-,") 'redo)
(global-set-key (kbd "C-m") 'newline-and-indent)
(global-set-key (kbd "C-c r") 'revert-buffer)


;; Use ediff and not diff
(require 'ediff)
(defun ediff-current-buffer-revision ()
  "Run Ediff to diff current buffer's file against VC depot.
Uses `vc.el' or `rcs.el' depending on `ediff-version-control-package'."
  (interactive)
  (let ((file (or (buffer-file-name)
				  (error "Current buffer is not visiting a file"))))
	(if (and (buffer-modified-p)
			 (y-or-n-p (message "Buffer %s is modified. Save buffer? "
								(buffer-name))))
		(save-buffer (current-buffer)))
	(ediff-load-version-control)
	(funcall
	 (intern (format "ediff-%S-internal" ediff-version-control-package))
	 "" "" nil))) 


(setq diff-command "ediff")


;; http://web-mode.org
;; (require 'web-mode)
;; (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; autocomplete mode
(add-to-list 'load-path  (expand-file-name "site-lisp/auto-complete" emacs_home))
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/autocomplete/ac-dict")
(ac-config-default)


(defun my-html-mode-hook ()
    "Switch to `django-html-mumamo-mode' if Django template was opened."
	  (save-excursion
		    (if (or (search-forward "{%")
					            (search-forward "{{"))
				        (django-html-mumamo-mode))))

(add-hook 'nxhtml-mumamo-mode-hook 'my-html-mode-hook)

(add-to-list 'load-path (expand-file-name "site-lisp/js2-mode" emacs_home))
(require 'js2-mode)
;; (autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(add-to-list 'load-path (expand-file-name "site-lisp/pony-mode/src" emacs_home))
;; (require 'pony-mode)


;; pymacs
;; http://www.yilmazhuseyin.com/blog/dev/emacs-setup-python-development/
;; http://pymacs.progiciels-bpi.ca/pymacs.html#installation
(add-to-list 'load-path (expand-file-name "site-lisp/pymacs" emacs_home))
(require 'pymacs)
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
;; (eval-after-load "pymacs"
;;  '(add-to-list 'pymacs-load-path (expand-file-name "site-lisp/Pymacs" emacs_home)))


;; (pymacs-load "ropemacs" "rope-")

;; http://stackoverflow.com/questions/2855378/ropemacs-usage-tutorial
;; (setq ropemacs-enable-autoimport t)

(require 'auto-complete)
(global-auto-complete-mode t)

(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
	(let* ((temp-file (flymake-init-create-temp-buffer-copy
					   'flymake-create-temp-inplace))
		   (local-file (file-relative-name
						temp-file
						(file-name-directory buffer-file-name))))
	  (list "pyflakes" (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
			   '("\\.py\\'" flymake-pyflakes-init)))
(add-hook 'python-mode-hook 'flymake-mode)
;; do not use flymake for html file
(delete '("\\.html?\\'" flymake-xml-init) flymake-allowed-file-name-masks)


;; Flymake marks the errors with red. But it does not prints the error on screen. So I found a script that writes the errors on the current line to mini-buffer. Here is the script that I added to my .emacs file
(defun my-flymake-show-help ()
    (when (get-char-property (point) 'flymake-overlay)
	     (let ((help (get-char-property (point) 'help-echo)))
		       (if help (message "%s" help)))))

(add-hook 'post-command-hook 'my-flymake-show-help)


;; Add autocomplete rope integration
;; If you have auto-complete in your emacs setup, you can actually integrate auto-complete with rope. To do this, I found this page. From there I downloaded script for rope-autocomplete integration. Here is the script that I added to my .emacs file.
;; (ac-ropemacs-initialize)
;; (add-hook 'python-mode-hook
;; 		  (lambda ()
;; 			(add-to-list 'ac-sources 'ac-source-ropemacs)))



(add-to-list 'grep-find-ignored-directories "migrations")



(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
    (with-current-buffer
		      (url-retrieve-synchronously
			          "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
	      (let (el-get-master-branch)
			      (goto-char (point-max))
				        (eval-print-last-sexp))))

(el-get 'sync)

(add-hook 'python-mode-hook 'jedi:setup)


(setq find-grep-options "-q -i")

;; http://stackoverflow.com/questions/2855378/ropemacs-usage-tutorial


;; help doc
;; The mark ring. You should never have to scroll around randomly in a buffer to find "that place you were just looking at". Whenever you take a diversion (e.g. by searching, or pressing M-< or M->), Emacs uses the mark to save your previous position, kind of like sticking your finger behind one page of a book while you go to glance at another page. You can return to the mark with C-x C-x. However, Emacs saves up to 16 previous values of the mark, and you can jump to previous ones with C-u C-SPC. This makes mark and the mark ring a valuable navigation tool. You can use it somewhat mindlessly: if you ever find yourself asking "where was I just now?" you can often just press C-u C-SPC until you find yourself back in the right place.

;; (You can also set the mark explicitly yourself with C-SPC, but I almost never need to do that for navigation purposes, only for marking regions.)


;; M-x find-name-dired


;; http://www.emacswiki.org/emacs/InteractivelyDoThings
;; ido
;; To restrict the list after a first filtering:
;; type some characters appearing in the buffer/file name(say .cpp)
;; type C-SPC (C-@)

;; M-s to search for a file matching your input


;; find function defs
;; M-x occur
;; ^def 


