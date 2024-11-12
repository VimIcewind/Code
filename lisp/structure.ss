(define-structure (book title authors publisher year isbn))

(define bazaar
  (make-book
    "The Cathedral and the Bazaar"
    "Eric S. Raymond"
    "O'Reilly"
    1999
    0596001088))

(display bazaar)
(newline)
(book? bazaar)

(book-title bazaar)

(set-book-year! bazaar 2001)
(book-year bazaar)
(display bazaar)
(newline)
