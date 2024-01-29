class Node {
  int? data;
  Node? left;
  Node? right;
  Node(int data) {
    this.data = data;
  }
}

class BinaryTree {
  Node? root;
  insertData(int data) {
    Node? newNode = Node(data);
    Node? currentNode = root;
    if (currentNode == null) {
      root = newNode;
      return;
    }
    while (true) {
      if (data < currentNode!.data!) {
        if (currentNode.left == null) {
          currentNode.left = newNode;
          break;
        } else {
          currentNode = currentNode.left;
        }
      } else {
        if (data > currentNode.data!) {
          if (currentNode.right == null) {
            currentNode.right = newNode;
            break;
          } else {
            currentNode = currentNode.right;
          }
        }
      }
    }
  }

  bool contains(int data) {
    Node? currentNode = root;
    while (currentNode != null) {
      if (data == currentNode.data) {
        return true;
      } else if (data < currentNode.data!) {
        currentNode = currentNode.left;
      } else if (data > currentNode.data!) {
        currentNode = currentNode.right;
      }
    }
    return false;
  }
  
  remove(int data) {
    removeHelper(data, root, null);
  }

  removeHelper(int data, Node? currentNode, Node? parentNode) {
    while (currentNode != null) {
      if (data < currentNode.data!) {
        parentNode = currentNode;
        currentNode = currentNode.left;
      } else if (data > currentNode.data!) {
        parentNode = currentNode;
        currentNode = currentNode.right;
      } else {
        if (currentNode.left != null && currentNode.right != null) {
          currentNode.data = getMinValue(currentNode.right!);
          removeHelper(currentNode.data!, currentNode.right, currentNode);
        } else {
          if (parentNode == null) {
            if (currentNode.left != null) {
              root = currentNode.left;
            } else {
              root = currentNode.right;
            }
          } else {
            if (parentNode.left == currentNode) {
              if (currentNode.right == null) {
                parentNode.left = currentNode.left;
              } else {
                parentNode.left = currentNode.right;
              }
            } else {
              if (currentNode.right == null) {
                parentNode.right = currentNode.left;
              } else {
                parentNode.right = currentNode.right;
              }
            }
          }
        }
        break;
      }
    }
  }

  int getMinValue(Node currentNode) {
    if (currentNode.left == null) {
      return currentNode.data!;
    } else {
      return getMinValue(currentNode.left!);
    }
  }
}

void main(List<String> args) {
  BinaryTree tree = BinaryTree();
  tree.insertData(23);
  tree.insertData(10);
  tree.insertData(14);
  print(tree.contains(000));
}
