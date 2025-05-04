(org-babel-load-file (expand-file-name "stigmacs.org"  user-emacs-directory))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(custom-safe-themes
   '("8d3ef5ff6273f2a552152c7febc40eabca26bae05bd12bc85062e2dc224cde9a"
     "4594d6b9753691142f02e67b8eb0fda7d12f6cc9f1299a49b819312d6addad1d"
     default))
 '(org-safe-remote-resources '("\\`https://gitlab\\.com\\(?:/\\|\\'\\)"))
 '(send-mail-function 'mailclient-send-it))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(keycast-key ((t (:background "#769ff0" :foreground "#282c34"))))
 '(lsp-ui-doc-header ((t :foreground "#5c64f1" :background "#1a1b2f"))))
