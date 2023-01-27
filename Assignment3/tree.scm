(define (insert tree data)
   (cond 
	((null? tree) (list data '() '()))
	((< (car tree) data) (list (car tree) (cadr tree) (insert (caddr tree) data)))
	(else (> (car tree) data) (list (car tree) (insert (cadr tree) data) (caddr tree)))
	))

(define (member? tree data)
   (cond
	((null? tree) #f)
	((< (car tree) data) (member? (caddr tree) data))
	((> (car tree) data) (member? (cadr tree) data))
	(else #t)))
