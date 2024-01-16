void main(List<String> args) {
  funct(5);
}

funct(int n) {
  if (n <= 0) {
    return;
  }
  print(n);
  funct(n - 1);
  print(n);
}
