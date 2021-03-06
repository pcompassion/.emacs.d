;; tutorials
;; http://stackoverflow.com/a/1242760/433570
;; tutorials

(require 'package)
(add-to-list 'package-archives
			              '("melpa" . "http://melpa.milkbox.net/packages/") t)
(when (< emacs-major-version 24)
    (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)


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


;; --> ac-helm				
(require 'auto-complete)
(global-set-key (kbd "C-:") 'ac-complete-with-helm)
(define-key ac-complete-mode-map (kbd "C-:") 'ac-complete-with-helm)
;; <-- ac-helm

;; bash-completion
(bash-completion-setup)
;; bash-completion

;; elpy
(elpy-enable)
(elpy-use-ipython)
(elpy-clean-modeline) 			;If you find the (Python Elpy yas AC ElDoc Fill) mode line annoying, also add:
;; elpy

;; helm
(helm-mode 1)
;; helm

;; magit-find-file
(global-set-key (kbd "C-c p") 'magit-find-file-completing-read)
;; magit-find-file

;; redo+
(require 'redo+)
;; redo+


;; virtualenvwrapper
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support
;; (setq venv-location "~/virtualenvs/")
;; virtualenvwrapper

;; web-beautify
(eval-after-load 'js2-mode
  '(define-key js2-mode-map (kbd "C-c b") 'web-beautify-js))
(eval-after-load 'json-mode
  '(define-key json-mode-map (kbd "C-c b") 'web-beautify-js))
(eval-after-load 'sgml-mode
  '(define-key html-mode-map (kbd "C-c b") 'web-beautify-html))
(eval-after-load 'css-mode
  '(define-key css-mode-map (kbd "C-c b") 'web-beautify-css))
;; web-beautify

;; find-file-in-repository
(global-set-key (kbd "C-x f") 'find-file-in-repository)
;; find-file-in-repository

(show-paren-mode 1)


;; ido
(ido-mode t)
(setq ido-enable-flex-matching t) ;; enable fuzzy matching
;; ido

;; wordwrap when vertically seperated buffer
(setq truncate-partial-width-windows nil)
;; wordwrap when vertically seperated buffer


;; ediff default split 
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-merge-split-window-function 'split-window-horizontally)
;; ediff default split 



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

	    )
	  )

;; save minibuffer history
(savehist-mode 1)
;; save minibuffer history



(midnight-delay-set 'midnight-delay "7:00am")




;; Use ediff and not diff
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
;; Use ediff and not diff

;; auto-complete
(global-auto-complete-mode t)
;; auto-complete

;; jedi
(add-hook 'python-mode-hook 'jedi:setup)
;; jedi

;; helm
(global-set-key (kbd "C-c C-h") 'helm-resume)
;; helm
;; helm-ls-git
(global-set-key (kbd "C-x M-p") 'helm-ls-git-ls)
;; helm-ls-git

(autoload 'markdown-mode "markdown-mode"
     "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


;; web-mode
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;; web-mode


(add-to-list 'auto-mode-alist '("\\.less?\\'" . less-css-mode))


;; highlight-D4D47C
(set-face-background 'highlight-indentation-face "#D6D694")
(set-face-background 'highlight-indentation-current-column-face "#D6D694")
;; highlight-indentation


;; python-django
(global-set-key (kbd "C-x j") 'python-django-open-project)
;; python-django



;; for smarter dynamic expansion
(setq dabbrev-case-fold-search nil)
(setq dabbrev-case-replace nil)
(global-subword-mode 1)
;; for smarter dynamic expansion

;; uniquify
(require 'uniquify) 
(setq 
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":")
;; uniquify


;; flymake
;; http://stackoverflow.com/a/1393590/433570
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
	(let* ((temp-file (flymake-init-create-temp-buffer-copy
					   'flymake-create-temp-inplace))
		   (local-file (file-relative-name
						temp-file
						(file-name-directory buffer-file-name))))
	  (list "pycheckers"  (list local-file))))

  (add-to-list 'flymake-allowed-file-name-masks
			   '("\\.py\\'" flymake-pyflakes-init)))
;; flymake



;; http://lists.gnu.org/archive/html/bug-gnu-emacs/2009-09/msg00130.html
(setenv "PAGER" "/bin/cat")

(global-set-key (kbd "C-c g") 'helm-git-grep)
(define-key isearch-mode-map (kbd "C-c g") 'helm-git-grep-from-isearch)
(eval-after-load 'helm
  '(define-key helm-map (kbd "C-c g") 'helm-git-grep-from-helm))

(global-set-key (kbd "C-c k") 'helm-git-grep-at-point)
(global-set-key (kbd "C-c l") 'helm-git-grep-with-exclude-file-pattern)



(add-hook 'lisp-mode-hook '(lambda ()
							 (local-set-key (kbd "RET") 'newline-and-indent)))

;; put two spaces before comment
(defun my-comment-indent ()
  (interactive)
  (end-of-line)
  (let ((comment-column (+ 2 (current-column))))
	(comment-indent)))
;; put two spaces before comment

;; js3
;; js3

;; jedi
;; http://tkf.github.io/emacs-jedi/latest/
(add-hook 'python-mode-hook 'jedi:setup)
;; jedi

;; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
    (with-current-buffer
		      (url-retrieve-synchronously
			          "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
	      (let (el-get-master-branch)
			      (goto-char (point-max))
				        (eval-print-last-sexp))))

(el-get 'sync)
;; el-get

;; pymacs
;; http://www.yilmazhuseyin.com/blog/dev/emacs-setup-python-development/
;; http://pymacs.progiciels-bpi.ca/pymacs.html#installation
;; (require 'pymacs)


;; (autoload 'pymacs-apply "pymacs")
;; (autoload 'pymacs-call "pymacs")
;; (autoload 'pymacs-eval "pymacs" nil t)
;; (autoload 'pymacs-exec "pymacs" nil t)
;; (autoload 'pymacs-load "pymacs" nil t)
;; (eval-after-load "pymacs"
;;  '(add-to-list 'pymacs-load-path (expand-file-name "site-lisp" emacs_home)))
;; (pymacs-load "ropemacs" "rope-")

;; http://stackoverflow.com/a/6806217/433570
;; (eval-after-load "elpy"
;;   '(progn
;; 	 ;; Unbind M-o from the local keymap
;; 	 (define-key elpy-mode-map (kbd "M-n") nil)
;; 	 (define-key elpy-mode-map (kbd "M-p") nil)
	 
;; 	 ;; Add an alternative local binding for the command
;; 	 ;; bound to M-o
;; 	 ;; (define-key dired-mode-map (kbd "C-c o")
;; 	 ;;   (lookup-key dired-mode-map (kbd "M-o")))

;; 	 ))

;; (define-key ropemacs-local-keymap "\C-cg" nil)
;; (define-key ropemacs-local-keymap (kbd "M-/") nil)
;; ;; pymacs




;; http://kldp.org/node/110942
(prefer-coding-system 'utf-8)

(setq-default tab-width 4)


(global-set-key (kbd "C-o") 'newline-and-indent)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "M-c") 'capitalize-word)
(global-set-key (kbd "C-M-;") 'comment-region) ;doesn't work in shell
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "C-.") 'redo)
(global-set-key (kbd "M-.") 'undo)
(global-set-key (kbd "M-,") 'redo)
(global-set-key (kbd "C-m") 'newline-and-indent)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "M-n") 'next-error)
(global-set-key (kbd "M-p") 'previous-error)
(global-set-key (kbd "C-c m m v") 'vc-git-grep)
(setq compilation-scroll-output t)

;; http://stackoverflow.com/a/10093312/433570

;; package-activated-list
;; (pyvenv ac-helm ace-jump-buffer ace-window ace-jump-mode auto-compile bash-completion buffer-move cmake-mode dummy-h-mode elpy find-file-in-project find-file-in-repository fuzzy helm-backup helm-git helm-git-files helm-git-grep helm-helm-commands helm helm-ls-git highlight highlight-indentation idomenu iedit jedi-direx direx jedi auto-complete epc ctable concurrent js3-mode less-css-mode magit-filenotify magit-find-file magit-gh-pulls gh logito magit-push-remote markdown-mode mo-git-blame nose packed magit git-rebase-mode git-commit-mode pcache pg popup py-import-check pymacs python-django python-environment deferred python-mode redo+ virtualenv virtualenvwrapper s dash web-beautify web-mode xcscope yasnippet)

;; list the packages you want
;; (setq package-list '(package1 package2))
;; fetch the list of packages available
;; (unless package-archive-contents
;;     (package-refresh-contents))

;; install the missing packages
;; (dolist (package package-list)
;;     (unless (package-installed-p package)
;; 	      (package-install package)))
