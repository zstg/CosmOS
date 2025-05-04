;;; $DOOMDIR/config.el
;; -*- byte-compile: f; -*-
;; -*- lexical-binding: t; -*-
;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq! user-full-name "Zstg"
      user-mail-address "o0vckutt@duck.com") ;;GitLab
;;(setq! gc-cons-threshold most-positive-fixnum ; 2^61 bytes
;;     gc-cons-percentage 0.6)

;;(setq! gc-cons-threshold 64000000)
;;(add-hook! 'after-init-hook #'(lambda ()
				;; restore after startup
;;                               (setq! gc-cons-threshold 800000)))

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq! doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq! doom-theme 'doom-moonlight)
;; doom-city-lights
;; doom-moonlight
;; doom-horizon
;; doom-vibrant

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;;(setq! org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;; (setq! display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;; Improve org mode looks
;;(setq! org-startup-indented t
;;      org-pretty-entities t
;;      org-hide-emphasis-markers t
;;      org-startup-with-inline-images t
;;     org-image-actual-width '(300))


;;(if (eq initial-window-system 'x) ;; maximise on startup , slows DE a bit
;;    (toggle-frame-maximized)
;;  (toggle-frame-fullscreen))
;(setq! initial-major-mode 'org-mode) ;;makes the scratch buffer go to orgmode by default

(defun write-and-quit()
  (interactive)
  (save-buffer t)
  ;;(kill-emacs)
  (doom/delete-frame-with-prompt)
  )

(defun my-yes-or-no-p (prompt)
    "PROMPT user with a yes-or-no question, RET counts as yes."
    (if (string= "yes"
                 (downcase
                  (read-from-minibuffer
                   (concat prompt "(yes or no) "))))
        nil
      t))

;; Custom keybindings
(map! :leader
      :desc "Save file and quit"
      "f x" #'write-and-quit

      :leader
      :desc "Delete this file"
      "f d" #'doom/delete-this-file

      :leader
      :desc "Find directory"
      "f D" #'find-file

      :leader
      :desc "Browse private config"
      "f p "#'doom/open-private-config

      :leader
      :desc "Find file in private config"
      "f P"#'doom/find-file-in-private-config

      :leader ;; who needs some editorconfig command
      :desc "Clear recent files"
      "f c"#'recentf-edit-list

      :leader
      :desc "Comment/uncomment" ;; If already commented - it will comment once more - `gcc` also works
      "c ;" #'evilnc-comment-or-uncomment-lines

      :leader
      :desc "Export Org file"
      "o e" #'org-export-dispatch

      :leader
      :desc "Insert nerd font icon"
      "i n"#'nerd-icons-insert

      :leader
      :desc "Kill Emacs (and daemon)"
      "q k"#'save-buffers-kill-emacs

      :leader
      :desc "Restart and restore Emacs"
      "q R"#'doom/restart-and-restore

      :leader
      :desc "Restart Emacs"
      "q r"#'doom/restart

      :leader
      :desc "Delete frame"
      "f q"#'doom/delete-frame-with-prompt

      :leader ;Same as ` c ;`
      :desc "Comment/uncomment"
      "/"#'evilnc-comment-or-uncomment-lines

      :leader
      :desc "Search project"
      ";"#'+default/search-project

      :leader
      :desc "Prettify symbols"
      "~" #'prettify-symbols-mode

      :leader ;; spc b k kills current buffer
      :desc "Kill all buffers"
      "b d"#'doom/kill-all-buffers

      :leader
      :desc "Kill other buffers"
      "b o"#'doom/kill-other-buffers

      :leader
      :desc "describe-key-briefly"
      "b K"#'describe-key-briefly

      :leader
      :desc "Clear buffer"
      "b c"#'comint-clear-buffer

      :leader
      :desc "Magit diff"
      "g d"#'magit-diff-dwim

      :leader
      :desc "Toggle tabs"
      "t t"#'centaur-tabs-mode

      :leader
      :desc "Fix tabs"
      "t `"#'untabify

      :leader
      :desc "Fix tabs"
      "t ~"#'untabify

      :leader
      :desc "Show line numbers"
      "l"#'doom/toggle-line-numbers ;;doom/toggle-line-numbers is quite good

      :leader
      :desc "Toggle line indent characters"
      "`"#'highlight-indent-guides-mode

      :leader
      :desc "Open Python shell"
      "o p"#'run-python

     ;; :desc "Search for letter(s) + hints"
     ;; "s h"#'avy-custom
      :leader
      :desc "Frame fullscreen"
      "t f"#'toggle-frame-fullscreen

      :leader
      :desc "Flycheck"
      "t F"#'flycheck-mode)

;; (setq! lsp-file-watch-threshold 5000 ) ; stupid lsp keeps on warning
;; (setq! frame-inhibit-implied-resize t)
;; (setq! initial-major-mode 'fundamental-mode)
;; (setq-default major-mode 'text-mode) ;; If fundamental mode is set as the default major mode, line numbers won't appear - it's impossible to tweak Fundamental mode settings

;; in ~/.emacs.d/init.el (or ~/.emacs.d/early-init.el in Emacs 27)
(setq! package-enable-at-startup nil ; don't auto-initialize!
      ;; don't add that `custom-set-variables' block to my init.el!
      package--init-file-ensured t)

;(defvar last-file-name-handler-alist file-name-handler-alist)
;(setq! gc-cons-threshold 402653184
;      gc-cons-percentage 0.6
;      file-name-handler-alist nil)
;
;; ... your whole emacs config here ...
;; after startup, it is important you reset this to some reasonable default. A large
;; gc-cons-threshold will cause freezing and stuttering during long-term
;; interactive use. I find these are nice defaults:
;(add-hook! 'emacs-startup-hook
;  (setq! gc-cons-threshold 16777216
;        gc-cons-percentage 0.1
;        file-name-handler-alist last-file-name-handler-alist))

;;(setq! native-comp-deferred-compilation t) ;; this is the default now - Doom compiles more like a JIT , and is no longer ahead-of-time
;; (setq! package-native-compile t) -> moot point, since building  Emacs with native comp is a bad idea anyways
;; (setq! frame-title-format "")
;;
;; (set-frame-parameter (selected-frame) 'alpha '(95 95)) ;;set transparency
;; (add-to-list 'default-frame-alist '(alpha 95 95))
;;
;; (setq! browse-url-browser-function 'eww-browse-url)
;; (setq! frame-resize-pixelwise t) ;; this fixes a bug in Qtile

(map! :after vterm
  :map vterm-mode-map
  :ni "C-c" #'vterm--self-insert )
;; (define-key vterm-mode-map [C-c] 'vterm-send-key C-c)
;; BOTH <C-c> and [C-c] work, they are equivalent
(setq! doom-unicode-font (font-spec :family "JetBrainsMono NF" :size 15))

(custom-set-faces!
  '(vterm :family "JetBrainsMono NF" :size 15))
;; (add-hook! 'vterm-mode-hook (lambda() (setq! buffer-face-mode-face '(:family "JetBrainsMono"))))

;; (add-hook 'vterm-mode-hook
;;           (lambda ()
;;             (set (make-local-variable 'buffer-face-mode-face) 'fixed-pitch)
;;                  (buffer-face-mode t)))
;; FONTS - can slow down Emacs a bit
;;
;;(setq! doom-font (font-spec :family "CaskaydiaCove NF" :size 22)
;;      doom-variable-pitch-font (font-spec :family "JetBrainsMono NF" :size 16)
;;      doom-big-font (font-spec :family "CaskaydiaCove NF" :size 24))

(setq! doom-font (font-spec :family "JetBrainsMono NF" :size 17);;monospace
;; (setq! doom-font (font-spec :family "IosevkaTerm NF Mono" :size 20);;monospace
;; (setq! doom-font (font-spec :family "Mononoki NF" :size 20 :weight 'bold);;monospace
;; (setq! doom-font (font-spec :family "Fira Code" :size 17);;monospace
      doom-variable-pitch-font (font-spec :family "JetBrainsMono NF" :size 20));;sans


;; SETTING CUSTOM CODE RUNNERS (in this case, for a lang called Crystal)
;;(set-eval-handler! 'crystal-mode
;;  '((:command     . "crystal")
;;    (:exec        . "%c %s")
;;    (:description . "Run Crystal script")))
;;
(after! doom-themes
  (setq! doom-themes-enable-bold t
      doom-themes-enable-italic t))
(custom-set-faces!
 '(font-lock-comment-face :slant italic)
 '(font-lock-keyword-face :slant italic))
;; (define-key shell-mode-map [C-l] 'comint-clear-buffer)
(defalias 'yes-or-no-p 'my-yes-or-no-p)
(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))
(set-eval-handler! 'octave-mode #'octave-send-region)
;; (define-key! prog-mode-map [C-mouse-1] 'evil-mc-toggle-cursor-here)
(global-set-key (kbd "C-S-j") 'mc/toggle-cursor-on-click)
;;(global-set-key [C-down-mouse-1] 'evil-mc-toggle-cursor-here)

;; MODES
(global-prettify-symbols-mode -1) ;; 0, nil and -1 are `False', 1, +1, -1 are `True'
;; SOME minor modes such as `truncate-lines' will be disabled only using `nil', and will be enabled with `1', `0', `1'
;; (prettify-symbols-mode -1)
;; (company-tng-mode -1)
;; (company-box-mode -1)  ;; removes those icons
(pixel-scroll-mode t)
(pixel-scroll-precision-mode t)
;; (setq! prettify-symbols-mode 'nil)
;; (setq! global-prettify-symbols-mode 'nil)

;; HOOKS
(add-hook! 'server-done-hook 'recentf-cleanup) ;; whenever Emacs daemon is killed, clear recent files (is this a good idea??)
(add-hook! 'c-mode-common-hook (lambda () (company-tng-mode -1)))
(add-hook! 'prog-mode-hook (lambda () (centaur-tabs-mode -1)))
(add-hook! 'lsp-mode-hook 'eglot-ensure)
;;(add-hook! 'prog-mode-hook 'tree-sitter-hl-mode) ;; tree-sitter's advanced syntax highlighting
;; (add-hook! 'prog-mode-hook (lambda() (prettify-symbols-mode -1)))
;; (add-hook! 'prog-mode-hook 'linum-mode) ;; load line numbers when necessary -> DISABLED
;; (add-hook! 'prog-mode-hook (lambda() (company-tng-mode 0)))
(add-hook! 'prog-mode-hook 'rainbow-delimiters-mode) ;; colourized brackets
(add-hook! 'prog-mode-hook 'company-tng-mode) ;; Tab-n-Go completions
(add-hook! 'prog-mode-hook 'diff-hl-mode 'diff-hl-flydiff-mode) ;; for cool Git diffs, and it's better than git-gutter-mode
(add-hook! 'company-mode-hook 'company-box-mode)
;; (add-hook! 'emacs-lisp-mode-hook (lambda () (prettify-symbols-mode -1)))
(remove-hook! 'emacs-lisp-mode-hook 'prettify-symbols-mode)
;; (add-hook! 'elisp-mode-hook (lambda () (prettify-symbols-mode -1)))
(add-hook! 'org-mode-hook (lambda () (setq org-src-fontify-natively nil))) ;; no more Z's in Org src blocks
(add-hook! 'python-mode-hook 'lsp-headerline-breadcrumb-mode)
(add-hook! 'dired-mode-hook 'diff-hl-dired-mode)
;; for Magit -> automatically change the git diff fringes in file(s) after the files have been pushed
(add-hook! 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
(add-hook! 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
;; (add-hook! 'emacs-lisp-mode-hook 'company-tng-mode) ;;disables company-tng (not company) for elisp mode
(add-hook! 'org-mode-hook 'company-mode) ;;disables company for org mode
(add-hook! 'org-mode-hook 'org-modern-mode)
(add-hook! 'man-mode-hook 'doom/window-maximize-buffer)

(define-key! evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key! evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
(define-key! evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key! evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
(map! :niv "C-e" #'doom/forward-to-last-non-comment-or-eol) ;; weird, C-e does something else in Vim


;; MISC config

(defun org-html-export-to-html-and-open ()
  "Export the Org file to HTML and open it in EWW."
  (interactive)
  (let* ((org-file (buffer-file-name))
         (html-file (concat (file-name-sans-extension org-file) ".html"))
         (html-file-url html-file))
    (org-export-to-file 'html html-file nil nil nil nil)
	;; (split-window-left)
	;; (evil-window-vsplit)
    (eww-open-file html-file-url)))

(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-o") 'org-html-export-to-html-and-open)))
(setq org-babel-default-header-args
      (cons '(:results . "output")
            (cons '(:noweb . "yes")
                  (assq-delete-all :results org-babel-default-header-args))))

(setq browse-url-browser-function 'eww-browse-url)

(map! :niv "C-c o p" #'org-html-export-to-html-and-open)

;; (setq! display-buffer-base-action '(display-buffer-in-tab))
;; (add-hook! arduino-mode-hook
;; (map! :map arduino-mode-map
;;       :leader
;;       :desc "Upload Arduino"
;;       "c e" #'arduino-upload))
;; (add-hook! 'arduino-mode-hook 'eglot-ensure)

(setq! company-idle-delay 0.2
      company-minimum-prefix-length 1
      company-tooltip-limit 10
      company-tooltip-align-annotations t
      company-tooltip-flip-when-above t
      company-tooltip-annotation-limit 10)
(setq! c-default-style "k&r")
(defun company-nixos-setup ()
  (message "Setting up company for nix-mode")
  (add-to-list 'company-backends 'company-lsp))

(defun eglot-nix-hook ()
  (when (and buffer-file-name
             (string-suffix-p ".nix" buffer-file-name))
    (eglot-ensure)
    (setq-local company-backends '(company-capf))))

(add-hook 'eglot--managed-mode-hook #'eglot-nix-hook)
;; (add-hook 'nix-mode-hook #'company-nixos-setup)
(add-hook 'nix-mode-hook 'eglot-ensure)
(add-hook 'nix-mode-hook #'company-mode)


(after! doom-modeline
  (setq! doom-modeline-icon t)
  (setq! doom-modeline-major-mode-icon t)
  (setq! doom-modeline-major-mode-color-icon t))
(setq-default indent-tabs-mode t)
(setq! org-pretty-entities t
       ;; source-directory (expand-file-name "~/emacs")
       Man-notify-method 'aggressive
       inhibit-automatic-native-compliation t
       vertico-count 10
      ;; global-visual-line-mode t ;; behaves like normal text editors -> but this means lines can be very long (usually not the case)
      projectile-project-search-path '("~/.dotfiles" "~/.config/doom" "~/.config/qtile" "~/.config/hypr/" "~/.config/waybar/")
      projectile-auto-discover nil ;; so that this doesn't add unnecessary projects
      org-hide-emphasis-markers t
      native-comp-enable-subr-trampolines nil
      confirm-kill-emacs nil ;;prevent ALL quit prompts
      display-line-numbers-type nil
      fancy-splash-image "~/.dotfiles/doom/gnu_color.png"
      safe-local-variable-values nil
      delete-selection-mode t
      explicit-shell-file-name "/usr/bin/zsh"
      ;;gc-cons-threshold (* 2 1000 1000)
      ;;gc-cons-percentage 0.6
      doom-modeline-major-mode-color-icon t
      desktop-save-mode nil
      load-prefer-newer 'noninteractive
      delete-selection-mode t
      markdown-command "pandoc"
      org-src-preserve-indentation nil
      org-src-tab-acts-natively t
      org-edit-src-content-indentation 0)

;; SMOOTH SCROLLING SETTINGS
;; Note that smooth scrolling could be CPU-intensive, and can also not work efficiently in some buffers (with certain major modes enabled)
(setq!
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000 ;; 101?
      scroll-preserve-screen-position 1
      pixel-scroll-precision-use-momentum t ;; the editor continues scrolling for a while even after the scroll gesture is stopped
      pixel-scroll-precision-large-scroll-height 40.0)
      ;; mouse-wheel-scroll-amount '(1 ((shift) .1)) ;;scroll 1 line at a time ~> smooth scrolling
      ;; mouse-wheel-progressive-speed t
      ;; mouse-wheel-follow-mouse t) ;;follow mouse - scroll like a normal text editor

;; (defun my-c-mode-hook ()
;;   "Custom `c-mode' behaviours."
;;   ;; Inhibit `global-prettify-symbols-mode'.
;;   (kill-local-variable 'prettify-symbols-alist))
;; (add-hook 'c-mode-hook #'my-c-mode-hook :append)

;;(add-hook! 'prog-mode-hook 'highlight-indent-guides-mode)
;; (setq! highlight-indent-guides-method 'character)
(after! evil-snipe
  (evil-define-key* '(motion normal) evil-snipe-local-mode-map
    ";" (cmd! (evil-ex)) ; make semicolon work like colon in evil normal mode
    ;; "s" (cmd! (let ((current-prefix-arg t)) (evil-avy-goto-char-timer)))
    ;; "f" (cmd! (let ((current-prefix-arg t)) (evil-avy-goto-char-timer)))
    "<" (cmd! (org-demote))
    ">" (cmd! (org-promote)))) ;; emulates hop.nvim
;; (setq!-default markdown-hide-markup t) --> Not a good idea , toggle hiding using `SPC m t m` instead
;; (markdown-toggle-url-hiding)
;; (markdown-toggle-markup-hiding)
;; (markdown-toggle-fontify-code-blocks-natively))
(setq! org-superstar-headline-bullets-list '( "⌬" "⊛" "➤" "▻" "◎" "❂" "⦿" "✦"  "❅" "❇" "◈" "▶" "☢" "☯"  "☮" "☣")) ;; BENZENE?!
(setq! org-modern-star '("⌬" "⊛" "➤" "▻" "◎" "❂" "⦿" "✦"  "❅" "❇" "◈" "▶" "☢" "☯"  "☮" "☣"))
(defalias 'elisp-mode #'emacs-lisp-mode) ;; so that elisp-mode toggles in Vertico
(defun view-pdf-from-url (url)
  "View a PDF from a given URL without downloading it."
  (url-retrieve url
                (lambda (status)
                  (let ((buffer (current-buffer)))
                    (with-current-buffer buffer
                      (search-forward "\n\n" nil t)
                      (pdf-view-mode))
                    (kill-buffer buffer)))))
(defun org-mode-hide-src-block-delimiters()
  (interactive)
  (save-excursion (goto-char (point-max))
      (while (re-search-backward "#\\+BEGIN_SRC\\|#\\+END_SRC" nil t)
         (let ((ov (make-overlay (line-beginning-position)
             (1+ (line-end-position)))))
         (overlay-put ov 'invisible t)))))
;; (defalias 'org-hide-src-block-delimiters #'org-mode-hide-src-block-delimiters)
;; (setq! buffer-face-mode-face '(:height 140 :family "JetBrainsMono NF"))

;; (add-hook!
;;  'prog-mode-hook
;;  (lambda ()
;;    (mapc (lambda (pair) (push pair prettify-symbols-alist))
;;          '(;; Syntax
;;            ("def" .      #x2131)
;;            ;; ("def" .     ℱ)
;;            ("not" .      #x2757)
;;            ("in" .       #x2208)
;;            ("not in" .   #x2209)
;;            ("return" .   #x27fc)
;;            ("yield" .    #x27fb)
;;            ("for" .      #x2200)
;;            ;; Base Types
;;            ("int" .      #x2124)
;;            ("float" .    #x211d)
;;            ("str" .      #x1d54a)
;;            ("True" .     #x1d54b)
;;            ("False" .    #x1d53d)
;;            ;; Mypy
;;            ("Dict" .     #x1d507)
;;            ("List" .     #x2112)
;;            ("Tuple" .    #x2a02)
;;            ("Set" .      #x2126)
;;            ("Iterable" . #x1d50a)
;;            ("Any" .      #x2754)
;;            ("Union" .    #x22c3)))))
