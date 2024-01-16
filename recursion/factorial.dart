void main(List<String> args) {
  int num = 5;
  int n = factorial(num);
  print("factorial of $num is $n");
}

int factorial(int n) {
  if (n <= 1) {
    return 1;
  }
  return n * factorial(n - 1);
}
