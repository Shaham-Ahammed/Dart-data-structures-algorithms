
void main() {
  fibnocci(10);
}

fibnocci(int number) {
  finbnocciHelper(number, 0, 1, 1);
}

finbnocciHelper(int number, int start, int end, count) {
  if (count > number) {
    return;
  }
  finbnocciHelper(number, end, start + end, count + 1);
  print(end);
}
