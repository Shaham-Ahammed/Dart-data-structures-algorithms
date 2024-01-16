class Node {
  int? data;
  Node? next;
  Node? prev;
  Node(int data) {
    this.data = data;
  }
}

class LinkedList {
  Node? head;
  Node? tail;
  void addData(int data) {
    Node newNode = Node(data);
    if (head == null) {
      head = newNode;
      tail = newNode;
    } else {
      newNode.prev = tail;
      tail!.next = newNode;
      tail = newNode;
    }
  }

  void displayData() {
    Node? temp = head;
    if (temp == null) {
      print("no data");
    }
    while (temp != null) {
      print("${temp.data}");
      temp = temp.next;
    }
  }

  void displayReverse() {
    Node? temp = tail;

    while (temp != null) {
      print("${temp.data}");
      temp = temp.prev;
    }
  }

  void delete(int data) {
    Node? temp = head;
    if (temp == null) {
      return;
    }
    if (temp.data == data) {
      if (head!.next != null) {
        head = temp.next;
        head!.prev = null;
      } else {
        head = null;
      }

      return;
    }
    while (temp != null && temp.data != data) {
      temp = temp.next;
    }
    if (temp == null) {
      return;
    }
    if (temp == tail) {
      tail = temp.prev;
      tail!.next = null;
      return;
    }
    Node? before = temp.prev;

    Node? after = temp.next;
    after!.prev = before;
    before!.next = after;
  }

  void InsertingAfter(int after, int data) {
    Node? temp = head;
    Node newNode = Node(data);
    if (temp == null) {
      return;
    }
    while (temp != null && temp.data != after) {
      temp = temp.next;
    }
    if (temp == null) {
      return;
    }
    if (temp == tail) {
      Node? tempor = tail;
      tail!.next = newNode;
      tail = newNode;
      tail!.prev = tempor;
      tail!.next = null;
      return;
    }
    Node? aft = temp.next;
    temp.next = newNode;
    newNode.prev = temp;
    newNode.next = aft;
    aft!.prev = newNode;
  }

  void insertingBefore(int before, int data) {
    Node? newNode = Node(data);
    Node? temp = head;
    if (temp == null) {
      return;
    }
    if (temp.data == before) {
      Node? tempor = head;
      head = newNode;
      tempor!.prev = head;
      head!.next = tempor;
      head!.prev = null;
      return;
    }
    while (temp != null && temp.data != before) {
      temp = temp.next;
    }
    if (temp == null) {
      return;
    }
    Node? bef = temp.prev;
    temp.prev = newNode;
    newNode.next = temp;
    newNode.prev = bef;
    bef!.next = newNode;
  }
}

void main(List<String> args) {
  LinkedList list = LinkedList();
  list.addData(5);
  list.addData(7);
  list.addData(9);
  list.addData(13);
  list.addData(1);

  list.insertingBefore(9, 100);
  list.InsertingAfter(100, 1000);
  list.displayData();
}
