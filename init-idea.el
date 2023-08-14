;; http://stackoverflow.com/a/10093312/433570

;; list the packages you want
;; (setq package-list '(package1 package2))
;; fetch the list of packages available
;; (unless package-archive-contents
;;     (package-refresh-contents))


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


;; (add-hook
;;  'c++-mode-hook
;;  (lambda ()
;;    (local-set-key (kbd "C-c C-t")  (lambda () (interactive)(compile "make"))))
;;  )



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

;; bash-completion
;; (bash-completion-setup)
;; bash-completion
