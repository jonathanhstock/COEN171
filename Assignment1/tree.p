(* 
 * FILE_NAME: tree.p
 * Jonathan Stock
 * COEN 171 Dr. Atkinson
 *)

(*
 * Reads a list of integers from standard input and inserts them into
 * a binary search tree.  Then, reads a list of integers from standard
 * input and checks if each integer is present in the tree.  Both
 * lists are terminated by -1.
*)

program bst(input, output);
    
    type
        tree = ^node;
        node = record
            info : integer;
            left : tree;
            right : tree
    end;

    var t : tree;
    var x : integer;

    (*
     * Inserts an integer into the specified binary search tree.  If the
     * integer is already present in the tree, then the tree is unchanged.
     * If the tree is NULL, then a single node is created as the tree.
     * Otherwise, a new node is created at the appropriate place in the
     * tree.  The root of the subtree is returned.
     *)
    procedure insert(var root : tree; var value : integer);

    var node : tree;
    begin
    if root = nil then
    begin 
    new(node);
    node^.left := nil;
    node^.right := nil;
    node^.info := value;
    root := node;
    end
    
    else if root^.info < value then
    insert(root^.right, value)

    else if root^.info > value then 
    insert(root^.left, value)

    end;


    (*
     * Returns nonzero if the value is found in the specified binary
     * search tree.  If the value is not found then zero is returned.
     *)
    function member(var root : tree; var value : integer) : boolean;

    begin
    if root = nil then 
    member := false
    else if root^.info = value then
    member := true
    else if root^.info < value then 
    member := member(root^.right, value)
    else
    member := member(root^.left, value)
    end;

begin
    t := nil;
    read(x);

    while x <> -1 do 
    begin
    insert(t,x);
    read(x);
    end;

    read(x);

    while x <> -1 do 
    begin 
    writeln(member(t,x));
    read(x);
    end;

end.
