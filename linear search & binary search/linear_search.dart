void main(List<String> args) {
  List<int> array = [3, 2, 5, 6, 4, 1];
  print(position(array, 5));
}

int position(List<int> arr, int target) {
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] == target) {
      return i;
    }
  }
  return -1;
}
