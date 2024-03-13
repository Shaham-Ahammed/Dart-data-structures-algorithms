import 'dart:io';

class MinHeap {
  late List<int> heap;

  MinHeap(List<int> array) {
    heap = array;
    buildHeap(array);
  }

  buildHeap(List<int> array) {
    for (int i = parent(heap.length - 1); i >= 0; i--) {
      shiftDown(i);
    }
  }

  shiftDown(int currentIdx) {
    int endIdx = heap.length - 1;
    int leftIdx = leftChild(currentIdx);
    while (leftIdx <= endIdx) {
      int rightIdx = rightChild(currentIdx);
      int? indexToShift;
      if (rightIdx<=endIdx && heap[rightIdx] < heap[leftIdx]) {
        indexToShift = rightIdx;
      } else {
        indexToShift = leftIdx;
      }
      if (heap[currentIdx] > heap[indexToShift]) {
        swap(heap, currentIdx, indexToShift);
        currentIdx = indexToShift;
        leftIdx = leftChild(currentIdx);
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

  shiftUp(int currentIdx) {
    int parentIdx = parent(currentIdx);
    while (currentIdx > 0 && heap[parentIdx] > heap[currentIdx]) {
      swap(heap, currentIdx, parentIdx);
      currentIdx = parentIdx;
      parentIdx = parent(currentIdx);
    }
  }

  int peek() {
    return heap[0];
  }

  remove() {
    swap(heap, heap.length - 1, 0);
    heap.removeAt(heap.length - 1);
    shiftDown(0);
  }

  insert(int value) {
    heap.add(value);
    shiftUp(heap.length - 1);
  }

  int parent(int i) {
    return ((i - 1) ~/ 2);
  }

  int leftChild(int i) {
    return (2 * i) + 1;
  }

  int rightChild(int i) {
    return (2 * i) + 2;
  }

  display() {
    for (int i = 0; i < heap.length; i++) {
      stdout.write("${heap[i]} ");
    }
  }
}

void main(List<String> args) {
  List<int> array = [3, 7, 5, 9, 87, 6, 45, 2, 12, 53];
  MinHeap heap = MinHeap(array);
  heap.insert(1);
  heap.insert(5);
  heap.insert(15);
  heap.display();
  print("\n");
  print(heap.peek());
  heap.remove();
  print("\n");
  heap.display();
}
