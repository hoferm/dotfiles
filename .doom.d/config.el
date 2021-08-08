;; -*- lexical-binding: t -*-

;; (set-face-attribute 'default t :font "Source Code Pro-16")
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 14 :style "medium"))

(setq projectile-project-search-path '("~/projects/c/"
                                       "~/projects/rust/"))

(setq dired-dwim-target t)

(fset 'battery-update #'ignore)

(map! :n [tab] '+fold/toggle)

(setq evil-split-window-below t
      evil-vsplit-window-right t)

(setq deft-directory "~/org/notes/")

(load-theme 'doom-one-light t)

(setq org-agenda-hide-tags-regexp ".")

(setq org-agenda-prefix-format
  '((agenda . " %i %-12:c%?-12t% s")
     (todo . " ")
     (tags . " %i %-12:c")
     (search . "%i %-12:c")))

(setq
 org-agenda-compact-blocks t
 org-agenda-start-with-log-mode t
 org-agenda-block-separator ""
 org-agenda-time-grid '((daily today require-timed)
                         nil
                         "......" "---------------")
 )

(setq org-agenda-custom-commands
      '(("n" "Everything"
         ((agenda "" ((org-agenda-span 'day)
                      (org-agenda-start-day "0d")
                      (org-super-agenda-groups
                       '((:name "Today"
                                :time-grid t
                                :date today
                                :and (:scheduled today :habit nil))
                         (:name "Habits"
                                :habit t)))))
          (alltodo "" ((org-agenda-overriding-header "")
                       (org-super-agenda-groups
                        '((:discard (:tag "@windows"))
                          (:name "Next"
                                 :todo "NEXT"
                                 :todo "PROGRESS")
                          (:name "Today"
                                 :tag "today")
                          (:name "Important"
                                 :priority "A"
                                 :tag "important")
                          (:name "Due Today"
                                 :deadline today)
                          (:name "Due Soon"
                                 :deadline future)
                          (:name "Overdue"
                                 :deadline past)
                          (:name "Personal"
                                 :tag "personal")
                          (:name "Projects"
                                 :tag "project")
                          (:name "To Read"
                                 :tag "read")
                          (:name "Refile"
                                 :tag "refile"
                                 :order 99)
                          (:name "Tasks"
                                 :discard (:scheduled today :habit t :todo "APPOINTMENT")
                                 :todo t
                                 :order 98)))))))
        ("b" "Books"
         ((agenda "" ((org-agenda-span 'day)
                      (org-agenda-start-day "0d")
                      (org-super-agenda-groups
                       '((:discard (:not (:and (:todo "READING" :todo "READ"))))))))
          (alltodo "" ((org-agenda-overriding-header "")
                      (org-super-agenda-groups
                       '((:name "Reading"
                                :todo "READING")
                         (:name "Done reading"
                                :todo "READ")
                         (:discard (:anything t))))))))
         ("p" "Personal"
           ((alltodo "" ((org-agenda-overriding-header "")
                          (org-super-agenda-groups
                            '((:name "Personal"
                                :tag "personal")
                               (:discard (:tag "@home" :tag "@linux" :tag "@windows"))
                               (:discard (:anything t))))))))
         ("h" "Home"
           ((tags-todo "@home" ((org-agenda-overriding-header "Home")))))
         ("e" "Errand"
           ((tags-todo "@errand" ((org-agenda-overriding-header "Errand")))))
         ("d" "Dev"
           ((tags-todo "@dev" ((org-agenda-overriding-header "Dev")))))))


;; org
(use-package! org-super-agenda
  :init
  (setq org-super-agenda-groups '((:name "Today"
                                         :time-grid t
                                         :scheduled today
                                         :todo "NEXT")
                                  (:name "Due today"
                                         :deadline today)
                                  (:name "Important"
                                         :priority "A")
                                  (:name "Personal"
                                         :habit t
                                         :tag "personal")
                                  (:name "Overdue"
                                         :deadline past)
                                  (:name "Due soon"
                                         :deadline future)
                                  (:name "Tasks"
                                         :todo t)
                                  (:discard (:anything t))))
  :config
  (org-super-agenda-mode))

(transient-append-suffix 'magit-log "-f"
  '("-z" "First Parent" "--first-parent"))
(define-transient-command magit-blame ()
  "Show the commits that added or removed lines in the visited file."
  :man-page "git-blame"
  :value '("-w" "--first-parent")
  ["Arguments"
   ("-w" "Ignore whitespace" "-w")
   ("-r" "Do not treat root commits as boundaries" "--root")
   ("-f" "Show only first parent" "--first-parent")
   (magit-blame:-M)
   (magit-blame:-C)]
  ["Actions"
   ("b" "Show commits adding lines" magit-blame-addition)
   ("r" "Show commits removing lines" magit-blame-removal)
   ("f" "Show last commits that still have lines" magit-blame-reverse)
   ("m" "Blame echo" magit-blame-echo)
   ("q" "Quit blaming" magit-blame-quit)
   ("n" "refresh" magit-blame-refresh)]
  ["Refresh"
   :if-non-nil magit-blame-mode
   ("c" "Cycle style" magit-blame-cycle-style)])

(define-suffix-command magit-blame-refresh (args)
  "For each line show the revision in which it was added."
  (interactive (list (magit-blame-arguments)))
  (magit-blame--run args))

(after! org
  (add-to-list 'org-modules 'org-habit t)
  ;; (add-to-list 'org-modules 'org-indent t)
  (add-to-list 'org-emphasis-alist '(("!" (:foreground "#FB4934"))))
  (setq
  org-ellipsis " ▼ "
  org-bullets-bullet-list '("☰" "☱" "☲" "☳" "☴" "☵" "☶" "☷" "☷" "☷" "☷")
  org-habit-show-habits-only-for-today nil
  org-todo-keywords '((sequence "TODO(t)"
                                "NEXT(n!)"
                                "WAIT(w@/!)"
                                "PROGRESS(p)"
                                "APPOINTMENT(a)"
                                "PROJECT(P)"
                                "|"
                                "DONE(d)"
                                "CANCELLED(c@/!)"))
  org-todo-keyword-faces '(("NEXT" . +org-todo-active)
                           ("PROGRESS" . +org-todo-active)
                           ("WAIT" . +org-todo-onhold)
                           ("APPOINTMENT" . (:foreground "#4DB5BD" :weight bold))
                           ("PROJECT" . +org-todo-project))
  org-agenda-skip-scheduled-if-done t
  org-log-done 'time
  org-tags-column -78
  org-indent-mode t
  org-startup-folded t
  org-pretty-entities t
  org-agenda-property-list '("PROGRESS" "PAGES")
  org-hide-emphasis-markers t))

(after! org-capture
;; org-agenda
(setq org-capture-templates
      (quote (("t" "TODO" entry (file "~/org/refile.org")
               "* TODO %?\n")
              ("m" "Meeting" entry (file+headline "agenda.org" "Future")
               concat "* %? :meeting:\n"
                      "<%<%Y-%m-%d %a %H:00>>")
              ("b" "Book" entry (file "~/org/books.org")
               "* %^{TITLE}\n:PROPERTIES:\n:ADDED: %<[%Y-%02m-%02d]>\n:END:%^{AUTHOR}p\n%?" :empty-lines 1)))))

(setq org-refile-targets '(("~/org/todo.org" :maxlevel . 3)
                           ("~/org/someday.org" :level . 1)))
