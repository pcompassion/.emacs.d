(setq spacemacs-start-directory "~/spacemacs/.emacs.d/")
(let ((spacemacs-setting (concat spacemacs-start-directory "init.el")))
      (when (file-exists-p spacemacs-setting)
        (load-file spacemacs-setting))
      )


(setq mac-command-modifier 'meta)

;; ;; /Applications/Emacs.app/Contents/MacOS/Emacs --daemon

;; ;; tutorials
;; ;; http://stackoverflow.com/a/1242760/433570
;; ;; <--tutorials

;; ;; emacs mac
;; ;; http://xor.lonnen.com/2013/01/04/emacs-on-osx.html

(require 'package)
(setq package-enable-at-startup nil)
(setq package-check-signature nil)    ;http://stackoverflow.com/a/26110978/433570

;; http://emacs.stackexchange.com/a/2989/12031
(setq package-archives
      '(
        ("MELPA"        . "https://melpa.org/packages/")
        ("GNU ELPA"     . "http://elpa.gnu.org/packages/")
        ("MELPA Stable" . "https://stable.melpa.org/packages/")
        )
      package-archive-priorities
      '(("MELPA Stable" . 7)
        ("GNU ELPA"     . 5)
        ("MELPA"        . 10)))

;; (add-to-list 'package-archives
;;                  '("melpa-stable" . "http://stable.melpa.org/packages/"))
;; (add-to-list 'package-archives
;;       '("melpa" . "http://melpa.org/packages/"))


(let ((spacemacs-setting (concat spacemacs-start-directory "init.el")))
  (unless (file-exists-p spacemacs-setting)
    (package-initialize));; no need for spacemacs
  )

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
;;        (package-install package)))


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



;; bash-completion
;; (bash-completion-setup)
;; bash-completion

;; elpy
;; (package-initialize)
;; (elpy-enable)
;; elpy


;; --> ac-helm
;;(require 'auto-complete)

;; (use-package
;;     ac-helm
;;   :ensure t
;;   :bind (
;;   ("C-;" . ac-complete-with-helm)
;;   :map helm-map
;;   ("C-;" . ac-complete-with-helm)
;;   )
;;   )

;; <-- ac-helm


(use-package
  magit
  :ensure t
  )

;; magit-find-file
;; Magit rules!
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x v k") 'magit-log-buffer-file)

;; magit-find-file

;; redo+
;;(require 'redo+)
;; redo+



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
      (setq tab-width 2)
      (setq indent-tabs-mode nil)
      (setq c-basic-offset 2)
      (setq c-subword-mode t)
      (c-set-offset 'innamespace 0) ;do not indent { inside a namespace
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
      ;;    (gtags-mode 1)
                    ;   (define-key c++-mode-map (kbd "<C-return>") 'semantic-complete-analyze-inline)
      (local-set-key  (kbd "C-x z") 'ff-find-other-file)

      )
      )

;; (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(setenv "PATH" (concat "/usr/local/mysql/bin:" (getenv "PATH")))
(setq exec-path (cons "/usr/local/mysql/bin" exec-path))
(setq exec-path (cons "/usr/local/bin" exec-path))
(setq exec-path (append exec-path '("~/.nvm/versions/node/v8.4.0/bin")))


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
;;  (line-number (get-text-property (point) `cscope-line-number))
;;  window)
;;     (setq window (cscope-show-entry-internal file line-number t (selected-window)))
;;     (if (windowp window)
;;  (progn
;;    (select-window window)
;;    ))
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
;;          (error "Current buffer is not visiting a file"))))
;;  (if (and (buffer-modified-p)
;;       (y-or-n-p (message "Buffer %s is modified. Save buffer? "
;;                (buffer-name))))
;;    (save-buffer (current-buffer)))
;;  (ediff-load-version-control)
;;  (funcall
;;   (intern (format "ediff-%S-internal" ediff-version-control-package))
;;   "" "" nil)))


;; (setq diff-command "ediff")
;; Use ediff and not diff



(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


;; web-mode
(add-to-list 'auto-mode-alist '("\\.less?\\'" . less-css-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . jinja2-mode))
;; (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . jinja2-mode))
(add-to-list 'auto-mode-alist '("\\.jsp?\\'" . web-mode))
;; web-mode

(add-to-list 'auto-mode-alist '("\\.php?\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.php.cache?\\'" . php-mode))



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
   '("1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default))
 '(dired-listing-switches "-alFh")
 '(eclim-executable "/Applications/Eclipse.app/Contents/Eclipse/eclim")
 '(elpy-default-minor-modes
   '(eldoc-mode flycheck-mode yas-minor-mode auto-complete-mode))
 '(es-always-pretty-print t)
 '(flycheck-check-syntax-automatically '(save new-line mode-enabled))
 '(flycheck-flake8-maximum-line-length 140)
 '(geben-dbgp-default-port 10011)
 '(grep-find-ignored-directories
   '("SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "migrations" "bower_components" "node_modules" "bower_components"))
 '(grep-find-ignored-files
   '(".#*" "*.o" "*~" "*.bin" "*.lbin" "*.so" "*.a" "*.ln" "*.blg" "*.bbl" "*.elc" "*.lof" "*.glo" "*.idx" "*.lot" "*.fmt" "*.tfm" "*.class" "*.fas" "*.lib" "*.mem" "*.x86f" "*.sparcf" "*.dfsl" "*.pfsl" "*.d64fsl" "*.p64fsl" "*.lx64fsl" "*.lx32fsl" "*.dx64fsl" "*.dx32fsl" "*.fx64fsl" "*.fx32fsl" "*.sx64fsl" "*.sx32fsl" "*.wx64fsl" "*.wx32fsl" "*.fasl" "*.ufsl" "*.fsl" "*.dxl" "*.lo" "*.la" "*.gmo" "*.mo" "*.toc" "*.aux" "*.cp" "*.fn" "*.ky" "*.pg" "*.tp" "*.vr" "*.cps" "*.fns" "*.kys" "*.pgs" "*.tps" "*.vrs" "*.pyc" "*.pyo" "uploadDSYM" "jquery.js" "plugins.js"))
 '(helm-boring-file-regexp-list
   '("\\` " "\\*helm" "\\*helm-mode" "\\*Echo Area" "\\*tramp" "\\*Minibuf" "\\*epc" "\\.git$" "\\.hg$" "\\.svn$" "\\.CVS$" "\\._darcs$" "\\.la$" "\\.o$" "~$" "bower_components/*" "static/saleor/js/*" "\\.min\\.js$" "\\.min\\.css$" "jquery\\.js" "js-modules/" "djangojs/init.js"))
 '(helm-ff-transformer-show-only-basename nil)
 '(helm-grep-file-path-style 'relative)
 '(helm-grep-ignored-directories
   '("SCCS/" "RCS/" "CVS/" "MCVS/" ".svn/" ".git/" ".hg/" ".bzr/" "_MTN/" "_darcs/" "{arch}/" ".gvfs/" "SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "migrations" "bower_components" "node_modules" "bower_components" "momsite/static" "js-modules/"))
 '(helm-grep-ignored-files
   '(".#*" "*.o" "*~" "*.bin" "*.lbin" "*.so" "*.a" "*.ln" "*.blg" "*.bbl" "*.elc" "*.lof" "*.glo" "*.idx" "*.lot" "*.fmt" "*.tfm" "*.class" "*.fas" "*.lib" "*.mem" "*.x86f" "*.sparcf" "*.dfsl" "*.pfsl" "*.d64fsl" "*.p64fsl" "*.lx64fsl" "*.lx32fsl" "*.dx64fsl" "*.dx32fsl" "*.fx64fsl" "*.fx32fsl" "*.sx64fsl" "*.sx32fsl" "*.wx64fsl" "*.wx32fsl" "*.fasl" "*.ufsl" "*.fsl" "*.dxl" "*.lo" "*.la" "*.gmo" "*.mo" "*.toc" "*.aux" "*.cp" "*.fn" "*.ky" "*.pg" "*.tp" "*.vr" "*.cps" "*.fns" "*.kys" "*.pgs" "*.tps" "*.vrs" "*.pyc" "*.pyo" ".#*" "*.o" "*~" "*.bin" "*.lbin" "*.so" "*.a" "*.ln" "*.blg" "*.bbl" "*.elc" "*.lof" "*.glo" "*.idx" "*.lot" "*.fmt" "*.tfm" "*.class" "*.fas" "*.lib" "*.mem" "*.x86f" "*.sparcf" "*.dfsl" "*.pfsl" "*.d64fsl" "*.p64fsl" "*.lx64fsl" "*.lx32fsl" "*.dx64fsl" "*.dx32fsl" "*.fx64fsl" "*.fx32fsl" "*.sx64fsl" "*.sx32fsl" "*.wx64fsl" "*.wx32fsl" "*.fasl" "*.ufsl" "*.fsl" "*.dxl" "*.lo" "*.la" "*.gmo" "*.mo" "*.toc" "*.aux" "*.cp" "*.fn" "*.ky" "*.pg" "*.tp" "*.vr" "*.cps" "*.fns" "*.kys" "*.pgs" "*.tps" "*.vrs" "*.pyc" "*.pyo" "uploadDSYM" "jquery.js" "plugins.js" "djangojs/init.js"))
 '(helm-ls-git-show-abs-or-relative 'relative)
 '(helm-split-window-default-side 'right)
 '(js2-strict-trailing-comma-warning nil)
 '(js3-auto-indent-p t)
 '(js3-enter-indents-newline t)
 '(js3-indent-on-enter-key t)
 '(magit-log-arguments '("--graph" "--decorate" "--follow"))
 '(network-security-level 'medium)
 '(org-link-file-path-type 'relative)
 '(package-selected-packages
   '(jupyter julia-mode julia-repl typescript-mode helm xclip tern-django xref-js2 helm-git helm-git-files docker docker-compose-mode dockerfile-mode magit yasnippet undo-tree vcl-mode logstash-conf helm-lsp lsp-ui company-lsp treemacs projectile dap-mode lsp-java es-mode ng2-mode org tern anaconda-mode wgrep wgrep-helm jedi jedi-core ob-ipython prettier-js rjsx-mode ethan-wspace rjsx exec-path-from-shell swift-mode ivy flycheck swift3-mode sql-indent color-theme git-blamed auto-complete helm-projectile flx-ido geben cl-lib cl-lib-highlight php-mode ztree xcscope web-mode web-beautify visible-mark virtualenvwrapper virtualenv use-package test-simple sudo-ext solarized-theme smartscan smartparens redo+ python-mode py-import-check pg nodejs-repl mo-git-blame magit-gitflow magit-gh-pulls magit-find-file magit-filenotify loc-changes load-relative less-css-mode json-mode jinja2-mode imenu+ image-dired+ image+ iedit idomenu highlight helm-swoop helm-ls-hg helm-ls-git helm-hatena-bookmark helm-git-grep helm-flycheck helm-descbinds helm-dash helm-backup helm-ag handlebars-sgml-mode gradle-mode git-gutter git-gutter+ git-blame fuzzy flymake-python-pyflakes find-file-in-repository f expand-region evil-leader elpy dummy-h-mode color-theme-solarized color-theme-sanityinc-solarized color-theme-approximate buffer-move bash-completion back-button auto-compile anything-git-grep ag))
 '(request-curl-options '("-k"))
 '(safe-local-variable-values
   '((encoding . utf-8)
     (python-shell-completion-string-code . "';'.join(get_ipython().Completer.all_completions('''%s'''))
")
     (python-shell-completion-module-string-code . "';'.join(module_completion('''%s'''))
")
     (python-shell-completion-setup-code . "from IPython.core.completerlib import module_completion")
     (python-shell-interpreter-args . "/home/eugenekim/Documents/zibann/momsite/manage.py shell")
     (python-shell-interpreter . "python")))
 '(sp-autoinsert-pair nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-grep-file ((t (:foreground "green" :underline t))))
 '(helm-ls-git-modified-not-staged-face ((t (:foreground "orange"))))
 '(helm-selection ((t (:background "blue" :foreground "white"))))
 '(highlight-indentation-face ((t nil)))
 '(js2-external-variable ((t (:foreground "red"))))
 '(magit-diff-added ((t (:background "green" :foreground "black"))))
 '(magit-diff-added-highlight ((t (:background "green" :foreground "black"))))
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
;;  (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;             'flymake-create-temp-inplace))
;;       (local-file (file-relative-name
;;            temp-file
;;            (file-name-directory buffer-file-name))))
;;    (list "pycheckers"  (list local-file))))

;;   (add-to-list 'flymake-allowed-file-name-masks
;;         '("\\.py\\'" flymake-pyflakes-init)))

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
;; (add-to-list 'load-path (expand-file-name "site-lisp/repository-root" emacs_home))
;; (require 'repository-root)
;; repository-root
;; grep-o-matic
;; (add-to-list 'load-path (expand-file-name "site-lisp/grep-o-matic" emacs_home))
;; (require 'grep-o-matic)
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
;;          (url-retrieve-synchronously
;;                "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
;;        (let (el-get-master-branch)
;;            (goto-char (point-max))
;;                (eval-print-last-sexp))))

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
;;   ;; Unbind M-o from the local keymap
;;   (define-key elpy-mode-map (kbd "M-n") nil)
;;   (define-key elpy-mode-map (kbd "M-p") nil)

;;   ;; Add an alternative local binding for the command
;;   ;; bound to M-o
;;   ;; (define-key dired-mode-map (kbd "C-c o")
;;   ;;   (lookup-key dired-mode-map (kbd "M-o")))

;;   ))

;; ;; (define-key ropemacs-local-keymap "\C-cg" nil)
;; ;; (define-key ropemacs-local-keymap (kbd "M-/") nil)
;; ;; ;; pymacs




;; http://kldp.org/node/110942
(prefer-coding-system 'utf-8)

(setq-default tab-width 2)


(setq compilation-scroll-output t)



(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; https://groups.google.com/forum/#!topic/gnu.emacs.help/ZGu2MNkJGrI
(defadvice terminal-init-xterm (after map-S-up-escape-sequence activate)
  (define-key input-decode-map "\e[1;31" (kbd "C-;"))
  (define-key input-decode-map "\e[1;32" (kbd "C-="))
  (define-key input-decode-map "\e[1;34" (kbd "C-`"))
  (define-key input-decode-map "\e[1;35" (kbd "C-<left>"))
  (define-key input-decode-map "\e[1;36" (kbd "C-<right>"))


  (define-key input-decode-map "\e[1;39" (kbd "C-M-;"))
  (define-key input-decode-map "\e[1;41" (kbd "C-M-\\"))
  (define-key input-decode-map "\e[1;42" (kbd "C-M-SPC"))
  (define-key input-decode-map "\e[1;43" (kbd "C-M-["))
  (define-key input-decode-map "\e[1;45" (kbd "M-S-<RET>"))

  (define-key input-decode-map "\e[1;46" (kbd "C-S-a"))
  (define-key input-decode-map "\e[1;47" (kbd "C-S-d"))
  (define-key input-decode-map "\e[1;3A" (kbd "M-S-<RET>"))
  ;; (define-key input-decode-map "\e[1;3A" [S-up])

  )


(define-key input-decode-map "\e[1;31" (kbd "C-;"))
(define-key input-decode-map "\e[1;32" (kbd "C-="))
(define-key input-decode-map "\e[1;33" (kbd "C-:"))
(define-key input-decode-map "\e[1;34" (kbd "C-`"))
(define-key input-decode-map "\e[1;35" (kbd "C-<left>"))
(define-key input-decode-map "\e[1;36" (kbd "C-<right>"))
(define-key input-decode-map "\e[1;37" (kbd "C-."))
(define-key input-decode-map "\e[1;38" (kbd "C-,"))

(define-key input-decode-map "\e[1;39" (kbd "C-M-;"))
(define-key input-decode-map "\e[1;41" (kbd "C-M-\\"))
(define-key input-decode-map "\e[1;42" (kbd "C-M-SPC"))
(define-key input-decode-map "\e[1;43" (kbd "C-M-["))
  (define-key input-decode-map "\e[1;45" (kbd "M-S-<RET>"))
  (define-key input-decode-map "\e[1;46" (kbd "C-S-a"))
  (define-key input-decode-map "\e[1;47" (kbd "C-S-d"))
  (define-key input-decode-map "\e[1;3A" (kbd "M-S-<RET>"))



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




(defun add-smartscan-keys ()
  (define-key smartscan-map (kbd "M-j") 'smartscan-symbol-go-forward)
  (define-key smartscan-map (kbd "M-k") 'smartscan-symbol-go-backward)
  )

(add-hook 'c-mode-hook 'add-smartscan-keys)
(add-hook 'python-mode-hook 'add-smartscan-keys)
(add-hook 'web-mode-hook 'add-smartscan-keys)
(add-hook 'js-mode-hook 'add-smartscan-keys)
(add-hook 'js2-mode-hook 'add-smartscan-keys)
(add-hook 'python-mode-hook 'anaconda-mode)
;; (add-hook 'js-mode-hook (lambda () (tern-mode t)))

;; http://stackoverflow.com/a/6248712/433570
(defun js-import-path ()
  "javascript import path"
  (interactive)
  (let ((file-name (buffer-file-name (window-buffer (minibuffer-selected-window)))))

    (cond  ((string-match-p (regexp-quote "static") file-name)
        (kill-new (car (last
                        (split-string
                         (car (split-string file-name "\\."))
                         "static/")))))
    (t (kill-new (car (last
                      (split-string
                       (car (split-string file-name "\\."))
                       "src/")))))
    ))
  )

(defun python-import-path ()
  "python import path"
  (interactive)
  (let ((file-name (buffer-file-name (window-buffer (minibuffer-selected-window)))))
    (kill-new
     (replace-regexp-in-string "\/" "."
                               (car (split-string (car (last (split-string file-name "apps/"))) "\\."))
    )
)
    )
  )

(add-hook 'python-mode-hook
          (lambda() (local-set-key (kbd "C-c i") 'python-import-path)))



;; http://www.emacswiki.org/emacs/DeletingWhitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; ssh xforwarding
;; http://people.csail.mit.edu/wentzlaf/faq/ssh_X.html
;; http://tylerkieft.com/archives/2006/10/05/redefine-the-x11-meta-key-in-mac-os-x/


(menu-bar-mode -1)
(tool-bar-mode -1)




;; (load-theme 'solarized-light t)

;; (set-default-font "DejaVu Sans Mono 11")
;; (set-default-font "Monaco 14")

;; (set-frame-font "Monaco 14" nil t)

;; (set-default-font "Source Code Pro Medium 12")





;; https://github.com/mooz/js2-mode/issues/292

;; http://stackoverflow.com/a/2627298/433570
(delete-selection-mode 1)

;; http://stackoverflow.com/a/23013184/433570
;; (defun my-ido-setup-hook ()
;;   (define-key
;;  ido-buffer-completion-map
;;  " "
;;  'ido-restrict-to-matches))

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



;; elpy

;; (setq ac-sources
;;    (delq 'ac-source-jedi-direct
;;      (delq 'ac-source-nropemacs
;;          ac-sources)))


;; Set your lisp system and, optionally, some contribs
;; (setq inferior-lisp-program "/opt/sbcl/bin/sbcl")
;;  (setq slime-contribs '(slime-fancy))


;; (global-set-key [f5] 'slime-js-reload)
;; (add-hook 'js2-mode-hook
;;      (lambda ()
;;      (slime-js-minor-mode 1)))


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
;; (add-hook 'python-mode-hook 'jedi:setup)
;; jedi


(global-set-key (kbd "C-o") 'newline-and-indent)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "M-c") 'capitalize-word)
(global-set-key (kbd "C-M-;") 'comment-dwim) ;doesn't work in shell
(global-set-key (kbd "C-M-DEL") 'indent-region) ;doesn't work in shell

(global-set-key (kbd "M-.") 'undo)
(global-set-key (kbd "M-,") 'redo)
(global-set-key (kbd "C-m") 'newline-and-indent)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "M-n") 'next-error)
(global-set-key (kbd "M-p") 'previous-error)
(global-set-key (kbd "C-c m m v") 'vc-git-grep)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-h C-p") 'previous-buffer)
(global-set-key (kbd "C-h C-n") 'previous-buffer)

;; helm

(use-package
  helm-swoop
  :ensure t
 :bind (
    ("C-c h s" . helm-swoop)
    )
  )

(use-package
  prettier-js
  :ensure t
  )

(use-package
 helm
 :ensure t
 :diminish helm-mode
 :init
 (progn
   (require 'helm)
   (require 'helm-swoop)
   (require 'helm-config)
  (setq helm-boring-file-regexp-list
    '("\\` " "\\*helm" "\\*helm-mode" "\\*Echo Area" "\\*tramp" "\\*Minibuf" "\\*epc" "\\.git$" "\\.hg$" "\\.svn$" "\\.CVS$" "\\._darcs$" "\\.la$" "\\.o$" "~$" "bower_components/*" "static/saleor/js/*" "\\.min\\.js$"  "\\.min\\.css$" "jquery\\.js" "js-modules/"))
   (global-set-key (kbd "C-c h") 'helm-command-prefix)
   (global-unset-key (kbd "C-x c"))
   (setq helm-ff-skip-boring-files t)
   (setq helm-buffer-max-length 40)
   (setq helm-ff-history-max-length 500)

   (setq helm-candidate-number-limit 100)
   ;; From https://gist.github.com/antifuchs/9238468
   (setq helm-idle-delay 0.0 ; update fast sources immediately (doesn't).
     helm-input-idle-delay 0.01  ; this actually updates things
                    ; reeeelatively quickly.
     helm-yas-display-key-on-candidate t
     helm-quick-update t
     helm-M-x-requires-pattern nil
     helm-ff-skip-boring-files t)

   (setq helm-move-to-line-cycle-in-source nil)
   (setq helm-grep-truncate-lines nil)
   (setq helm-buffers-truncate-lines nil)
   (setq helm-ff-newfile-prompt-p nil)

   (defun my-helm-grep-do-git-grep (not-all)
   (interactive "P")
   (helm-grep-git-1 default-directory (null not-all)))

   (global-set-key (kbd "C-c g") 'my-helm-grep-do-git-grep)


   (defun helm-git-grep-at-point-no-mark (arg)
   "Helm git grep with symbol at point.

 if submodules exists, grep submodules too."
   (interactive "P")
   (let* ((symbol (thing-at-point 'symbol))
      (input (if symbol (concat symbol " ") nil)))
     (helm-grep-git-1 default-directory (null arg) nil input)))

   (global-set-key (kbd "C-c k") 'helm-git-grep-at-point-no-mark)

   ;; https://github.com/emacs-helm/helm/issues/1492
   (defun helm-buffers-sort-transformer@donot-sort (_ candidates _)
   candidates)
   (advice-add 'helm-buffers-sort-transformer :around 'helm-buffers-sort-transformer@donot-sort)

   ;; (setq helm-grep-ignored-files (append helm-grep-ignored-files grep-find-ignored-files))
   ;; (setq helm-grep-ignored-directories (append helm-grep-ignored-directories grep-find-ignored-directories))

   (setq helm-candidate-number-limit 9999)


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
    ("C-c h S" . helm-multi-swoop-all)
    ("C-c h y" . helm-yas-complete)
    ("C-c h Y" . helm-yas-create-snippet-on-region)
    ("C-c h b" . my/helm-do-grep-book-notes)
    ("C-c C-h" . helm-resume)
    ("C-x C-f" . helm-find-files)
    ("C-h C-SPC" . helm-all-mark-rings)
    ("C-h SPC" . helm-global-mark-ring)
    ("C-x r b" . helm-bookmarks)
    :map helm-map
    ([tab] . helm-execute-persistent-action)
    ("C-i" . helm-execute-persistent-action)
    ("C-z" . helm-select-action)
    ("M-o" . helm-previous-source)
    ("C-]" . helm-ff-run-toggle-basename)
    :map helm-grep-mode-map
    ("M-n" . helm-gm-next-file)
    ("M-p" . helm-gm-precedent-file)
    )
 )
(ido-mode -1) ;; Turn off ido mode in case I enabled it accidentally

;; (use-package
;;   helm-git-grep
;;   :ensure t
;;   :init
;;   (progn
;;    (require 'helm)
;;  (define-key isearch-mode-map (kbd "C-c g") 'helm-git-grep-from-isearch)
;;  (setq helm-git-grep-candidate-number-limit nil)
;;  (setq helm-candidate-number-limit 999)

;;  )
;;   :bind (
;;     ("C-c g" . helm-git-grep)
;;     ("C-c l" . helm-git-grep-with-exclude-file-pattern)
;;     )
;;   :config
;;   (progn
;;  (define-key helm-map (kbd "C-c g") 'helm-git-grep-from-helm)

;;  (defun helm-git-grep-at-point-no-mark ()
;;    "Helm git grep with symbol at point.

;;  if submodules exists, grep submodules too."
;;    (interactive)
;;    (let* ((symbol (thing-at-point 'symbol))
;;       (input (if symbol (concat symbol " ") nil)))
;;    (helm-git-grep-1 input)))

;;  (global-set-key (kbd "C-c k") 'helm-git-grep-at-point-no-mark)
;;  )
;;   )


(use-package
  helm-ls-git
  :ensure t
  :bind (
     ("C-x M-p" . helm-browse-project)
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
  anaconda-mode
  :ensure t
  :init
  (setq anaconda-mode-localhost-address "localhost")
  :config
  (progn
    (unbind-key "M-." anaconda-mode-map)
    (unbind-key "M-," anaconda-mode-map)
   )
  :bind
         (:map anaconda-mode-map
               ("C-." . anaconda-mode-find-definitions)
               ("C-," . xref-pop-marker-stack)
               )

  )
;; (use-package
;;   ido
;;   :ensure t
;;   :init
;;   (progn
;;  (setq ido-use-virtual-buffers t)
;;  )
;;   )


(use-package
  ivy
  :ensure t
  :init
  (progn
    (setq ivy-use-virtual-buffers t)
    (setq ivy-count-format "(%d/%d) ")
    )
  )



;; (use-package
;;   smartparens
;;   :ensure t
;;   :init
;;   (progn
;;   (load "init-smartparens")
;;   ;; (sp-local-pair 'python-mode "'" nil :actions nil)
;;   ;; (sp-local-pair 'python-mode "\"" nil :actions nil)
;;   (setq sp-autoescape-string-quote nil)
;;   (setq sp-escape-quotes-after-insert nil)
;;   )
;;   )

(use-package
  expand-region
  :ensure t
  :init
  (progn
  )
  )

;; (use-package
;;   tern
;;   :ensure t
;;   :init
;;   (progn
;;     (add-hook 'js-mode-hook (lambda () (tern-mode t)))
;;   )
;;   )


(use-package
  xref-js2
  :ensure t
  :init
  (progn

    (add-hook 'js2-mode-hook (lambda ()
                               (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))
    )

  :bind

         (:map js2-mode-map
               ("C-." . xref-find-definitions)
               ("C-," . xref-pop-marker-stack)
               )

  )


(use-package
  undo-tree
  :ensure t
  ;; :config
  ;; (progn
  ;;   (unbind-key "C-_" undo-tree-map)
  ;;  )
  :init
  (progn
    (global-undo-tree-mode)
  )
  )

(use-package
  git-gutter
  :ensure t
  :init
  (progn
;; git-gutter
(global-git-gutter-mode +1)
  )
  )



(use-package
  flycheck
  :ensure t
  :init
  (progn
    (global-flycheck-mode)
    (setq flycheck-highlighting-mode 'lines)
    (setq flycheck-javascript-eslint-executable "~/node_modules/.bin/eslint")
    (flycheck-add-mode 'javascript-eslint 'web-mode)
    (flycheck-add-mode 'javascript-eslint 'rjsx-mode)
    (flycheck-add-mode 'javascript-eslint 'js2-mode)

    ;; (flycheck-locate-config-file-home ".eslintrc" 'javascript-eslint)

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

;; http://codewinds.com/blog/2015-04-02-emacs-flycheck-eslint-jsx.html
;; npm install -g eslint babel-eslint eslint-plugin-react
;; npm install -g jslint

;; turn on flychecking globally
;; (add-hook 'after-init-hook #'global-flycheck-mode)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
      '(javascript-jshint)))
;; use eslint with web-mode for jsx files
;; (flycheck-add-mode 'javascript-eslint 'web-mode)
;; (flycheck-add-mode 'javascript-eslint 'js2-mode)
;; http://codewinds.com/blog/2015-04-02-emacs-flycheck-eslint-jsx.html


;; https://github.com/mooz/js2-mode/issues/292


(defun setup-js2-mode ()
  (define-key js2-mode-map (kbd "C-c i") 'js-import-path)
  (define-key js2-mode-map (kbd "C-c C-f") 'sgml-skip-tag-forward)
  (define-key js2-mode-map (kbd "C-c C-b") 'sgml-skip-tag-backward)
  (flycheck-select-checker 'javascript-eslint)
  (define-key js2-mode-map (kbd "M-.") nil)



  (flycheck-mode))


(add-hook 'js2-mode-hook #'setup-js2-mode)
(add-hook 'rjsx-mode-hook #'setup-js2-mode)



  )
)

(use-package
  js2-mode
  :ensure t
  :init
  (progn


(add-to-list 'auto-mode-alist '("\\.js$" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.tsx$" . rjsx-mode))

(setq-default js2-indent-level 2)

(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)
(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)

;; Disable JSCS linting (optional but if you're using ESLint you probably don't
;; need this).
(let ((checkers (get 'javascript-eslint 'flycheck-next-checkers)))
  (put 'javascript-eslint 'flycheck-next-checkers
     (remove '(warning . javascript-jscs) checkers)))

  )
  )


 (use-package
     dash
   :ensure t
   :init
   (progn
  )
   )

 (use-package
   rjsx-mode
   :ensure t
   :init
   (progn
  )
   )

 (use-package
     bash-completion
   :ensure t
   :init
   (progn
 (bash-completion-setup)
  )
   )


 (use-package
     auto-complete
   :ensure t
   :init
   (progn
(global-auto-complete-mode t)
(add-to-list 'ac-modes 'less-css-mode)

  )
   )

 (use-package
smartscan
   :ensure t
   :init
   (progn
(smartscan-mode 1)

  )
   )

 (use-package
wgrep
   :ensure t
   :init
   (progn

  )
   )
 (use-package
wgrep-helm
   :ensure t
   :init
   (progn

  )
   )

;;  (use-package
;; projectile
;;    :ensure t
;;    :init
;;    (progn
;; (projectile-global-mode)
;; (setq projectile-completion-system 'helm)
;; (setq projectile-switch-project-action 'helm-projectile)

;;    )
;; )

;;  (use-package
;; helm-projectile
;;    :ensure t
;;    :init
;;    (progn
;; (helm-projectile-on)
;;    )
;; )



 (use-package
virtualenvwrapper
   :ensure t
   :init
(progn


(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support
(setq venv-location "~/virtualenvs/")

  )
   )


(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support
(setq venv-location "~/virtualenvs/")



(global-set-key (kbd "C-M-]") 'sp-backward-unwrap-sexp)
(global-set-key (kbd "C-M-[") 'sp-unwrap-sexp)


;; c-x 4 b to duplicate

  ;; https://www.emacswiki.org/emacs/TransposeWindows
(defun transpose-windows (arg)
  "Transpose the buffers shown in two windows."
  (interactive "p")
  (let ((selector (if (>= arg 0) 'next-window 'previous-window)))
  (while (/= arg 0)
    (let ((this-win (window-buffer))
      (next-win (window-buffer (funcall selector))))
    (set-window-buffer (selected-window) next-win)
    (set-window-buffer (funcall selector) this-win)
    ;; (select-window (funcall selector)))
    (select-window (selected-window)))
    (setq arg (if (plusp arg) (1- arg) (1+ arg))))))

(global-set-key (kbd "C-c s") 'transpose-windows)

(defun duplicate-windows (arg)
  "duplicate the buffers shown in current windows."
  (interactive "p")
  (let ((selector (if (>= arg 0) 'next-window 'previous-window)))
  (while (/= arg 0)
    (let ((this-win (window-buffer))
      (next-win (window-buffer (funcall selector))))
;;    (set-window-buffer (selected-window) next-win)
    (set-window-buffer (funcall selector) this-win)
    ;; (select-window (funcall selector)))
    (select-window (selected-window)))
    (setq arg (if (plusp arg) (1- arg) (1+ arg))))))

(global-set-key (kbd "C-c d") 'duplicate-windows)

(setq global-mark-ring-max 30)

;; Window switching. (C-x o goes to the next window)
(global-set-key (kbd "C-x O") (lambda ()
                (interactive)
                (other-window -1))) ;; back one
(global-set-key (kbd "C-x C-o") (lambda ()
                  (interactive)
                  (other-window 2))) ;; forward two


;; (mapc #'package-install my-package-list)


(defun filename ()
  "Copy the full path of the current buffer."
  (interactive)
  (kill-new (buffer-file-name (window-buffer (minibuffer-selected-window)))))

(global-set-key (kbd "C-c f") 'filename)



;; php


(autoload 'geben "geben" "DBGp protocol frontend, a script debugger" t)

;; org
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-startup-folded nil)

 (use-package
  org
  :ensure t
  :bind* (
         :map org-mode-map
              ("C-c C-y" . org-todo)
              )
   :init
   (progn
     (setq org-todo-keywords
           '((sequence "TODO" "|" "DONE")))
     (setq org-agenda-files '("~/org"))
     (global-set-key (kbd "C-c c") 'org-capture)
     (setq org-default-notes-file "~/org/todo.org")
     (setq org-refile-targets '((org-agenda-files :maxlevel . 3)))
     (add-hook 'org-mode-hook 'org-indent-mode)
     (add-to-list 'org-structure-template-alist '("python" . "src python"))
     (add-to-list 'org-structure-template-alist '("bash" . "src bash"))

     ;; http://www.howardism.org/Technical/Emacs/literate-programming-tutorial.html
     (setq org-confirm-babel-evaluate nil
      org-src-fontify-natively t
      org-src-tab-acts-natively t)
     )
   )

;; dired-x


;; projectile

(setq-default indent-tabs-mode nil)

(setq tramp-default-method "ssh")
(windmove-default-keybindings)

;; (require 'ethan-wspace)
;; (global-ethan-wspace-mode 1)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))


;; (require 'eclim)
;; (setq eclimd-autostart t)

(defun python-add-breakpoint ()
  (interactive)
  (newline-and-indent)
  (insert "import pdb; pdb.set_trace()")
  (highlight-lines-matching-regexp "^[ ]*import pdb; pdb.set_trace()"))

(add-hook 'python-mode-hook
      (lambda () (define-key python-mode-map (kbd "C-c C-u") 'python-add-breakpoint))
      )

(defun my-java-mode-hook ()
  (lambda ()
    ;; (eclim-mode t)
    (global-unset-key (kbd "C-M-o"))
    (global-set-key java-mode-map (kbd "C-M-o") 'eclim-java-import-organize))
  )

(add-hook 'java-mode-hook 'my-java-mode-hook)
(setq eclimd-executable "/Applications/Eclipse.app/Contents/Eclipse/eclimd")

(setq mode-require-final-newline nil)

;; https://emacs.stackexchange.com/a/24572/12031
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "--simple-prompt -i")

(when (executable-find "ipython")
  (setq python-shell-interpreter "ipython"))

;; (require 'ob-ipython)

(use-package
  es-mode
  :ensure t
  :init
  (progn
    )
  )


(use-package jupyter :ensure t)


(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   ;; (ipython . t)
   (emacs-lisp . t)
   ;; (julia . t)
   (python . t)
   (elasticsearch . t)
   (shell . t)
   ;; other languages..
   (jupyter . t)                        ;jupyter should be added as the last element when loading languages since it depends on the values of variables such as org-src-lang-modes and org-babel-tangle-lang-exts
   ))

(show-paren-mode 1)
(setq blink-matching-delay 0.3)

;; https://apple.stackexchange.com/a/127082
(defun pbcopy ()
  (interactive)
  (call-process-region (point) (mark) "pbcopy")
  (setq deactivate-mark t))

(defun pbpaste ()
  (interactive)
  (call-process-region (point) (if mark-active (mark) (point)) "pbpaste" t t))

(defun pbcut ()
  (interactive)
  (pbcopy)
  (delete-region (region-beginning) (region-end)))



(use-package exec-path-from-shell
  :ensure t
  :custom
  (exec-path-from-shell-check-startup-files nil)
  :config
  (push "HISTFILE" exec-path-from-shell-variables)
  (exec-path-from-shell-initialize))

(use-package projectile :ensure t)
(use-package treemacs :ensure t)
(use-package yasnippet :ensure t)
;; (use-package lsp-mode :ensure t)
(use-package hydra :ensure t)
;; (use-package company-lsp :ensure t)
;; (use-package lsp-ui :ensure t)
;; (use-package lsp-java :ensure t :after lsp
;;   :config (add-hook 'java-mode-hook 'lsp))

;; (use-package dap-mode
;;   :ensure t :after lsp-mode
;;   :config
;;   (dap-mode t)
;;   (dap-ui-mode t))

;; (use-package dap-java :after (lsp-java))
;; (use-package lsp-java-treemacs :after (treemacs))

;; (require 'lsp-java-boot)

;; to enable the lenses
;; (add-hook 'lsp-mode-hook #'lsp-lens-mode)
;; (add-hook 'java-mode-hook #'lsp-java-boot-lens-mode)
;; (dap-mode 1)
;; (dap-ui-mode 1)
;; (require 'dap-lldb)

(use-package
   jedi
   :ensure t
   :init
   (progn
     (add-hook 'python-mode-hook 'jedi:setup)
     (setq jedi:complete-on-dot t)
   )
)



(use-package helm-ag
  :ensure t
  :config
  (setq helm-ag-insert-at-point nil)

  )


(use-package helm-projectile
  :ensure t
  :config

   ;; (defun my-helm-grep-do-git-grep (arg)
   ;; (interactive "P")
   ;;   (setq helm-ag-insert-at-point nil)
   ;;   (helm-projectile-ag arg)
   ;;   )
   ;; (global-set-key (kbd "C-c g") 'my-helm-grep-do-git-grep)

   ;; (defun my-helm-grep-do-git-grep-at-point (arg)
   ;; (interactive "P")
   ;;   (setq helm-ag-insert-at-point 'symbol)
   ;;   (helm-projectile-ag arg)
   ;;   )
   ;; (global-set-key (kbd "C-c k") 'my-helm-grep-do-git-grep-at-point)
   (setq helm-ag-command-option " -U" )

   (setq projectile-use-git-grep t)

  )

(setq load-prefer-newer t)
(set-fringe-mode 0)


(defun camdez/show-buffer-file-name ()
  "Show the full path to the current file in the minibuffer."
  (interactive)
  (let ((file-name (buffer-file-name)))
    (if file-name
        (progn
          (message file-name)
          (kill-new file-name))
      (error "Buffer not visiting a file"))))


(global-set-key (kbd "C-h h") (lambda ()
                (interactive)
                (camdez/show-buffer-file-name))) ;;




(use-package ox-ipynb
  :load-path "site-lisp/ox-ipynb/")


(use-package jupyter :ensure t)

;; (use-package xclip
;;   :ensure t
;;   :config
;;   (setq helm-ag-insert-at-point nil)
;;   (xclip-mode 1)
;;   )

;; (setq x-select-enable-clipboard t)
;; (setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

(provide 'init)
