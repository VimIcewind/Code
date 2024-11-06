#\a
#\space
#\tab
#\linefeed
#\return

(char? #\a)
(char? #\space)
(char? #\tab)
(char? #\linefeed)
(char? #\return)

(char=? #\a #\a)

(char->integer  #\a)

(integer->char 97)

(char<? #\a #\b)

(char<=? #\a #\b)

(char>? #\a #\b)

(char>=? #\a #\b)

(char-ci=? #\a #\A)
(char-ci<? #\a #\A)
(char-ci<=? #\a #\A)
(char-ci>? #\a #\A)
(char-ci>=? #\a #\A)

(char-alphabetic? #\a)

(char-numeric? #\1)

(char-whitespace? #\space)
(char-whitespace? #\tab)
(char-whitespace? #\linefeed)
(char-whitespace? #\return)

(char-upper-case? #\A)
(char-lower-case? #\a)

(char-upcase #\a)
(char-downcase #\A)


