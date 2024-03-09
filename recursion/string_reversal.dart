import 'dart:io';

void main(List<String> args) {
  recursion("hello");
}

recursion(String str, [int value = 0]) {
  if (value == str.length) {
    return;
  }

  recursion(str,value + 1);
  stdout.write(str[value]);
}
