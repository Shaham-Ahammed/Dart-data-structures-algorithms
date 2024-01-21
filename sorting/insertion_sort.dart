void main(List<String> args) {
  insertionSort([90, 5, 32, 1, 5, 64, 3]);
  
  List<int> a = sort([5, 43, 2, 33, 5, 1, 100, 3, 4]);
  print(a);
}

insertionSort(List<int> array) {
  for (var i = 1; i < array.length; i++) {
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

//second method

List<int> sort(List<int> array) {
  for (var i = 1; i < array.length; i++) {
    int previous = i - 1;
    while (previous >= 0 && array[previous] > array[previous+1]) {
      swap(array, previous, previous + 1);
      previous--;
    }
  }

  return array;
}

swap(List<int> array, int i, int j) {
  int temp = array[i];
  array[i] = array[j];
  array[j] = temp;
}
