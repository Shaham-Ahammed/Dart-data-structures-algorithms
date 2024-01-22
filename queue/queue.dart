class Node {
  int? data;
  Node? next;
  Node(int data) {
    this.data = data;
  }
}

class Queue {
  Node? front;
  Node? rear;
  enqueue(int data) {
    Node newNode = Node(data);
    if (rear == null) {
      front = rear = newNode;
    } else {
      rear!.next = newNode;
      rear = newNode;
    }
  }

  dequeue() {
    if (front == null) {
      return;
    } else {
      front = front!.next;
    }
  }

  printData() {
    Node? temp = front;
    if (temp == null) {
      rear = null;
      print("queue is empty");
    }
    while (temp != null) {
      print("${temp.data}" "");
      temp = temp.next;
    }
  }
}

void main(List<String> args) {
  Queue queue = Queue();
  queue.enqueue(12);
  queue.enqueue(34);
  queue.enqueue(550);
  queue.dequeue();
  queue.dequeue();
  queue.dequeue();
  queue.printData();
}
