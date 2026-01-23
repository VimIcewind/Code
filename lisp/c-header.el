(defun c-header (name)
  "初始化 C 程序头文件。"
  (interactive "s头文件名: ")
  (insert (format "#ifndef %s_H\n" (upcase name)))
  (insert (format "#define %s_H\n\n" (upcase name)))
  (insert "#endif"))
