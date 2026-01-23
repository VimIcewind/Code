(when window-system
  (set-frame-font (font-spec :name "Source Code Pro" :size 14))
  (dolist (script '(han cjk-misc bopomofo))
    (set-fontset-font
     (frame-parameter nil 'font)
     script
     (font-spec :name "Microsoft YaHei" :size 14)))
  (defun my-theme (bg-color mode-line-bg-color)
  (setq-default line-spacing 4)
  (set-face-attribute 'default nil :background bg-color)
  (set-face-attribute 'fringe nil :background bg-color)
  (set-face-attribute 'mode-line nil
		      :background mode-line-bg-color
		      :box '(:line-width 2 :color "#a1afc9"))
  (set-face-attribute 'mode-line-inactive nil
		      :background bg-color
		      :box '(:line-width 1 :color "#a1afc9")))
  (my-theme "#f0f0f0" "#e0e0e0"))
