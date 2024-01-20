void main(List<String> args) {
  List<int> sortedArray = mergeSort([90, 5, 32, 1, 5, 64, 3]);
  print(sortedArray);
}

List<int> mergeSort(List<int> array) {
  if (array.length <= 1) {
    return array;
  }
  int middleIndex = array.length ~/ 2;
  List<int> firstHalf = array.sublist(0, middleIndex);
  List<int> secondHalf = array.sublist(middleIndex);
  return join(mergeSort(firstHalf), mergeSort(secondHalf));
}

List<int> join(List<int> firstHalf, List<int> secondHalf) {
  int i = 0;
  int j = 0;

  List<int> array = [];
  while (i < firstHalf.length && j < secondHalf.length) {
    if (firstHalf[i] < secondHalf[j]) {
      array.add(firstHalf[i++]);
   
    } else {
      array.add(secondHalf[j++]);
     
    }
  }
  while (i < firstHalf.length) {
    array.add(firstHalf[i++]);
 
  }
  while (j < secondHalf.length) {
    array.add(secondHalf[j++]);
  
  }
  return array;
}
