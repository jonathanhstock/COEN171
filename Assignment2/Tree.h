template <class T>
class Node
{
    T value;
    Node *left;
    Node *right;

public:
    Node(const T &);
    void insert(const T &);
    bool member(const T &) const;
};

template <class Type>
class Tree
{
    Node<Type> *root;

public:
    Tree();
    void insert(const Type &);
    bool member(const Type &) const;
};

template <class T>
Node<T>::Node(const T &x)
{
    value = x;
    left = NULL;
    right = NULL;
}

template <class T>
bool Node<T>::member(const T &x) const
{
    if (x < value)
        return left ? left->member(x) : false;

    else if (x > value)
        return right ? right->member(x) : false;

    else
        return true;
}

template <class T>
void Node<T>::insert(const T &x)
{
    if (x < value)
    {
        if (left == NULL)
        {
            left = new Node(x);
        }
        else
        {
            left->insert(x);
        }
    }
    else if (x > value)
    {
        if (right == NULL)
        {
            right = new Node(x);
        }
        else
        {
            right->insert(x);
        }
    }
}

template <class Type>
Tree<Type>::Tree()
{
    root = NULL;
}

template <class Type>
bool Tree<Type>::member(const Type &x) const
{
    if (root == NULL)
    {
        return false;
    }
    else
    {
        return root->member(x);
    }
}

template <class Type>
void Tree<Type>::insert(const Type &x)
{
    if (root == NULL)
    {
        root = new Node<Type>(x);
    }
    else
    {
        root->insert(x);
    }
}