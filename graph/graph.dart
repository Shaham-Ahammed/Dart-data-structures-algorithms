import 'dart:io';

class Graph {
  Map<int, List<int>> map = {};

  addToMap(int value) {
    map[value] = [];
  }

  insert(int vertex, int edge, bool isBirectional) {
    if (!map.containsKey(vertex)) {
      addToMap(vertex);
    }
    if (!map.containsKey(edge)) {
      addToMap(edge);
    }
    map[vertex]!.add(edge);

    if (isBirectional) {
      map[edge]!.add(vertex);
    }
  }

  delete(int vertex) {
    if (map.containsKey(vertex)) {
      map.remove(vertex);
    }
    map.forEach((key, value) {
      if (value.contains(vertex)) {
        value.remove(vertex);
      }
    });
  }

  display() {
    print(map);
  }

  //breadth first search

 bfs(int startValue) {
    List<int> allValues = [];
    map.forEach((key, value) {
      allValues.add(key);
    });
    List<int> queue = [];
    queue.add(startValue);
    while (queue.isNotEmpty) {
      int currentValue = queue.removeAt(0);
      stdout.write("$currentValue ");
      allValues.remove(currentValue);
      for (int elements in map[currentValue]!) {
        if (allValues.contains(elements)) {
          queue.add(elements);
        }
      }
      if (queue.isEmpty && allValues.isNotEmpty) {
        queue.add(allValues[0]);
      }
    }
  }

  //deapth first search

  dfs(int startIndex) {
    List<int> allValues = [];
    map.forEach((key, value) {
      allValues.add(key);
    });
    dfsHelper(startIndex, allValues);
  }

  dfsHelper(int currentIndex, List<int> allValues) {
    print("$currentIndex ");

    allValues.remove(currentIndex);
    for (int element in map[currentIndex]!) {
      if (allValues.contains(element)) {
        dfsHelper(element, allValues);
      }
    }
    if (allValues.isNotEmpty) {
      dfsHelper(allValues[0], allValues);
    }
  }
}

void main(List<String> args) {
  Graph graph = Graph();
  graph.insert(12, 3, false);
  graph.insert(12, 5, true);
  graph.insert(3, 7, true);
  graph.insert(7, 9, true);
  // graph.delete(3);
  graph.display();
  graph.bfs(3);
  print("\n-----");
  graph.dfs(7);
}
