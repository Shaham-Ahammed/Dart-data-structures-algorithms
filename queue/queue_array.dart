class Queue {
  List<int> array = [];
  enque(int data) {
    array.insert(0, data);
  }

  dequeue() {
    array.removeLast();
  }

  printing() {
    print(array);
  }
}

void main(List<String> args) {
  Queue queue = Queue();
  queue.enque(2);
  queue.enque(34);
  queue.enque(54);
  queue.dequeue();
  queue.printing();
}
