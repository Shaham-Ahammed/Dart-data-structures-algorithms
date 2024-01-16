class Node {
  int? data;
  Node? next;
  Node(int data) {
    this.data = data;
    this.next = null;
  }
}

class LinkedList {
  Node? head;
  Node? tail;
  void addData(int data) {
    Node newData = Node(data);
    if (head == null) {
      head = newData;
      tail = newData;
      return;
    } else {
      tail!.next = newData;
      tail = newData;
    }
  }

  printData() {
    if (head == null) {
      print("no data");
      return;
    }
    Node? current = head;
    while (current != null) {
      print('${current.data}');
      current = current.next;
    }
  }

  void deleteData(int data) {
    Node? prev = null;
    Node? temp = head;
    if (head == null) {
      return;
    }
    //deleting head & updating new head
    if (temp!.data == data) {
      head = temp.next;
      return;
    }
    while (temp != null && temp.data != data) {
      prev = temp;
      temp = temp.next;
    }
    // no delete element found
    if (temp == null) {
      return;
    }

    if (temp == tail) {
      tail = prev;
      tail!.next = null;
      return;
    }
    // deleting in between element
    prev!.next = temp.next;
  }

  // inserting an element after one number
  void inserAt(int inserAfter, int data) {
    //value stored in new node
    Node newNode = Node(data);
    Node? temp = head;
    while (temp != null && temp.data != inserAfter) {
      temp = temp.next;
    }
    //no inserAfter element found
    if (temp == null) {
      return;
    }

    if (temp == tail) {
      tail!.next = newNode;
      tail = newNode;
      return;
    }
    //inserting inbetween 2 elements
    newNode.next = temp.next;
    temp.next = newNode;
  }

   arrayToLinkedList(List<int> array) {
    for (int i = 0; i < array.length; i++) {
      Node? newNode = Node(array[i]);
      if (i == 0 && head == null) {
        head = newNode;
        tail = newNode;
      } else {
        tail!.next = newNode;
        tail = newNode;
      }
    }
  }

//deleting duplicates in sorted linkedlist
  void deleteDuplicates() {
    Node? current = head;
    if (current == null) {
      return;
    }
    Node? check = head!.next;
    if (check == null) {
      return;
    }

    while (check != null && current != null) {
      if (check.data == current.data) {
        check = check.next;
        current.next = check;
      } else {
        check = check.next;
        current = current.next;
      }
    }
    tail = current;
    print("tail ${tail!.data}");
    if (check == null) {
      return;
    }
  }

  
}

void main(List<String> args) {
  LinkedList link = LinkedList();

  link.addData(4);
  link.addData(4);
  link.addData(4);
  link.addData(6);
  link.addData(6);
  link.addData(7);
  link.addData(8);

  link.addData(8);
  link.addData(9);

  link.deleteDuplicates();
  link.deleteData(7);
  link.inserAt(8, 400);

  link.printData();
}
