void main(List<String> args) {
  insertionSort([90, 5, 32, 1, 5, 64, 3]);
}

insertionSort(List<int> array) {
  for (var i = 0; i < array.length; i++) {
    int temp = array[i];
    int j = i - 1;
    while (j >= 0 && array[j] > temp) {
      array[j + 1] = array[j];
      j--;
    }
    array[j + 1] = temp;
  }
  print(array);
}
