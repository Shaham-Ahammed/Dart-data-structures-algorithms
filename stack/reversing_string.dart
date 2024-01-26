class Stack {
  List<String>? StringList;

  Stack(String data) {
    StringList = data.split("");
  }

  String? pop() {
    if (StringList!.length != 0) {
      return StringList!.removeLast();
    }
    return null;
  }

  reverse() {
    String rev = "";
    while (StringList!.length != 0) {
      rev += pop()!;
    }
    print(rev);
  }
}

void main(List<String> args) {
  Stack stack = Stack("abcdefg");
  stack.reverse();
}
