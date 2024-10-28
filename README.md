# Hash Map
A Data Structure Project from the "Odin Project" curriculum

## Strcuture of hash map

- Each bucket will be a linked list where one node leads to the other (instances of collisions)
- If a bucket has a single node, that node is the `@head` of that linked list
- If a collision happens, the node being inserted will be linked as `@tail` of linked list

## Time Complexity

1. **Retrieval** => (1)n (Constant *and* Linear Complexity if `bucket == linked list`)
2. **Deletion** => (1)n (Constant *and* Linear Complexity if `bucket == linked list`)
