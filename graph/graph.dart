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
  bfs(int firstElement) {
    List<int> visited = [];
    List<int> queue = [];
    visited.add(firstElement);
    queue.add(firstElement);

    while (queue.isNotEmpty) {
      int currentElement = queue.removeAt(0);
      print("${currentElement} ");

      for (int element in map[currentElement]!) {
        if (!visited.contains(element)) {
          visited.add(element);
          queue.add(element);
        }
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
  graph.bfs(12);
  print("-----");
  graph.dfs(12);
}
