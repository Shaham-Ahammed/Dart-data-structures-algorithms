void main(List<String> args) {
  sort([5, 4, 33, 100, 3, 5, 9, 2]);
}

sort(List<int> array) {
  int count = array.length;
  for (var i = 0; i < array.length ; i++) {
    for (var j = 0; j < count - 1; j++) {
      int small = j;
      int large = j + 1;
      if (array[small] > array[large]) {
        int temp = array[small];
        array[small] = array[large];
        array[large] = temp;
      }
    }
    count--;
  }
  print(array);
}
