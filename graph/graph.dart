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
  
  bfs(int startIndex) {
    Set<int> allValues = {};
    List<int> visited = [];
    List<int> queue = [];
    map.forEach((key, value) {
      allValues.add(key);
      value.forEach((element) {
        allValues.add(element);
      });
    });
    queue.add(startIndex);

    while (queue.isNotEmpty) {
      int currentVertex = queue.removeAt(0);
      stdout.write("${currentVertex} ");
      visited.add(currentVertex);
      allValues.remove(currentVertex);
      
      for (int element in map[currentVertex]!) {
        if (!visited.contains(element)) {
          queue.add(element);
        }
      }
      if (queue.isEmpty && allValues.isNotEmpty) {
        queue.add(allValues.first);
      }
    }
  }

  //deapth first search
  dfs(int firstElement) {
    List<int> visited = [];
    _dfsHelper(firstElement, visited);
  }

  _dfsHelper(int currentVertex, List<int> visited) {
    visited.add(currentVertex);
    print("${currentVertex} ");
    for (int element in map[currentVertex]!) {
      if (!visited.contains(element)) {
        _dfsHelper(element, visited);
      }
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
//  print("-----");
  // graph.dfs(12);
  
}
