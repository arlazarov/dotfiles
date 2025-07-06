;; Package repositories
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("gnu"   . "https://elpa.gnu.org/packages/"))
(package-initialize)

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; UI tweaks
(setq inhibit-startup-screen t)
(menu-bar-mode   -1)
(tool-bar-mode   -1)
(scroll-bar-mode -1)
(setq-default indent-tabs-mode nil
              tab-width 2)
(setq auto-save-default t)
(display-time-mode 1)

;; Theme and font
(use-package dracula-theme
  :ensure t
  :config (load-theme 'dracula t))
(set-face-attribute 'default nil
                    :family "Fira Code"
                    :height 120)

;; Vim emulation
(use-package evil
  :ensure t
  :config (evil-mode 1))

;; Fuzzy search and commands
(use-package ivy
  :ensure t
  :diminish
  :bind (("C-s"   . swiper)
         ("C-x C-f" . counsel-find-file)
         ("M-x"   . counsel-M-x))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
        ivy-count-format "(%d/%d) "))

;; Auto-completion
(use-package company
  :ensure t
  :hook (after-init . global-company-mode)
  :config
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.2))
