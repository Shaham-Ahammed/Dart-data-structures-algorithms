void main() {
  print(binary([1, 2, 3, 4, 5, 6, 7, 8, 9], 5));
}

//only works for sorted array 
int binary(List<int> array, int target) {
  int start = 0;
  int end = array.length - 1;
  while (start <= end) {
    int middle = start + (end - start) ~/ 2;
    if (array[middle] == target) {
      return middle;
    } else if (array[middle] < target) {
      start = middle + 1;
    } else if (array[middle] > target) {
      end = middle - 1;
    }
  }
  return -1;
}
