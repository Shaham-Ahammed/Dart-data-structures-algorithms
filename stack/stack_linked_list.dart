import 'dart:io';

class Node {
  int? data;
  Node? next;
  Node(int data) {
    this.data = data;
  }
}

class Stack {
  Node? top;
  push(int data) {
    Node newNode = Node(data);
    if (top == null) {
      top = newNode;
    } else {
      newNode.next = top;
      top = newNode;
    }
  }

  display() {
    Node? temp = top;
    while (temp != null) {
      stdout.write("${temp.data} " "");
      temp = temp.next;
    }
  }

  pop() {
    if (top == null) {
      print("stack underflow");
      return;
    }
    top = top!.next;
  }
}

void main(List<String> args) {
  Stack stack = Stack();
  stack.push(2);
  stack.push(9);
  stack.push(32);
  stack.pop();

  stack.display();
}
