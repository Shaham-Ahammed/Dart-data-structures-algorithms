void main(List<String> args) {
  quickSort([5, 43, 2, 33, 5, 1, 100, 3, 4]);
}

quickSort(List<int> array) {
  quickSortHelper(array, 0, array.length - 1);
  print(array);
}

quickSortHelper(List<int> array, int startIndex, int endIndex) {
  if (startIndex >= endIndex) {
    return;
  }
  int pivotIndex = startIndex;
  int leftIndex = startIndex + 1;
  int rightIndex = endIndex;
  while (leftIndex <= rightIndex) {
    if (array[leftIndex] >= array[pivotIndex] &&
        array[rightIndex] <= array[pivotIndex]) {
      swap(array, leftIndex, rightIndex);
      leftIndex++;
      rightIndex--;
    }
    if (array[leftIndex] < array[pivotIndex]) {
      leftIndex++;
    }
    if (array[rightIndex] > array[pivotIndex]) {
      rightIndex--;
    }
  }
  swap(array, rightIndex, pivotIndex);
  quickSortHelper(array, startIndex, rightIndex - 1);
  quickSortHelper(array, rightIndex + 1, endIndex);
}

swap(List<int> array, int i, int j) {
  int temp = array[i];
  array[i] = array[j];
  array[j] = temp;
}
