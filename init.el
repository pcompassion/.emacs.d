;; tutorials
;; http://stackoverflow.com/a/1242760/433570
;; tutorials

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

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

;; helm-git-grep
(global-set-key (kbd "C-c g") 'helm-git-grep)
;; helm-git-grep

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


(global-set-key (kbd "M-n") 'next-error)
(global-set-key (kbd "M-p") 'previous-error)
(setq compilation-scroll-output t)


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

;; http://kldp.org/node/110942
(prefer-coding-system 'utf-8)

(setq-default tab-width 4)


(global-set-key (kbd "C-o") 'newline-and-indent)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "M-c") 'capitalize-word)
(global-set-key (kbd "C-M-;") 'comment-region)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "C-.") 'redo)
(global-set-key (kbd "M-.") 'undo)
(global-set-key (kbd "M-,") 'redo)
(global-set-key (kbd "C-m") 'newline-and-indent)
(global-set-key (kbd "C-c r") 'revert-buffer)


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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(grep-find-ignored-directories (quote ("SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "migrations")))
 '(helm-ff-transformer-show-only-basename nil)
 '(helm-ls-git-show-abs-or-relative (quote relative))
 '(js3-auto-indent-p t)
 '(js3-enter-indents-newline t)
 '(js3-indent-on-enter-key t)
 '(safe-local-variable-values (quote ((python-shell-completion-string-code . "';'.join(get_ipython().Completer.all_completions('''%s'''))
") (python-shell-completion-module-string-code . "';'.join(module_completion('''%s'''))
") (python-shell-completion-setup-code . "from IPython.core.completerlib import module_completion") (python-shell-interpreter-args . "/home/eugenekim/Documents/zibann/momsite/manage.py shell") (python-shell-interpreter . "python")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-indentation-current-column-face ((t nil)))
 '(highlight-indentation-face ((t nil)))
 '(magit-item-highlight ((t (:box (:line-width 2 :color "magenta" :style released-button))))))

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

(global-set-key (kbd "C-c g") 'helm-git-grep)
(global-set-key (kbd "C-c k") 'helm-git-grep-at-point)



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



