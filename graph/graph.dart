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

  display() {
    print(map);
  }
}

void main(List<String> args) {
  Graph graph = Graph();
  graph.insert(12, 3, false);
  graph.insert(12, 5, true);
  graph.display();
}
