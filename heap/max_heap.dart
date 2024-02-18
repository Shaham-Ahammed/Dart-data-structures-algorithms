import 'dart:io';

class MaxHeap {
  late List<int> heap;
  MaxHeap(List<int> array) {
    heap = array;
    buildHeap(heap);
  }
  buildHeap(List<int> array) {
    for (int i = parent(heap.length - 1); i >= 0; i--) {
      shiftDown(i);
    }
  }

  shiftDown(int currentidx, [int? endIdxForHeapSort]) {
    int leftIdx = leftChild(currentidx);
    int endIdx =
        endIdxForHeapSort == null ? heap.length - 1 : endIdxForHeapSort;
    while (leftIdx <= endIdx) {
      int rightIdx = rightChild(currentidx);
      int? indexToShift;
      if (rightIdx <= endIdx && heap[rightIdx] > heap[leftIdx]) {
        indexToShift = rightIdx;
      } else {
        indexToShift = leftIdx;
      }
      if (heap[currentidx] < heap[indexToShift]) {
        swap(heap, currentidx, indexToShift);
        currentidx = indexToShift;
        leftIdx = leftChild(currentidx);
      } else {
        return;
      }
    }
  }

  swap(List<int> array, int i, int j) {
    int temp = array[i];
    array[i] = array[j];
    array[j] = temp;
  }

  shiftUp(int currentidx) {
    int parentIdx = parent(currentidx);
    while (currentidx > 0 && heap[parentIdx] < heap[currentidx]) {
      swap(heap, parentIdx, currentidx);
      currentidx = parentIdx;
      parentIdx = parent(currentidx);
    }
  }

  insert(int data) {
    heap.add(data);
    shiftUp(heap.length - 1);
  }

  remove() {
    swap(heap, heap.length - 1, 0);
    heap.removeAt(heap.length - 1);
    shiftDown(0);
  }

  heapSort() {
    int end = heap.length - 1;
    while (end > 0) {
      swap(heap, 0, end);
      shiftDown(0, end - 1);
      end--;
    }
    print(heap);
  }

  int parent(int i) {
    return (i - 1) ~/ 2;
  }

  int leftChild(int i) {
    return (2 * i) + 1;
  }

  int rightChild(int i) {
    return (2 * i) + 2;
  }

  dislay() {
    for (int i = 0; i < heap.length; i++) {
      stdout.write("${heap[i]} ");
    }
  }
}

void main(List<String> args) {
  List<int> array = [4, 8, 65, 3, 23, 1, 20, 5];
  MaxHeap heap = MaxHeap(array);
  heap.insert(100);
  heap.insert(12);
  heap.insert(55);
  heap.insert(2);
  heap.insert(6);

  heap.insert(67);

  heap.dislay();
  print("\n");
  heap.heapSort();
}
