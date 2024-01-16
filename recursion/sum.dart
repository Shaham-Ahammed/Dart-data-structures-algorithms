void main(List<String> args) {
  print(sum(5));
}

int sum(int n) {
  if (n == 0) {
    return 0;
  }
  return n + sum(n - 1);
}
