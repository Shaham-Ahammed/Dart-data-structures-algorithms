class Stack {
  List<int> array = [];
  push(int data) {
    array.add(data);
  }

  pop() {
    array.removeLast();
  }

  printing() {
    print(array);
  }
}

void main(List<String> args) {
  Stack stack = Stack();
  stack.push(2);
  stack.push(34);
  stack.push(54);
  stack.pop();
  stack.printing();
}
