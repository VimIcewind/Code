(define table (make-hash-table))

(hashtable-set! table 'key1 "value1")
(hashtable-set! table 'key2 "value2")

(hash-table-map table (lambda (key value) (display (list key value))))

(hashtable-ref table 'key1 #f)
(hashtable-ref table 'key2 #f)
(hashtable-ref table 'key3 #f)

(hashtable-set! table 'key3 "value3")
(hashtable-ref table 'key3 #f)

(hashtable-delete! table 'key3)
(hashtable-ref table 'key3 #f)

(hash-table-map table (lambda (key value) (display (list key value))))
