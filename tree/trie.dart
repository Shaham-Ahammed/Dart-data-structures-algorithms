class TrieNode {
  Map<String, TrieNode?> children = {};
}

class Trie {
  TrieNode root = TrieNode();
  String endSymbol = "*";
  insert(String str) {
    TrieNode node = root;
    for (var i = 0; i < str.length; i++) {
      TrieNode newNode = TrieNode();
      String letter = str[i];
      if (!node.children.containsKey(letter)) {
        node.children.addAll({letter: newNode});
      }
      node = node.children[letter]!;
    }
    node.children.addAll({endSymbol: null});
  }

  contains(String str) {
    TrieNode node = root;
    for (var i = 0; i < str.length; i++) {
      String letter = str[i];

      if (!node.children.containsKey(letter)) {
        return false;
      }
      node = node.children[letter]!;
    }
    return node.children.containsKey(endSymbol);
  }

  List<String> displayStrings() {
    List<String> elements = [];
    containsString(root, "", elements);
    return elements;
  }

  containsString(TrieNode node, String currentString, List<String> elements) {
    if (node.children.containsKey(endSymbol)) {
      elements.add(currentString);
    }
    node.children.forEach((key, value) {
      if (key != endSymbol && value != null) {
        containsString(value, currentString + key, elements);
      }
    });
  }
}

void main(List<String> args) {
  Trie trie = Trie();
  trie.insert("shaham");
  trie.insert("ab");
  trie.insert("sha");
  trie.insert("shambu");
  print(trie.contains("shambu"));
  List<String> strings = trie.displayStrings();
  print(strings);
}
