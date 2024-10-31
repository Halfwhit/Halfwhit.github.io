;; Set the package installation directory so that packages aren't stored in the
;; ~/.emacs.d/elpa path.
(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;; Initialize the package system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install dependencies
(package-install 'htmlize)


(setq python-indent-guess-indent-offset t)
(setq python-indent-guess-indent-offset-verbose nil)


;; Load the publishing system
(require 'ox-publish)

;; Customise the HTML output
(setq org-html-validation-link nil
      org-html-head-include-scripts nil
      org-html-head-include-default-style nil
      org-html-head "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\" />")

;; Define the publishing project
(setq org-publish-project-alist
      (list
       (list "halfwhit.github.io"
             :recursive t
             :base-directory "./content/"
             :publishing-function 'org-html-publish-to-html
             :publishing-directory "./public"
             :with-author nil
             :with-creator t
             :with-toc nil
             :section-numbers nil
             :time-stamp-file nil)))

;; Generate the site output
(org-publish-all t)

(message "Build complete!")
