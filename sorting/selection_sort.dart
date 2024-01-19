void main(List<String> args) {
  selectionSort([5, 43, 2, 33, 5, 1, 100, 3, 4]);
}

selectionSort(List<int> array) {
  for (var i = 0; i < array.length; i++) {
    int small = array[i];
    int pos = i;
    for (var j = i+1; j < array.length; j++) {
      if (array[j] < small) {
        small = array[j];
        pos = j;
      }
    }
    int temp = array[i];
    array[i] = small;
    array[pos] = temp;
  }
  print(array);
}
