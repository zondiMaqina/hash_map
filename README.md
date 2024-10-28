# Hash Map
A Data Structure Project from the "Odin Project" curriculum

## Strcuture of hash map

- Each bucket will be a linked list where one node leads to the other (instances of collisions)
- If a bucket has a single node, that node is the `@head` of that linked list
- If a collision happens, the node being inserted will be linked as `@tail` of linked list

## Time Complexity

1. **Retrieval** => (1)n (Constant *and* Linear Complexity if `bucket == linked list`)
2. **Deletion** => (1)n (Constant *and* Linear Complexity if `bucket == linked list`)


## File Strcuture

1. **hash_map**
- linked_list.rb => has `class` for nodes and linked list features
- hash_map.rb => has the features for `hashmap` structure which will use linked list features
1. **bundle**
- Gemfile
- Gemfile.lock
- rubocop.yml
