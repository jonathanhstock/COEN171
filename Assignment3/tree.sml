datatype tree = empty | node of tree * int * tree;

fun insert empty info = node(empty, info, empty)
  | insert (node(left, info, right)) value = if info > value then node(insert left value, info, right)
					   else if info < value then node(left, info, insert right value)
					   else node(left, info, right);

fun member empty info = false
  | member (node(left, info, right)) value = if info < value then member right value
					   else if info > value then member left value
					   else true;
