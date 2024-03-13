import 'dart:io';

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

  delete(int data) {
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
          //assigning the smallest value of right side to current node data
          currentNode.data = getMinValue(currentNode.right!);
          //removing the smallest value of right side by making current node.right as current node and current node as parent node
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

  int findClosest(int target) {
    Node? current = root;
    int closest = current!.data!;
    while (current != null) {
      if ((target - closest).abs() > (target - current.data!).abs()) {
        closest = current.data!;
      }
      if (current.data! < target) {
        current = current.right;
      } else if (current.data! > target) {
        current = current.left;
      } else {
        break;
      }
    }
    return closest;
  }

  inOrder() {
    inOrderHelper(root);
  }

  inOrderHelper(Node? node) {
    if (node != null) {
      inOrderHelper(node.left);
      stdout.write(node.data);
      inOrderHelper(node.right);
    }
  }

  preOrder() {
    preOrderHelper(root);
  }

  preOrderHelper(Node? node) {
    if (node != null) {
      stdout.write(node.data);
      preOrderHelper(node.left);
      preOrderHelper(node.right);
    }
  }

  postOrder() {
    postOrderHelper(root);
  }

  postOrderHelper(Node? node) {
    if (node != null) {
      postOrderHelper(node.left);
      postOrderHelper(node.right);
      stdout.write(node.data);
    }
  }
}

void main(List<String> args) {
  BinaryTree tree = BinaryTree();
  tree.insertData(10);
  tree.insertData(6);
  tree.insertData(4);
  tree.insertData(8);
  tree.insertData(30);
  tree.insertData(35);
  tree.insertData(20);
  tree.inOrder();
}
