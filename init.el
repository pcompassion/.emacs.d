
;;(setq spacemacs-start-directory "~/spacemacs/.emacs.d/")
;;(let ((spacemacs-setting (concat spacemacs-start-directory "init.el")))
;;  (when (file-exists-p spacemacs-setting)
;;    (load-file spacemacs-setting))
;;  )



(setq mac-option-modifier 'meta
      mac-command-modifier 'super
      )


;; /Applications/Emacs.app/Contents/MacOS/Emacs --daemon

;; ;; tutorials
;; ;; http://stackoverflow.com/a/1242760/433570
;; ;; <--tutorials


(require 'package)
(setq package-enable-at-startup nil)
(setq package-check-signature nil)    ;http://stackoverflow.com/a/26110978/433570

;; http://emacs.stackexchange.com/a/2989/12031
(setq package-archives
      '(
        ("melpa" . "https://melpa.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ;; ("org" . "https://orgmode.org/elpa/")
        ("elpa" . "https://elpa.gnu.org/packages/")

        )
      ;; package-archive-priorities
      ;; '(("MELPA Stable" . 7)
      ;;   ("GNU ELPA"     . 5)
      ;;   ("MELPA"        . 10))
      )



;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)


;; http://stackoverflow.com/a/10093312/433570

;; list the packages you want
;; (setq package-list '(package1 package2))
;; fetch the list of packages available
;; (unless package-archive-contents
;;     (package-refresh-contents))


;; for bookmark+
(use-package quelpa
  :ensure t
  :init
  (setq quelpa-self-upgrade-p nil))

(use-package quelpa-use-package
  :ensure t
  :after (quelpa)
  :config
  (quelpa-use-package-activate-advice))



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


;; (use-package elpy
;;   ;; :straight t
;;   :bind
;;   (:map elpy-mode-map
;;         ("C-M-n" . elpy-nav-forward-block)
;;         ("C-M-p" . elpy-nav-backward-block))
;;   :hook ((elpy-mode . flycheck-mode)
;;           (elpy-mode . (lambda ()
;;                          (set (make-local-variable 'company-backends)
;;                               '((elpy-company-backend :with company-yasnippet)))))
;; 				 )
;;   :init
;;   (elpy-enable)
;;   :config
;;   (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;; 																				; fix for MacOS, see https://github.com/jorgenschaefer/elpy/issues/1550
;;   (setq elpy-shell-echo-output nil)
;;   (setq elpy-rpc-python-command "python3")
;;   (setq elpy-rpc-timeout 2)
;;  )

  (setq-default indent-tabs-mode nil
              tab-stop-list    ()
              tab-width        2)



(use-package
  magit
  :ensure t
  :bind
  ("C-x g" . magit-status)
  ("C-x v k" . magit-log-buffer-file)
  )

;; magit-find-file
;; Magit rules!
;; (global-set-key (kbd "C-x g") 'magit-status)
;; (global-set-key (kbd "C-x v k") 'magit-log-buffer-file)

;; magit-find-file




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
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(byte-compile-warnings nil)
 '(custom-enabled-themes nil)
 '(dired-listing-switches "-alFh")
 '(eclim-executable "/Applications/Eclipse.app/Contents/Eclipse/eclim")
 '(elpy-modules
   '(elpy-module-company elpy-module-eldoc elpy-module-pyvenv elpy-module-highlight-indentation elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults))
 '(es-always-pretty-print t)
 '(flycheck-checker-error-threshold 1000)
 '(flycheck-flake8-maximum-line-length 140)
 '(geben-dbgp-default-port 10011)
 '(grep-find-ignored-directories
   '("SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "migrations" "bower_components" "node_modules" "bower_components"))
 '(grep-find-ignored-files
   '("*pbxproj" "*ignore" ".#*" "*.o" "*~" "*.bin" "*.lbin" "*.so" "*.a" "*.ln" "*.blg" "*.bbl" "*.elc" "*.lof" "*.glo" "*.idx" "*.lot" "*.fmt" "*.tfm" "*.class" "*.fas" "*.lib" "*.mem" "*.x86f" "*.sparcf" "*.dfsl" "*.pfsl" "*.d64fsl" "*.p64fsl" "*.lx64fsl" "*.lx32fsl" "*.dx64fsl" "*.dx32fsl" "*.fx64fsl" "*.fx32fsl" "*.sx64fsl" "*.sx32fsl" "*.wx64fsl" "*.wx32fsl" "*.fasl" "*.ufsl" "*.fsl" "*.dxl" "*.lo" "*.la" "*.gmo" "*.mo" "*.toc" "*.aux" "*.cp" "*.fn" "*.ky" "*.pg" "*.tp" "*.vr" "*.cps" "*.fns" "*.kys" "*.pgs" "*.tps" "*.vrs" "*.pyc" "*.pyo" "uploadDSYM" "jquery.js" "plugins.js"))
 '(helm-ff-transformer-show-only-basename nil)
 '(helm-grep-file-path-style 'relative)
 '(helm-grep-ignored-directories
   '("SCCS/" "RCS/" "CVS/" "MCVS/" ".svn/" ".git/" ".hg/" ".bzr/" "_MTN/" "_darcs/" "{arch}/" ".gvfs/" "SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "migrations" "bower_components" "node_modules" "bower_components" "momsite/static" "js-modules/"))
 '(helm-grep-ignored-files
   '("*/djangojs/init-web.js" ".#*" "*.o" "*~" "*.bin" "*.lbin" "*.so" "*.a" "*.ln" "*.blg" "*.bbl" "*.elc" "*.lof" "*.glo" "*.idx" "*.lot" "*.fmt" "*.tfm" "*.class" "*.fas" "*.lib" "*.mem" "*.x86f" "*.sparcf" "*.dfsl" "*.pfsl" "*.d64fsl" "*.p64fsl" "*.lx64fsl" "*.lx32fsl" "*.dx64fsl" "*.dx32fsl" "*.fx64fsl" "*.fx32fsl" "*.sx64fsl" "*.sx32fsl" "*.wx64fsl" "*.wx32fsl" "*.fasl" "*.ufsl" "*.fsl" "*.dxl" "*.lo" "*.la" "*.gmo" "*.mo" "*.toc" "*.aux" "*.cp" "*.fn" "*.ky" "*.pg" "*.tp" "*.vr" "*.cps" "*.fns" "*.kys" "*.pgs" "*.tps" "*.vrs" "*.pyc" "*.pyo" ".#*" "*.o" "*~" "*.bin" "*.lbin" "*.so" "*.a" "*.ln" "*.blg" "*.bbl" "*.elc" "*.lof" "*.glo" "*.idx" "*.lot" "*.fmt" "*.tfm" "*.class" "*.fas" "*.lib" "*.mem" "*.x86f" "*.sparcf" "*.dfsl" "*.pfsl" "*.d64fsl" "*.p64fsl" "*.lx64fsl" "*.lx32fsl" "*.dx64fsl" "*.dx32fsl" "*.fx64fsl" "*.fx32fsl" "*.sx64fsl" "*.sx32fsl" "*.wx64fsl" "*.wx32fsl" "*.fasl" "*.ufsl" "*.fsl" "*.dxl" "*.lo" "*.la" "*.gmo" "*.mo" "*.toc" "*.aux" "*.cp" "*.fn" "*.ky" "*.pg" "*.tp" "*.vr" "*.cps" "*.fns" "*.kys" "*.pgs" "*.tps" "*.vrs" "*.pyc" "*.pyo" "uploadDSYM" "jquery.js" "plugins.js" "djangojs/init.js"))
 '(helm-ls-git-show-abs-or-relative 'relative)
 '(helm-split-window-default-side 'right)
 '(js2-strict-trailing-comma-warning nil)
 '(js3-auto-indent-p t)
 '(js3-enter-indents-newline t)
 '(js3-indent-on-enter-key t)
 '(magit-log-arguments '("--graph" "--decorate" "--follow"))
 '(network-security-level 'medium)
 '(org-agenda-files
   '("/Users/littlehome/notes/agendas" "/Users/littlehome/notes/journals/20230813"))
 '(org-link-file-path-type 'relative)
 '(org-startup-truncated nil)
 '(package-selected-packages
   '(bookmark+ quelpa-use-package quelpa rg helm-rg python-black leetcode org-gcal calfw-ical calfw-org calfw calfw-cal org-journal org-roam spacemacs-themes transpose-frame doom-themes nordic-night-theme nordless-theme nord-theme undo-tree eglot xref company-box company which-key go-mode logview csv-mode pyvenv xcode-mode guide-key free-keys jupyter julia-mode julia-repl typescript-mode helm xclip tern-django xref-js2 helm-git helm-git-files docker docker-compose-mode dockerfile-mode magit yasnippet vcl-mode logstash-conf helm-lsp lsp-ui company-lsp projectile lsp-java es-mode ng2-mode org tern anaconda-mode wgrep wgrep-helm prettier-js rjsx-mode ethan-wspace rjsx exec-path-from-shell swift-mode ivy swift3-mode sql-indent git-blamed auto-complete helm-projectile flx-ido geben cl-lib cl-lib-highlight php-mode ztree xcscope web-mode web-beautify visible-mark virtualenvwrapper virtualenv use-package test-simple sudo-ext smartscan smartparens redo+ python-mode py-import-check pg nodejs-repl mo-git-blame magit-gitflow magit-gh-pulls magit-find-file magit-filenotify loc-changes load-relative less-css-mode json-mode jinja2-mode imenu+ image-dired+ image+ iedit idomenu highlight helm-swoop helm-ls-hg helm-ls-git helm-hatena-bookmark helm-git-grep helm-flycheck helm-descbinds helm-dash helm-backup helm-ag handlebars-sgml-mode gradle-mode git-gutter git-gutter+ git-blame fuzzy find-file-in-repository f expand-region evil-leader elpy dummy-h-mode color-theme-solarized color-theme-sanityinc-solarized buffer-move bash-completion back-button auto-compile anything-git-grep ag))
 '(py-keep-windows-configuration 'force)
 '(request-curl-options '("-k"))
 '(safe-local-variable-values
   '((encoding . utf-8)
     (python-shell-completion-string-code . "';'.join(get_ipython().Completer.all_completions('''%s'''))\12")
     (python-shell-completion-module-string-code . "';'.join(module_completion('''%s'''))\12")
     (python-shell-completion-setup-code . "from IPython.core.completerlib import module_completion")
     (python-shell-interpreter-args . "/home/eugenekim/Documents/zibann/momsite/manage.py shell")))
 '(sp-autoinsert-pair nil)
 '(warning-suppress-log-types '((comp) (comp)))
 '(warning-suppress-types '((comp))))


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


(setq compilation-scroll-output t)



(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;;(setq grep-find-ignored-files (cl-union grep-find-ignored-files '("*pbxproj" "*ignore")))

;; https://groups.google.com/forum/#!topic/gnu.emacs.help/ZGu2MNkJGrI
;; (defadvice terminal-init-xterm (after map-S-up-escape-sequence activate)
;;   (define-key input-decode-map "\e[1;31" (kbd "C-;"))
;;   ;; (define-key input-decode-map "\e[1;32" (kbd "C-="))
;;   (define-key input-decode-map "\e[1;34" (kbd "C-`"))
;;   (define-key input-decode-map "\e[1;35" (kbd "C-<left>"))
;;   (define-key input-decode-map "\e[1;36" (kbd "C-<right>"))


;;   (define-key input-decode-map "\e[1;39" (kbd "C-M-;"))
;;   (define-key input-decode-map "\e[1;41" (kbd "C-M-\\"))
;;   (define-key input-decode-map "\e[1;42" (kbd "C-M-SPC"))
;;   (define-key input-decode-map "\e[1;43" (kbd "C-M-["))
;;   (define-key input-decode-map "\e[1;45" (kbd "M-S-<RET>"))

;;   (define-key input-decode-map "\e[1;46" (kbd "C-S-a"))
;;   (define-key input-decode-map "\e[1;47" (kbd "C-S-d"))
;;   (define-key input-decode-map "\e[1;3A" (kbd "M-S-<RET>"))
;;   ;; (define-key input-decode-map "\e[1;3A" [S-up])

;;   )


;; (define-key input-decode-map "\e[1;31" (kbd "C-;"))
;; ;; (define-key input-decode-map "\e[1;32" (kbd "C-="))
;; (define-key input-decode-map "\e[1;33" (kbd "C-:"))
;; (define-key input-decode-map "\e[1;34" (kbd "C-`"))
;; (define-key input-decode-map "\e[1;35" (kbd "C-<left>"))
;; (define-key input-decode-map "\e[1;36" (kbd "C-<right>"))
;; (define-key input-decode-map "\e[1;37" (kbd "C-."))
;; (define-key input-decode-map "\e[1;38" (kbd "C-,"))

;; (define-key input-decode-map "\e[1;39" (kbd "C-M-;"))
;; (define-key input-decode-map "\e[1;41" (kbd "C-M-\\"))
;; (define-key input-decode-map "\e[1;42" (kbd "C-M-SPC"))
;; (define-key input-decode-map "\e[1;43" (kbd "C-M-["))
;; (define-key input-decode-map "\e[1;45" (kbd "M-S-<RET>"))
;; (define-key input-decode-map "\e[1;46" (kbd "C-S-a"))
;; (define-key input-decode-map "\e[1;47" (kbd "C-S-d"))
;; (define-key input-decode-map "\e[1;3A" (kbd "M-S-<RET>"))



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
;; (add-hook 'python-mode-hook 'anaconda-mode)
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
          (lambda () (define-key python-mode-map (kbd "C-c C-w") 'python-add-breakpoint))
          )



;; (set-variable 'magit-emacsclient-executable "/usr/local/bin/emacsclient")
(set-variable 'magit-emacsclient-executable "/usr/local/bin/ec")

(eval-after-load "sql"
  '(load-library "sql-indent"))


(global-set-key (kbd "C-o") 'newline-and-indent)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "M-c") 'capitalize-word)
(global-set-key (kbd "C-M-;") 'comment-dwim) ;doesn't work in shell
(global-set-key (kbd "C-M-DEL") 'indent-region) ;doesn't work in shell


;; (global-set-key (kbd "C--") 'undo)
;; (global-set-key (kbd "C-=") 'redo)
(global-set-key (kbd "C-m") 'newline-and-indent)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "M-n") 'next-error)
(global-set-key (kbd "M-p") 'previous-error)
(global-set-key (kbd "C-c m m v") 'vc-git-grep)
(global-set-key (kbd "M-=") 'er/expand-region)
(global-set-key (kbd "C-h C-p") 'previous-buffer)
(global-set-key (kbd "C-h C-n") 'previous-buffer)

;; helm

(use-package
  helm-swoop
  :ensure t
  :config

  ;; Change the keybinds to whatever you like :)
  (global-set-key (kbd "M-i") 'helm-swoop)
  (global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
  (global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
  (global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)

  ;; When doing isearch, hand the word over to helm-swoop
  (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
  ;; From helm-swoop to helm-multi-swoop-all
  (define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)
  ;; When doing evil-search, hand the word over to helm-swoop
  ;; (define-key evil-motion-state-map (kbd "M-i") 'helm-swoop-from-evil-search)

  ;; Instead of helm-multi-swoop-all, you can also use helm-multi-swoop-current-mode
  (define-key helm-swoop-map (kbd "M-m") 'helm-multi-swoop-current-mode-from-helm-swoop)

  ;; Move up and down like isearch
  (define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
  (define-key helm-swoop-map (kbd "C-s") 'helm-next-line)
  (define-key helm-multi-swoop-map (kbd "C-r") 'helm-previous-line)
  (define-key helm-multi-swoop-map (kbd "C-s") 'helm-next-line)

  ;; Save buffer when helm-multi-swoop-edit complete
  (setq helm-multi-swoop-edit-save t)

  ;; If this value is t, split window inside the current window
  (setq helm-swoop-split-with-multiple-windows nil)

  ;; Split direcion. 'split-window-vertically or 'split-window-horizontally
  (setq helm-swoop-split-direction 'split-window-vertically)

  ;; If nil, you can slightly boost invoke speed in exchange for text color
  (setq helm-swoop-speed-or-color nil)
  ;; ;; Go to the opposite side of line from the end or beginning of line
  (setq helm-swoop-move-to-line-cycle t)

  ;; Optional face for line numbers
  ;; Face name is `helm-swoop-line-number-face`
  (setq helm-swoop-use-line-number-face t)

  ;; If you prefer fuzzy matching
  (setq helm-swoop-use-fuzzy-match t)
  )

(use-package
  prettier-js
  :ensure t
  )


(global-unset-key (kbd "C-x c"))

(use-package helm
  :ensure t
  :diminish helm-mode


  :custom
  (helm-boring-file-regexp-list
   '("\\` " "\\*helm" "\\*helm-mode" "\\*Echo Area" "\\*tramp" "\\*Minibuf" "\\*epc" "\\.git$" "\\.hg$" "\\.svn$" "\\.CVS$" "\\._darcs$" "\\.la$" "\\.o$" "~$" "bower_components/*" "static/saleor/js/*" "\\.min\\.js$"  "\\.min\\.css$" "jquery\\.js" "js-modules/") )
  (helm-ff-skip-boring-files t)
  (helm-buffer-max-length 40)
  (helm-ff-history-max-length 500)

  ;; From https://gist.github.com/antifuchs/9238468
  ( helm-idle-delay 0.0 ; update fast sources immediately (doesn't).
    helm-input-idle-delay 0.01  ; this actually updates things
                                        ; reeeelatively quickly.
    helm-yas-display-key-on-candidate t
    helm-quick-update t
    helm-M-x-requires-pattern nil
    helm-ff-skip-boring-files t)

  ( helm-move-to-line-cycle-in-source nil)
  ( helm-grep-truncate-lines nil)
  ( helm-buffers-truncate-lines nil)
  ( helm-ff-newfile-prompt-p nil)

  (helm-split-window-in-side-p nil); open helm buffer inside current window, not occupy whole other window
  (helm-ff-search-library-in-sexp        t) ; search for library in `require' and `declare-function' sexp.
  (helm-scroll-amount                    8) ; scroll 8 lines other window using M-<next>/M-<prior>
  (helm-ff-file-name-history-use-recentf t)
  (helm-candidate-number-limit 9999)
  (helm-echo-input-in-header-line t)
  (helm-M-x-fuzzy-match t)
  (helm-buffers-fuzzy-matching t)
  (helm-recentf-fuzzy-match    t)
  (helm-ag-insert-at-point 'symbol)
  (helm-follow-mode-persistent  t)
  (helm-ag-use-agignore t)
  :init
  (progn
    (require 'helm)

    (helm-define-key-with-subkeys global-map
      (kbd "C-c n") ?n 'helm-cycle-resume
      )

    ;; (defun my-helm-grep-do-git-grep (not-all)
    ;;   (interactive "P")
    ;;   (helm-grep-git-1 default-directory (null not-all)))

    ;; (global-set-key (kbd "C-c g") 'my-helm-grep-do-git-grep)


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

    (helm-mode))
  :bind (
         ("C-c h" . helm-command-prefix)
         ("C-h a" . helm-apropos)
         ;; ("C-c g" . helm-projectile-rg)
         ("C-c g" . helm-projectile-ag)
         ;; ("C-c g" . helm-projectile-grep)
         ("C-h b" . helm-descbinds)
         ("C-x C-b" . helm-buffers-list)
         ("C-x b" . helm-mini)
         ("C-M-y" . helm-show-kill-ring)
         ("M-x" . helm-M-x)
         ("C-c h r" . helm-register)
         ("C-c h x" . helm-regexp)
         ("C-c C-h" . helm-resume)

         ;; ("C-c h o" . helm-occur)
         ;; ("C-c h w" . helm-swoop)
         ;; ("C-c h W" . helm-multi-swoop-all)
         ;; ("C-c h y" . helm-yas-complete)
         ;; ("C-c h Y" . helm-yas-create-snippet-on-region)
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
         ;; :map helm-occur-mode-map
         ;; (
         :map minibuffer-local-map
         ("C-c C-l" . helm-minibuffer-history)

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

;; (use-package
;;   ag
;;   :ensure t
;; :bind (
;;        ;; ("C-c l" . ag-project)
;;        )
;; )

(use-package
  anaconda-mode
  :ensure t
  :init
  (setq anaconda-mode-localhost-address "localhost")
  :config
  (progn
    (unbind-key "M-." anaconda-mode-map)
    (unbind-key "M-," anaconda-mode-map)
    (unbind-key "M-?" anaconda-mode-map)
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


  )


;; (use-package
;;   undo-tree
;;   :ensure t
;;   ;; :config
;;   ;; (progn
;;   ;;   (unbind-key "C-_" undo-tree-map)
;;   ;;  )
;;   :init
;;   (progn
;;     (global-undo-tree-mode)
;;     )
;;   )

(use-package
  git-gutter
  :ensure t
  :init
  (progn
    ;; git-gutter
    ;;(global-git-gutter-mode +1)
    )
  )


;; (use-package
;;   flycheck
;;   :ensure t
;;   :init
;;   (progn
;;     (global-flycheck-mode)
;;     (setq flycheck-highlighting-mode 'lines)
;;     (setq flycheck-javascript-eslint-executable "~/node_modules/.bin/eslint")
;;     (flycheck-add-mode 'javascript-eslint 'web-mode)
;;     (flycheck-add-mode 'javascript-eslint 'rjsx-mode)
;;     (flycheck-add-mode 'javascript-eslint 'js2-mode)
;;     ;; (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;     ;; (add-hook 'elpy-mode-hook 'flycheck-mode)
;;     ;; (flycheck-locate-config-file-home ".eslintrc" 'javascript-eslint)

;;     ;; (flycheck-define-checker javascript-jslint-reporter
;;     ;;   "A JavaScript syntax and style checker based on JSLint Reporter.

;;     ;; See URL `https://github.com/FND/jslint-reporter'."
;;     ;;   :command ("~/.emacs.d/jslint-reporter/jslint-reporter" source)
;;     ;;   :error-patterns
;;     ;;   ((error line-start (1+ nonl) ":" line ":" column ":" (message) line-end))
;;     ;;   :modes (js-mode js2-mode js3-mode))
;;     ;; (add-hook 'js-mode-hook (lambda ()
;;     ;;                           (flycheck-select-checker 'javascript-jslint-reporter)
;;     ;;                           (flycheck-mode)))


;;     ;; (setq mac-option-modifier 'super) ; sets the Option key to Super

;;     ;; http://codewinds.com/blog/2015-04-02-emacs-flycheck-eslint-jsx.html
;;     ;; npm install -g eslint babel-eslint eslint-plugin-react
;;     ;; npm install -g jslint

;;     ;; turn on flychecking globally
;;     ;; (add-hook 'after-init-hook #'global-flycheck-mode)

;;     ;; disable jshint since we prefer eslint checking
;;     (setq-default flycheck-disabled-checkers
;;                   (append flycheck-disabled-checkers
;;                           '(javascript-jshint)))
;;     ;; use eslint with web-mode for jsx files
;;     ;; (flycheck-add-mode 'javascript-eslint 'web-mode)
;;     ;; (flycheck-add-mode 'javascript-eslint 'js2-mode)
;;     ;; http://codewinds.com/blog/2015-04-02-emacs-flycheck-eslint-jsx.html


;;     ;; https://github.com/mooz/js2-mode/issues/292


;;     (defun setup-js2-mode ()
;;       (define-key js2-mode-map (kbd "C-c i") 'js-import-path)
;;       (define-key js2-mode-map (kbd "C-c C-f") 'sgml-skip-tag-forward)
;;       (define-key js2-mode-map (kbd "C-c C-b") 'sgml-skip-tag-backward)
;;       (flycheck-select-checker 'javascript-eslint)
;;       (define-key js2-mode-map (kbd "M-.") nil)



;;       (flycheck-mode))


;;     (add-hook 'js2-mode-hook #'setup-js2-mode)
;;     (add-hook 'rjsx-mode-hook #'setup-js2-mode)



;;     )
;;   )

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

(setq venv-location "~/virtualenvs/")   ;need it for org


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


;; (defadvice virtualenv-activate (after virtual-pdb)
;;   (custom-set-variables
;;      '(gud-pdb-command-name
;;         (concat venv-current-name "/bin/pdb" ))))

;; (ad-activate 'virtualenv-activate)

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


;; dired-x


;; projectile


(setq tramp-default-method "ssh")
(windmove-default-keybindings)

;; (require 'ethan-wspace)
;; (global-ethan-wspace-mode 1)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))


;; (require 'eclim)
;; (setq eclimd-autostart t)


(defun my-java-mode-hook ()
  (lambda ()
    ;; (eclim-mode t)
    (global-unset-key (kbd "C-M-o"))
    (global-set-key java-mode-map (kbd "C-M-o") 'eclim-java-import-organize))
  )

(add-hook 'java-mode-hook 'my-java-mode-hook)
(setq eclimd-executable "/Applications/Eclipse.app/Contents/Eclipse/eclimd")

(setq mode-require-final-newline nil)

(setq py-use-current-dir-when-execute-p t)


;; (use-package
;;   ob-ipython
;;   :ensure t
;;   :init
;;   (progn
;;     )
;;   )


(use-package
  es-mode
  :ensure t
  :init
  (progn
    )
  )




(use-package jupyter :ensure t)



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

;; (use-package rg
;;   :ensure t
;;   :init
;;     (rg-enable-default-bindings)
;;     )

;; (use-package helm-rg
;;   :ensure t
;;   )


(use-package projectile
  :ensure t
  :defer t
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ;; ("s-p" . projectile-command-map) ;; for mac
              ("C-c p" . projectile-command-map))
  )

(add-to-list 'image-types 'svg)
(use-package treemacs :ensure t)
(use-package yasnippet :ensure t)
;; (use-package lsp-mode :ensure t)
(use-package hydra :ensure t)
;; (use-package company-lsp :ensure t)
;; (use-package lsp-ui :ensure t)
;; (use-package lsp-java :ensure t :after lsp
;;   :config (add-hook 'java-mode-hook 'lsp))


;; (use-package dap-java :after (lsp-java))
;; (use-package lsp-java-treemacs :after (treemacs))

;; (require 'lsp-java-boot)

;; to enable the lenses
;; (add-hook 'lsp-mode-hook #'lsp-lens-mode)
;; (add-hook 'java-mode-hook #'lsp-java-boot-lens-mode)
;; (dap-mode 1)
;; (dap-ui-mode 1)
;; (require 'dap-lldb)

;; (use-package
;;   jedi
;;   :ensure t
;;   :init
;;   (progn
;;     (add-hook 'python-mode-hook 'jedi:setup)
;;     (setq jedi:complete-on-dot t)
;;     )
;;   )



(use-package helm-ag
  :ensure t
  :custom
  (helm-ag-use-grep-ignore-list t)

  )


(use-package helm-projectile
  :ensure t
  :after projectile
  :config

  ;; (setq helm-ag-command-option " -U" )
  (helm-projectile-on)
  (setq projectile-switch-project-action 'helm-projectile)
  (setq projectile-use-git-grep t)

  )

(setq load-prefer-newer t)
;;(set-fringe-mode 0)


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


(use-package jupyter
  :ensure t
  :init
  (progn
    (defun jupyter-repl-font-lock-override (_ignore beg end &optional verbose)
      `(jit-lock-bounds ,beg . ,end))

    (advice-add #'jupyter-repl-font-lock-fontify-region :override #'jupyter-repl-font-lock-override)
    ;; (advice-remove #'jupyter-repl-font-lock-fontify-region #'jupyter-repl-font-lock-override)
    )

  )

(use-package logstash-conf
  :ensure t
  )

(use-package docker-compose-mode
  :ensure t
  )

(use-package dockerfile-mode
  :ensure t
  )


;; (use-package python-black
;;   :ensure t
;;   :demand t
;;   :after python
;;   :hook (python-mode . python-black-on-save-mode-enable-dwim)
;;   )


;; (use-package xclip
;;   :ensure t
;;   :config
;;   (setq helm-ag-insert-at-point nil)
;;   (xclip-mode 1)
;;   )

;; (setq x-select-enable-clipboard t)
;; (setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
(use-package dap-mode
  :ensure t
  :custom
  (lsp-enable-dap-auto-configure nil)
  :config
  (dap-ui-mode 1)
  (dap-tooltip-mode 1)
  (require 'dap-python)
  )

(use-package python
  :defer t)


(use-package python-mode
  :ensure t

  :custom
  ;; NOTE: Set these if Python 3 is called "python3" on your system!
  (dap-python-executable "python3")
  (dap-python-debugger 'debugpy)
  (python-shell-interpreter "ipython")
  (python-shell-interpreter-args "-i --simple-prompt")

  :config
  (setq python-shell-virtualenv-root "~/virtualenvs")
  (setq py-force-py-shell-name-p t)
  (setq-default py-split-windows-on-execute-function 'split-window-horizontally)
  (setq-default py-keep-windows-configuration 'force)
  (setq gud-pdb-command-name "python -m pdb ")
  (add-hook 'python-mode-hook
            (lambda () (define-key python-mode-map (kbd "DEL") 'py-electric-backspace)))




  )

(use-package virtualenvwrapper
  :ensure t
  :config
  (venv-initialize-interactive-shells) ;; if you want interactive shell support
  (venv-initialize-eshell) ;; if you want eshell support
  (setq venv-location "~/virtualenvs/")
)

(use-package pyvenv
  :ensure t
  :config
  (pyvenv-mode t)

  ;; Set correct Python interpreter
  :init
  (progn
  (setq pyvenv-post-activate-hooks
        (list (lambda ()
                (setq py-shell-name (concat pyvenv-virtual-env "bin/python3"))
                (setq-default python-shell-interpreter (concat pyvenv-virtual-env "bin/ipython"))
                )))
  (setq pyvenv-post-deactivate-hooks
        (list (lambda ()
                (setq py-shell-name "python3"))))
  )
  )


(use-package elpy
  :ensure t
  :defer t
  :after python-mode
  :hook (elpy-mode . elpy-use-ipython)
  :config
  (advice-add 'python-mode :before 'elpy-enable)
  (setq eldoc-idle-delay 1)  ;; in second
  (add-hook 'elpy-mode-hook (lambda ()
                              (add-hook 'before-save-hook
                                        'elpy-black-fix-code nil t)))
  (remove-hook 'elpy-modules 'elpy-module-flymake)
  (add-to-list 'python-shell-completion-native-disabled-interpreters "ipython")

  :init
  (progn
    )
  )

(use-package eglot
  :ensure t
  :defer t
  :hook ((python-mode go-mode-hook) . eglot-ensure)
  :config
  (add-hook 'eglot-managed-mode-hook (lambda ()
                                       (remove-hook 'flymake-diagnostic-functions 'eglot-flymake-backend)
                                       ))
  :init
  (progn
    (global-set-key (kbd "M-\"") 'eglot-find-implementation)
    )
  )





;; https://go.googlesource.com/tools/+/refs/heads/master/gopls/doc/emacs.md#configuring-for-go-modules-in
(require 'project)

(defun project-find-go-module (dir)
  (when-let ((root (locate-dominating-file dir "go.mod")))
    (cons 'go-module root)))

(cl-defmethod project-root ((project (head go-module)))
  (cdr project))

(add-hook 'project-find-functions #'project-find-go-module)



;; (use-package lsp-mode
;;   :ensure t
;;   :init
;;   ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
;;   (setq lsp-keymap-prefix "C-c l")
;;   :config
;;   (define-key lsp-mode-map (kbd "C-c l") lsp-command-map)
;;   :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
;;          (python-mode . lsp)
;;          ;; if you want which-key integration
;;          (lsp-mode . lsp-enable-which-key-integration))
;;   :commands lsp)


(use-package company
  :ensure t
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :bind (:map company-active-map
              ("<tab>" . company-complete-selection))
  (:map lsp-mode-map
        ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

(use-package company-box
  :ensure t

  :hook (company-mode . company-box-mode))

;; optionally
;; (use-package lsp-ui
;;   :ensure t
;;   :commands lsp-ui-mode)
;; if you are helm user
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
;; (use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
;; (use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package undo-fu
  :ensure t
  :config
  ;; (global-unset-key (kbd "C-z"))
  (global-set-key (kbd "C--")   'undo-fu-only-undo)
  (global-set-key (kbd "C-=") 'undo-fu-only-redo))

;; (require 'dap-dlv-go)

(set-buffer-multibyte 't)

(add-hook 'term-exec-hook
          (function
           (lambda ()
             (set-process-coding-system 'utf-8-unix 'utf-8-unix))))

(defadvice ansi-term (after advise-ansi-term-coding-system)
  (set-process-coding-system 'utf-8-unix 'utf-8-unix))
(ad-activate 'ansi-term)

(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(setq-default pathname-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)

;; If you set set-mark-command-repeat-pop to non-nil, then immediately after you type C-u C-SPC, you can type C-SPC instead of C-u C-SPC to cycle through the mark ring. By default, set-mark-command-repeat-pop is nil.
(setq set-mark-command-repeat-pop t)

;; https://gist.github.com/gnachman/b4fb1e643e7e82a546bc9f86f30360e4

(require 'term/xterm)

;; org

(use-package org
  :ensure t
  :hook (org-mode . org-indent-mode)

  :bind* (
          :map org-mode-map
          ("C-c C-y" . org-todo)
          ("C-c l" . org-store-link)
          )

  :config
  (setq org-confirm-babel-evaluate nil)

  (defun my-func (orig-fun &rest args)
    (when (equal (car args) '(setq cursor-type nil))
      (setcar args '(setq cursor-type t)))
    (apply orig-fun args))

  (eval-after-load "org"
    '(advice-add 'org-eval-in-calendar :around #'my-func))

  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (emacs-lisp . t)
     (ipython . t)
     (python . t)
     (elasticsearch . t)
     (shell . t)
     ;; other languages..
     (jupyter . t)                        ;jupyter should be added as the last element when loading languages since it depends on the values of variables such as org-src-lang-modes and org-babel-tangle-lang-exts
     ))
  (add-to-list 'org-modules 'org-tempo t)

  (add-to-list 'org-structure-template-alist '("sh" . "src shell"))
  (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
  (add-to-list 'org-structure-template-alist '("py" . "src python"))

  :init
  (progn
    (setq org-todo-keywords

          '((
             sequence
             "Todo" ; doing later
             "Started(s)" ; doing now or soon
             "|"
             "Done(d)" ; done
             "Cancelled(c)" ; done
             )
            ;; (sequence
            ;;  "ToRead(t)" ; doing later
            ;;  "Reading(r)" ; doing now or soon
            ;;  "|"
            ;;  "Done(d)" ; done
            ;;  )
            ;; )
            ))
    (setq org-done-keywords '("Done" "Cancelled"))


    (setq org-agenda-files '("~/notes/agendas"))
    (setq org-default-notes-file "~/notes/agendas/notes.org")

    ;; ;; http://www.howardism.org/Technical/Emacs/literate-programming-tutorial.html
    ;; (setq org-confirm-babel-evaluate nil
    ;;       org-src-fontify-natively t
    ;;       org-src-tab-acts-natively t)
    ;; )
    (setq org-log-done t)
    (setq org-startup-folded nil)
    (setq org-use-fast-todo-selection 'nil)

    (setq org-refile-targets
          `(
            ;; ("~/notes/archives/tasks.org" :maxlevel . 1)

            (,(directory-files-recursively "~/notes/archives/" "^[[:ascii:]]*.org$") :maxlevel . 2)
            (org-agenda-files :maxlevel . 2)
            ))

    (setq org-refile-use-outline-path 'file)
    (setq org-outline-path-complete-in-steps nil)
    (setq org-refile-allow-creating-parent-nodes 'confirm)

    (advice-add 'org-refile :after 'org-save-all-org-buffers)



    ;; https://github.com/bastibe/org-journal
    (defun org-journal-find-location ()
      ;; Open today's journal, but specify a non-nil prefix argument in order to
      ;; inhibit inserting the heading; org-capture will insert the heading.
      (org-journal-new-entry t)
      (unless (eq org-journal-file-type 'daily)
        (org-narrow-to-subtree))
      (goto-char (point-max)))


    (setq org-capture-templates
          `(("t" "Tasks / Projects")
            ("tt" "Task" entry (file+headline "~/notes/agendas/inbox.org" "inbox")
             "* Todo %?\n  %U\n  %a\n  %i" :empty-lines 1)
            ("c" "Tickler")
            ("cc" "Tickler" entry
             (file+headline "~/notes/agendas/tickler.org" "Tickler")
             "* %i%? \n %U")
            ("j" "Journal entry" plain (function org-journal-find-location)
             "** %(format-time-string org-journal-time-format)%^{Title}\n%i%?"
             :jump-to-captured t :immediate-finish t)
            ))

    ;; https://orgmode.org/manual/Conflicts.html
    ;; Make windmove work in Org mode:
    (add-hook 'org-shiftup-final-hook 'windmove-up)
    (add-hook 'org-shiftleft-final-hook 'windmove-left)
    (add-hook 'org-shiftdown-final-hook 'windmove-down)
    (add-hook 'org-shiftright-final-hook 'windmove-right)


    (setq org-tag-alist '((:startgroup . nil)
                          ("@fast-m" . ?f) ("@auto-m" . ?a)
                          ("@family" . ?y)
                          (:endgroup . nil)
                          ("idea" . ?i) ("study" . ?s)))
    )
  )

(use-package org-journal
  :ensure t
  :defer t
  :init
  (progn

    ;; Change default prefix key; needs to be set before loading org-journal
    (setq org-journal-prefix-key "C-c j ")

    (defun org-journal-file-header-func (time)
      "Custom function to create journal header."
      (concat
       (pcase org-journal-file-type
         (`daily "#+TITLE: Daily Journal\n#+STARTUP: showeverything")
         (`weekly "#+TITLE: Weekly Journal\n#+STARTUP: folded")
         (`monthly "#+TITLE: Monthly Journal\n#+STARTUP: folded")
         (`yearly "#+TITLE: Yearly Journal\n#+STARTUP: folded"))))

    (setq org-journal-file-header 'org-journal-file-header-func)

    (setq org-journal-start-on-weekday 7)
    (setq org-journal-enable-agenda-integration t)
    )
  :config
  (setq org-journal-dir "~/notes/journals/"
        org-journal-date-format "%A, %d %B %Y")
  (setq org-journal-carryover-items "TODO=\"Todo\"|TODO=\"Started\"")

  )


(use-package calfw
  :ensure t
  )

(use-package calfw-cal
  :ensure t
  )

(use-package calfw-org
  :ensure t
  :config
  (setq cfw:org-overwrite-default-keybinding t)
  )

(use-package plstore
  :ensure t
  :config
  (setq plstore-cache-passphrase-for-symmetric-encryption t)

  (add-to-list 'plstore-encrypt-to '("F2AAD2543A0AC3BD"))
  )

(when window-system
  (use-package org-gcal
    :ensure t
    :after org
    :config
    ;; (setq org-gcal-client-id "596462348804-e8p9i318ov74du0hp2i6sg07tki6hi9m.apps.googleusercontent.com")
    (setq org-gcal-fetch-file-alist '(("p.compassion@gmail.com" .  "~/notes/agendas/schedule.org")))
    (add-hook 'org-agenda-mode-hook 'org-gcal-fetch)
    (add-hook 'org-capture-after-finalize-hook 'org-gcal-fetch)
    )
  )



(use-package calfw-ical
  :ensure t
  )



(use-package general
  :ensure t
  :after which-key
  :config
  (general-override-mode 1)
  )

(general-create-definer df/ctrl-c
  ;; :keymaps '(normal insert visual emacs)
  :prefix "C-c")

(defun goto-journal()
  (interactive)
  (when (org-journal-open-current-journal-file) (org-journal-new-entry nil)))

(defun change-org-journal-file-type (ty)
  "type?"
  (interactive "cJournal type: ")

  (let (ty_s)
    (progn
      (cond
       ((char-equal ty ?w)
        (progn
          (setq org-journal-file-type 'weekly)
          (setq ty_s "weekly")
          (setq org-journal-file-format "%Y%m-w%V")
          ))
       ((char-equal ty ?d)
        (progn
          (setq org-journal-file-type 'daily)
          (setq ty_s "daily")
          (setq org-journal-file-format "%Y%m%d")
          )
        )
       ((char-equal ty ?m)
        (progn
          (setq org-journal-file-type 'monthly)
          (setq ty_s "monthly")
          (setq org-journal-file-format "%Y%m-%b")
          )
        )
       )

      ;; (message "journal type set to %s" ty_s)

      (org-journal-invalidate-cache)
      (goto-journal)
      )
    )
  )

(df/ctrl-c
  "a" 'org-agenda
  "c" 'org-capture
  )

(general-create-definer df-local/ctrl-c-o
  :prefix "C-c o")

(df-local/ctrl-c-o
  "j" 'goto-journal
  "t" 'change-org-journal-file-type
  "c" 'cfw:open-org-calendar
  )

(df-local/ctrl-c-o
  :keymaps 'org-mode-map
  "m" 'org-insert-todo-heading
  )


;; (use-package
;;   org-roam
;;   :ensure t
;;   :hook ((after-init . org-roam-setup)
;;          (org-roam-backlinks-mode . visual-line-mode))
;;   :custom
;;   (org-roam-directory "~/notes/roam/")
;;   :bind
;;   (:map org-roam-mode-map
;;         (
;;          ("C-c n f"   . org-roam-node-find)
;;          )
;;         :map org-mode-map
;;         (("C-c n i" . org-roam-node-insert)
;;          ("C-c n I" . org-roam-insert-immediate)
;;          ("C-c n o" . org-id-get-create)
;;          ("C-c n t" . org-roam-tag-add)
;;          ("C-c n a" . org-roam-alias-add)
;;          ("C-c n l" . org-roam-buffer-toggle)

;;          ))

;;   :config
;;   (org-roam-db-autosync-mode)
;;   :init
;;   (progn
;;     (setq org-roam-capture-templates
;;           (quote (("m" "main" plain
;;                    "%?"
;;                    :if-new (file+head "main/${slug}.org"
;;                                       "#+title: ${title}\n")
;;                    :immediate-finish t
;;                    :unnarrowed t)
;;                   ("r" "reference" plain "%?"
;;                    :if-new
;;                    (file+head "reference/${title}.org" "#+title: ${title}\n")
;;                    :immediate-finish t
;;                    :unnarrowed t)
;;                   ("a" "article" plain "%?"
;;                    :if-new
;;                    (file+head "articles/${title}.org" "#+title: ${title}\n#+filetags: :article:\n")
;;                    :immediate-finish t
;;                    :unnarrowed t)
;;                   ("d" "Default" plain "%?"
;;                    :if-new (file+head
;;                             "%(format-time-string \"%Y-%m-%d--%H-%M-%SZ--${slug}.org\" (current-time) t)"
;;                             "#+TITLE: ${title}\n#+DATE: %<%Y-%m-%d>\n\n")
;;                    :unnarrowed t)
;;                   )))

;;     )
;;   )


(if (not window-system)
    (progn
      (setq
       browse-url-browser-function 'eww-browse-url ; Use eww as the default browser
       browse-url-generic-program 'eww-browse-url
       shr-use-fonts  nil                          ; No special fonts
       shr-use-colors nil                          ; No colours
       shr-indentation 2                           ; Left-side margin
       shr-width 70                                ; Fold text to 70 columns
       eww-search-prefix "https://wiby.me/?q=")
      (setq browse-url-new-window-flag t)

      (defun browse-url-host (url &optional _new-window)
        (interactive (browse-url-interactive-arg "URL: "))
        (when-let* (
                    (ssh-client "192.168.0.97 41585 22")
                    ;; (ssh-client (getenv "SSH_CLIENT"))
                    (host-ip (car (split-string ssh-client)))
                    (host-name (string-trim (shell-command-to-string "whoami"))))
          ;; (call-process "ssh" nil 0 nil
          ;;               (format "%s@%s" host-name host-ip) (format "open '%s'" url))


          )
        )

      (when (getenv "SSH_CLIENT")
        (setq browse-url-browser-function 'browse-url-host))
      )


  )
;; (setq browse-url-browser-function 'browse-url-default-browser)


(use-package spacemacs-theme
  :ensure t
  :defer t
  :config
  ;; Global settings (defaults)
  :init
  (progn
    (load-theme 'spacemacs-dark t)

    (setq spacemacs-theme-comment-bg nil)
    )
  )


(setq system-time-locale "C")


;; (add-to-list 'default-frame-alist '(background-color . "#111111"))
;; (set-background-color "#111111")

(use-package so-long
  :ensure t
  )

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t ( :background "#111111" : :weight light))))) ;




(use-package elixir-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.elixir2\\'" . elixir-mode))
  )


(use-package leetcode
  :ensure t
  :after elpy
  :config
  (setq leetcode-prefer-language "python3")
  (setq leetcode-prefer-sql "mysql")
  (setq leetcode-save-solutions t)
  (setq leetcode-directory "~/study/leetcode")
  :init
  (progn

    (define-key leetcode-solution-mode-map (kbd "C-c C-t") 'leetcode-try)
    )

  )

;; mac specific

(set-frame-font "Monaco-14" nil t)

(add-hook
 'c++-mode-hook
 (lambda ()
   (local-set-key (kbd "C-c C-t")  (lambda () (interactive)(compile "make"))))
 )



(global-so-long-mode 1)
(setenv "WORKON_HOME" "~/virtualenvs")

(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)


(use-package alchemist
  :ensure t
  )


(use-package ediff
  :custom
  (setq ediff-window-setup-function 'ediff-setup-windows-plain)
  ;; https://emacs.stackexchange.com/a/48896/12031
  (advice-add 'ediff-window-display-p :override #'ignore)

  ;; ediff default split
  ;; (setq ediff-split-window-function 'split-window-horizontally)
  ;; (setq ediff-merge-split-window-function 'split-window-horizontally)
  ;; ediff default split

  :bind
  (
   :map ediff-mode-map
   (
    ;; ("[" . (lambda () (interactive) (setq-local ediff-merge-window-share (+  ediff-merge-window-share 0.10))))
    ;; ("]" . (lambda () (interactive) (setq-local ediff-merge-window-share (-  ediff-merge-window-share 0.10))))

    )
   )
  )

(use-package helm-descbinds
  :ensure t
  :config
  (helm-descbinds-mode)
  )

(use-package bookmark+
  :quelpa (bookmark+ :fetcher github :repo "emacsmirror/bookmark-plus")
  :after bookmark ; I have generic bookmark customization I want loaded beforehand, you might not need this
  ;; [...] your :init and :config
  ;; c-x x m create
  ;; c-x x e list
  ;; c-x x j jump

  )


(provide 'init)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; https://emacsdocs.org/docs/emacs/Find-Identifiers
;; https://docs.projectile.mx/projectile/usage.html
;; http://xahlee.info/emacs/emacs/emacs_outline.html
;; http://tuhdo.github.io/helm-intro.html#sec-7
