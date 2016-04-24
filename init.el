

;; /Applications/Emacs.app/Contents/MacOS/Emacs --daemon

;; tutorials
;; http://stackoverflow.com/a/1242760/433570
;; tutorials

;; emacs mac
;; http://xor.lonnen.com/2013/01/04/emacs-on-osx.html

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
			 '("melpa" . "http://melpa.milkbox.net/packages/") t)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


;; http://stackoverflow.com/a/10093312/433570

;; list the packages you want
;; (setq package-list '(package1 package2))
;; fetch the list of packages available
;; (unless package-archive-contents
;;     (package-refresh-contents))

;; install the missing packages
;; (dolist (package package-list)
;;     (unless (package-installed-p package)
;; 	      (package-install package)))


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

;; dash
(require 'dash)
;; dash


;; bash-completion
(bash-completion-setup)
;; bash-completion

;; elpy
;; (package-initialize)
;; (elpy-enable)
;; elpy


;; --> ac-helm
(require 'auto-complete)
(require 'ac-helm)
(global-set-key (kbd "C-;") 'ac-complete-with-helm)
(define-key ac-complete-mode-map (kbd "C-;") 'ac-complete-with-helm)
;; <-- ac-helm

;; magit-find-file
(global-set-key (kbd "C-c p") 'magit-find-file-completing-read)
(global-set-key (kbd "C-x v k") 'magit-log-buffer-file)

;; magit-find-file

;; redo+
;;(require 'redo+)
;; redo+


;; virtualenvwrapper
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support
(setq venv-location "~/virtualenvs/")
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



;; ido
;; (ido-mode t)
;; (setq ido-enable-flex-matching t) ;; enable fuzzy matching
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

;; (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(setenv "PATH" (concat "/usr/local/mysql/bin:" (getenv "PATH")))
(setq exec-path (cons "/usr/local/mysql/bin" exec-path))
(setq exec-path (cons "/usr/local/bin" exec-path))


(midnight-delay-set 'midnight-delay "7:00am")

;; mac
(setq mac-option-key-is-meta t)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)
;; mac

;; xcscope
;; (cscope-setup)
;; (defun cscope-select-entry-this-window ()
;;   (interactive)
;;   (let ((file (get-text-property (point) `cscope-file))
;; 	(line-number (get-text-property (point) `cscope-line-number))
;; 	window)
;;     (setq window (cscope-show-entry-internal file line-number t (selected-window)))
;;     (if (windowp window)
;; 	(progn
;; 	  (select-window window)
;; 	  ))
;;     ))

;; (define-key cscope-list-entry-keymap (kbd "m") `cscope-select-entry-this-window)
;; (add-hook 'objc-mode-hook (function cscope:hook))
;; (add-hook 'java-mode-hook (function cscope:hook))
;; xcscope




;; Use ediff and not diff
;; http://stackoverflow.com/a/3712903/433570
(eval-after-load "vc-hooks"
  '(define-key vc-prefix-map "=" 'ediff-revision))

;; (defun ediff-current-buffer-revision ()
;;   "Run Ediff to diff current buffer's file against VC depot.
;; Uses `vc.el' or `rcs.el' depending on `ediff-version-control-package'."
;;   (interactive)
;;   (let ((file (or (buffer-file-name)
;; 				  (error "Current buffer is not visiting a file"))))
;; 	(if (and (buffer-modified-p)
;; 			 (y-or-n-p (message "Buffer %s is modified. Save buffer? "
;; 								(buffer-name))))
;; 		(save-buffer (current-buffer)))
;; 	(ediff-load-version-control)
;; 	(funcall
;; 	 (intern (format "ediff-%S-internal" ediff-version-control-package))
;; 	 "" "" nil)))


;; (setq diff-command "ediff")
;; Use ediff and not diff

;; auto-complete
(global-auto-complete-mode t)
(add-to-list 'ac-modes 'less-css-mode)
;; auto-complete


(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


;; web-mode
(add-to-list 'auto-mode-alist '("\\.less?\\'" . less-css-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . jinja2-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;; web-mode




;; highlight-D4D47C
;; (set-face-background 'highlight-indentation-face "#D6D694")
;; (set-face-background 'highlight-indentation-current-column-face "#D6D694")
;; highlight-indentation

;; (require 'back-button)

;; (back-button-mode 1)


;; python-django
(global-set-key (kbd "C-x j") 'python-django-open-project)
;; python-django
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(custom-safe-themes
   (quote
	("1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(elpy-default-minor-modes
   (quote
	(eldoc-mode flycheck-mode yas-minor-mode auto-complete-mode)))
 '(flycheck-flake8-maximum-line-length 140)
 '(grep-find-ignored-directories
   (quote
	("SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "migrations")))
 '(helm-boring-file-regexp-list
   (quote
	("migrations/*" "\\.git$" "\\.hg$" "\\.svn$" "\\.CVS$" "\\._darcs$" "\\.la$" "\\.o$" "~$" "bower_components/*")))
 '(helm-ff-transformer-show-only-basename nil)
 '(helm-grep-default-command "grep -n%cH --full-name -e %p %f")
 '(helm-ls-git-show-abs-or-relative (quote relative))
 '(helm-split-window-default-side (quote right))
 '(js2-strict-trailing-comma-warning nil)
 '(js3-auto-indent-p t)
 '(js3-enter-indents-newline t)
 '(js3-indent-on-enter-key t)
 '(safe-local-variable-values
   (quote
	((encoding . utf-8)
	 (python-shell-completion-string-code . "';'.join(get_ipython().Completer.all_completions('''%s'''))
")
	 (python-shell-completion-module-string-code . "';'.join(module_completion('''%s'''))
")
	 (python-shell-completion-setup-code . "from IPython.core.completerlib import module_completion")
	 (python-shell-interpreter-args . "/home/eugenekim/Documents/zibann/momsite/manage.py shell")
	 (python-shell-interpreter . "python"))))
 '(sp-autoinsert-pair nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-indentation-face ((t nil)))
 '(js2-external-variable ((t (:foreground "red"))))
 '(magit-hash ((t (:foreground "white")))))

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
;; (when (load "flymake" t)
;;   (defun flymake-pyflakes-init ()
;; 	(let* ((temp-file (flymake-init-create-temp-buffer-copy
;; 					   'flymake-create-temp-inplace))
;; 		   (local-file (file-relative-name
;; 						temp-file
;; 						(file-name-directory buffer-file-name))))
;; 	  (list "pycheckers"  (list local-file))))

;;   (add-to-list 'flymake-allowed-file-name-masks
;; 			   '("\\.py\\'" flymake-pyflakes-init)))

;; flymake

;; python setup instruction (pymacs/elpy/flymake)
;; sudo pip install -e "git+https://github.com/pinard/Pymacs.git#egg=Pymacs"
;; cd $VIRTUAL_ENV/src/pymacs
;; make
;; python -c 'import Pymacs'
;; sudo python setup.py install


;; pymacs.el 을 module path 에 copy 한다
;; http://stackoverflow.com/a/1393590/433570 : pychecker 파일을 만든다
;; pip install --upgrade rope ropemacs elpy
;; python setup instruction


;; repository-root
(add-to-list 'load-path (expand-file-name "site-lisp/repository-root" emacs_home))
(require 'repository-root)
;; repository-root
;; grep-o-matic
(add-to-list 'load-path (expand-file-name "site-lisp/grep-o-matic" emacs_home))
(require 'grep-o-matic)
;; grep-o-matic

;; http://lists.gnu.org/archive/html/bug-gnu-emacs/2009-09/msg00130.html
(setenv "PAGER" "/bin/cat")

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
;; (add-hook 'python-mode-hook 'jedi:setup)
;; jedi

;; el-get
;; (add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; (unless (require 'el-get nil 'noerror)
;;     (with-current-buffer
;; 		      (url-retrieve-synchronously
;; 			          "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
;; 	      (let (el-get-master-branch)
;; 			      (goto-char (point-max))
;; 				        (eval-print-last-sexp))))

;; (el-get 'sync)
;; el-get

;; pymacs
;; http://www.yilmazhuseyin.com/blog/dev/emacs-setup-python-development/
;; http://pymacs.progiciels-bpi.ca/pymacs.html#installation
;; (add-to-list 'load-path (expand-file-name "site-lisp/pymacs" emacs_home))

;; (require 'pymacs)


;; ;; http://stackoverflow.com/a/22496541/433570
;; (autoload 'pymacs-apply "pymacs")
;; (autoload 'pymacs-call "pymacs")
;; (autoload 'pymacs-eval "pymacs" nil t)
;; (autoload 'pymacs-exec "pymacs" nil t)
;; (autoload 'pymacs-load "pymacs" nil t)
;; (autoload 'pymacs-autoload "pymacs")
;; ;; (eval-after-load "pymacs"
;; ;;  '(add-to-list 'pymacs-load-path (expand-file-name "site-lisp" emacs_home)))
;; ;; (pymacs-load "ropemacs" "rope-")

;; ;; http://stackoverflow.com/a/6806217/433570
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

;; ;; (define-key ropemacs-local-keymap "\C-cg" nil)
;; ;; (define-key ropemacs-local-keymap (kbd "M-/") nil)
;; ;; ;; pymacs




;; http://kldp.org/node/110942
(prefer-coding-system 'utf-8)

(setq-default tab-width 4)


(setq compilation-scroll-output t)



(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; https://groups.google.com/forum/#!topic/gnu.emacs.help/ZGu2MNkJGrI
(defadvice terminal-init-xterm (after map-S-up-escape-sequence
									  activate)
  (define-key input-decode-map "\e[1;31" (kbd "C-;"))
  (define-key input-decode-map "\e[1;32" (kbd "C-="))
  (define-key input-decode-map "\e[1;34" (kbd "C-`"))
  (define-key input-decode-map "\e[1;35" (kbd "C-<left>"))
  (define-key input-decode-map "\e[1;36" (kbd "C-<right>"))
  (define-key input-decode-map "\e[1;37" (kbd "C-."))

  (define-key input-decode-map "\e[1;39" (kbd "C-M-;"))
  (define-key input-decode-map "\e[1;41" (kbd "C-M-DEL"))

  )

(define-key input-decode-map "\e[1;31" (kbd "C-;"))
(define-key input-decode-map "\e[1;32" (kbd "C-="))
(define-key input-decode-map "\e[1;34" (kbd "C-`"))
(define-key input-decode-map "\e[1;35" (kbd "C-<left>"))
(define-key input-decode-map "\e[1;36" (kbd "C-<right>"))
(define-key input-decode-map "\e[1;37" (kbd "C-."))
(define-key input-decode-map "\e[1;39" (kbd "C-M-;"))
(define-key input-decode-map "\e[1;41" (kbd "C-M-DEL"))


(load "init-smartparens")


;; http://www.masteringemacs.org/articles/2010/12/22/fixing-mark-commands-transient-mark-mode/
(defun push-mark-no-activate ()
  "Pushes `point' to `mark-ring' and does not activate the region
Equivalent to \\[set-mark-command] when \\[transient-mark-mode] is disabled"
  (interactive)
  (push-mark (point) t nil)
  (message "Pushed mark to ring"))

(global-set-key (kbd "C-`") 'push-mark-no-activate)


(defun jump-to-mark ()
  "Jumps to the local mark, respecting the `mark-ring' order.
This is the same as using \\[set-mark-command] with the prefix argument."
  (interactive)
  (set-mark-command 1))
(global-set-key (kbd "M-`") 'jump-to-mark)


(defun exchange-point-and-mark-no-activate ()
  "Identical to \\[exchange-point-and-mark] but will not activate the region."
  (interactive)
  (exchange-point-and-mark)
  (deactivate-mark nil))
(define-key global-map [remap exchange-point-and-mark] 'exchange-point-and-mark-no-activate)



(smartscan-mode 1)

(defun add-smartscan-keys ()
  (define-key smartscan-map (kbd "M-j") 'smartscan-symbol-go-forward)
  (define-key smartscan-map (kbd "M-k") 'smartscan-symbol-go-backward)
  )

(add-hook 'c-mode-hook 'add-smartscan-keys)
(add-hook 'python-mode-hook 'add-smartscan-keys)
(add-hook 'web-mode-hook 'add-smartscan-keys)
(add-hook 'js-mode-hook 'add-smartscan-keys)
(add-hook 'js2-mode-hook 'add-smartscan-keys)


;; http://www.emacswiki.org/emacs/DeletingWhitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; ssh xforwarding
;; http://people.csail.mit.edu/wentzlaf/faq/ssh_X.html
;; http://tylerkieft.com/archives/2006/10/05/redefine-the-x11-meta-key-in-mac-os-x/


(menu-bar-mode -1)
(tool-bar-mode -1)




;; (load-theme 'solarized-light t)

(set-default-font "DejaVu Sans Mono 11")
;; (set-default-font "Source Code Pro Medium 12")


(global-undo-tree-mode)

(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; (flycheck-define-checker javascript-jslint-reporter
;;   "A JavaScript syntax and style checker based on JSLint Reporter.

;; See URL `https://github.com/FND/jslint-reporter'."
;;   :command ("~/.emacs.d/jslint-reporter/jslint-reporter" source)
;;   :error-patterns
;;   ((error line-start (1+ nonl) ":" line ":" column ":" (message) line-end))
;;   :modes (js-mode js2-mode js3-mode))
;; (add-hook 'js-mode-hook (lambda ()
;;                           (flycheck-select-checker 'javascript-jslint-reporter)
;;                           (flycheck-mode)))


;; (setq mac-option-modifier 'super) ; sets the Option key to Super

;; http://stackoverflow.com/a/2627298/433570
(delete-selection-mode 1)

;; http://stackoverflow.com/a/23013184/433570
;; (defun my-ido-setup-hook ()
;;   (define-key
;; 	ido-buffer-completion-map
;; 	" "
;; 	'ido-restrict-to-matches))

;; (add-hook 'ido-setup-hook 'my-ido-setup-hook)

;; (setq bell-volume 0)
;; (setq sound-alist nil)


;; http://blog.mpacula.com/2012/01/28/howto-prevent-emacs-from-splitting-windows/
;; do not split my windows
(setq split-height-threshold 1200)
(setq split-width-threshold 2000)



;; save minibuffer history
(savehist-mode 1)
;; save minibuffer history


;; magit-gitflow
;; (require 'magit-gitflow)
;; (add-hook 'magit-mode-hook 'turn-on-magit-gitflow)

;; git-gutter
(global-git-gutter-mode +1)


;; elpy

(setq ac-sources
	  (delq 'ac-source-jedi-direct
			(delq 'ac-source-nropemacs
				  ac-sources)))


;; Set your lisp system and, optionally, some contribs
;; (setq inferior-lisp-program "/opt/sbcl/bin/sbcl")
;;  (setq slime-contribs '(slime-fancy))


;; (global-set-key [f5] 'slime-js-reload)
;; (add-hook 'js2-mode-hook
;; 		  (lambda ()
;; 			(slime-js-minor-mode 1)))


;; (set-variable 'magit-emacsclient-executable "/usr/local/bin/emacsclient")
(set-variable 'magit-emacsclient-executable "/usr/local/bin/ec")


;; (add-to-list 'load-path (expand-file-name "site-lisp/emacs-for-python" emacs_home))
;; (require 'epy-setup)      ;; It will setup other loads, it is required!
;; (require 'epy-python)     ;; If you want the python facilities [optional]
;; (require 'epy-completion) ;; If you want the autocompletion settings [optional]
;; (require 'epy-editing)    ;; For configurations related to editing [optional]
;; (require 'epy-bindings)   ;; For my suggested keybindings [optional]
;; (require 'epy-nose)       ;; For nose integration


;;----------
;; Keybinding to add breakpoint:
(defun python-add-breakpoint ()
  (interactive)
  (newline-and-indent)
  (insert "import pdb; pdb.set_trace()")
  (highlight-lines-matching-regexp "^[ ]*import pdb; pdb.set_trace()"))

(add-hook 'python-mode-hook
		  (lambda () (define-key python-mode-map (kbd "C-c C-u") 'python-add-breakpoint))
		  )


;; (set-variable 'magit-emacsclient-executable "/usr/local/bin/emacsclient")
(set-variable 'magit-emacsclient-executable "/usr/local/bin/ec")

(eval-after-load "sql"
  '(load-library "sql-indent"))
;; jedi
(add-hook 'python-mode-hook 'jedi:setup)
;; jedi


(global-set-key (kbd "C-o") 'newline-and-indent)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "M-c") 'capitalize-word)
(global-set-key (kbd "C-M-;") 'comment-region) ;doesn't work in shell
(global-set-key (kbd "C-M-DEL") 'indent-region) ;doesn't work in shell

(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "M-.") 'undo)
(global-set-key (kbd "M-,") 'redo)
(global-set-key (kbd "C-m") 'newline-and-indent)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "M-n") 'next-error)
(global-set-key (kbd "M-p") 'previous-error)
(global-set-key (kbd "C-c m m v") 'vc-git-grep)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-.") 'imenu-anywhere)


;; helm

(use-package
 helm
 :ensure t
 :diminish helm-mode
 :init
 (progn
   (require 'helm)
   (require 'helm-config)
   (require 'helm-swoop)
   (setq helm-boring-file-regexp-list
		 '("\\` " "\\*helm" "\\*helm-mode" "\\*Echo Area" "\\*tramp" "\\*Minibuf" "\\*epc"))
   (global-set-key (kbd "C-c h") 'helm-command-prefix)
   (global-unset-key (kbd "C-x c"))
   (setq helm-ff-skip-boring-files t)
   (loop for ext in '("migrations/*")
		 do (add-to-list 'helm-boring-file-regexp-list ext))


   (setq helm-candidate-number-limit 100)
   ;; From https://gist.github.com/antifuchs/9238468
   (setq helm-idle-delay 0.0 ; update fast sources immediately (doesn't).
		 helm-input-idle-delay 0.01  ; this actually updates things
										; reeeelatively quickly.
		 helm-yas-display-key-on-candidate t
		 helm-quick-update t
		 helm-M-x-requires-pattern nil
		 helm-ff-skip-boring-files t)

   (setq helm-move-to-line-cycle-in-source t)
   (helm-mode))
 :bind (
		("C-h a" . helm-apropos)
		("C-h b" . helm-descbinds)
		("C-x b" . helm-buffers-list)
		("C-x C-b" . helm-mini)
		("C-M-y" . helm-show-kill-ring)
		("M-x" . helm-M-x)
		("C-c h o" . helm-occur)
		("C-c h s" . helm-swoop)
		("C-c h y" . helm-yas-complete)
		("C-c h Y" . helm-yas-create-snippet-on-region)
		("C-c h b" . my/helm-do-grep-book-notes)
		("C-c C-h" . helm-resume)
		("C-x C-f" . helm-find-files)
		("C-h SPC" . helm-all-mark-rings)
		:map helm-map
		([tab] . helm-execute-persistent-action)
		("C-i" . helm-execute-persistent-action)
		("C-z" . helm-select-action)
		("M-o" . helm-previous-source)
		)
 )
(ido-mode -1) ;; Turn off ido mode in case I enabled it accidentally

(use-package
  helm-git-grep
  :ensure t
  :init
  (progn
   (require 'helm)
	(define-key isearch-mode-map (kbd "C-c g") 'helm-git-grep-from-isearch)
	(setq helm-git-grep-candidate-number-limit nil)
	(setq helm-candidate-number-limit 999)

	)
  :bind (
		 ("C-c g" . helm-git-grep)
		 ("C-c l" . helm-git-grep-with-exclude-file-pattern)
		 )
  :config
  (progn
	(define-key helm-map (kbd "C-c g") 'helm-git-grep-from-helm)

	(defun helm-git-grep-at-point-no-mark ()
	  "Helm git grep with symbol at point.

 if submodules exists, grep submodules too."
	  (interactive)
	  (let* ((symbol (thing-at-point 'symbol))
			 (input (if symbol (concat symbol " ") nil)))
		(helm-git-grep-1 input)))

	(global-set-key (kbd "C-c k") 'helm-git-grep-at-point-no-mark)
	)
  )

(use-package
  helm-ls-git
  :ensure t
  :bind (
		 ("C-x M-p" . helm-ls-git-ls)
		 )
  )

(use-package
  ag
  :ensure t
  :bind (
		 ("C-c l" . ag-project)
		 )
  )

(use-package
  ido
  :ensure t
  :init
  (progn
	(setq ido-use-virtual-buffers t)
	)
  )

(setq my-package-list '(undo-tree idomenu json-snatcher dired+ gh find-file-in-repository ctable highlight-indentation helm-anything evil-leader helm-backup magit-popup bash-completion image-dired+ smartparens jedi-core redo+ helm-core python-environment magit json-reformat jedi-direx pcache async smartrep mo-git-blame let-alist direx find-file-in-project packed virtualenv dummy-h-mode helm-git magit-find-file handlebars-sgml-mode jedi js2-mode ucs-utils image+ popup color-theme-solarized buffer-move git-gutter color-theme-sanityinc-solarized wgrep xcscope helm-helm-commands magit-gh-pulls s imenu-anywhere goto-chg expand-region nodejs-repl back-button magit-gitflow pg flycheck list-utils company smartscan virtualenvwrapper fuzzy with-editor magit-filenotify anything color-theme git-blame visible-mark anything-git-grep highlight logito pkg-info pyvenv py-import-check persistent-soft dash json-mode wgrep-helm solarized-theme git-commit auto-complete web-beautify less-css-mode nav-flash git-gutter+ python-mode imenu+ iedit evil concurrent epl color-theme-approximate helm-git-files auto-compile epc))

(mapc #'package-install my-package-list)
