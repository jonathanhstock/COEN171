;vi:ai:lisp:sm:number
(define(filter f lst)
   (cond
	 ((null? lst) lst)
	 ((f (car lst)) (cons (car lst) (filter f (cdr lst))))
	 (else (filter f (cdr lst)))))

(define(quicksort lst) 
	  (cond 
	    ((null? lst) lst)
	  	(else
	    	(let* 
			 ((below (lambda(x) (< x (car lst))))
			  (above (lambda(x) (>= x (car lst))))
			 )
			  (append (quicksort (filter below (cdr lst))) (cons (car lst) (quicksort (filter above (cdr lst)))))))))





