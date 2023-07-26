(deftheme from-mymac
  "Created 2023-07-26.")

(custom-theme-set-variables
 'from-mymac
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(byte-compile-warnings nil)
 '(custom-safe-themes '("ab42f5f3ec307f75fe7a959cdd1c00a093f7d4252453af085391ec789c83da85" "28d61ac6f26030e3c649e9f75b6ebd93dbf7f5f7b2f13e14cb1fe101e8cf4737" "eb50f36ed5141c3f702f59baa1968494dc8e9bd22ed99d2aaa536c613c8782db" "2bcd3850ef2d18a4c9208fe3e2a78c95fb82f48c26661c86a51ea39152f3577e" "bc7d4cfb6d4bd7074a39f97f0b8a057c5b651c403950bbbc4ad35a609ad6268a" "e3dedbd038f79ecaf01e0dbb947bb6eeec8374f322e7b4a2a224c9d9e1490c52" "7fd8b914e340283c189980cd1883dbdef67080ad1a3a9cc3df864ca53bdc89cf" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default))
(custom-theme-set-faces
 'from-mymac
 '(helm-grep-file ((t (:foreground "green" :underline t))))
 '(helm-ls-git-modified-not-staged-face ((t (:foreground "orange"))))
 '(helm-selection ((t (:background "blue" :foreground "white"))))
 '(highlight-indentation-face ((t nil)))
 '(js2-external-variable ((t (:foreground "red"))))
 '(magit-diff-added ((t (:background "green" :foreground "black"))))
 '(magit-diff-added-highlight ((t (:background "green" :foreground "black"))))
 '(magit-hash ((t (:foreground "white")))))

(provide-theme 'from-mymac)
