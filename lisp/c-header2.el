(defun c-header (name)
  "初始化 C 程序头文件。"
  (interactive "s头文件名： ")
  (setq name (upcase name))
  (insert (format "#ifndef %s_H\n" name))
  (insert (format "#define %s_H\n" name))
  (let ((a "\n#endif"))
    (insert a)
    (goto-char (- (point) (length a)))))
