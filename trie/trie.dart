class TrieNode {
  Map<String, TrieNode?> children = {};
}

class Trie {
  TrieNode root = TrieNode();
  String endSymbol = "*";

  insert(String str) {
    TrieNode node = root;
    TrieNode newNode = TrieNode();
    for (var i = 0; i < str.length; i++) {   
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

  void delete(String str) {
    if (contains(str)) {
      deleteHelper(root, str, 0);
    }
  }

  bool deleteHelper(TrieNode node, String str, int index) {
    if (index == str.length) {
      node.children.remove(endSymbol);
      return node.children.isEmpty;
    }

    String letter = str[index];

    bool shouldDeleteNode =
        deleteHelper(node.children[letter]!, str, index + 1);

    if (shouldDeleteNode) {
      node.children.remove(letter);
      return node.children.isEmpty; //return true if theres no other branches
    }

    return false;
  }

  //words searching

  displayStringWithPrefix(String prefix) {
    TrieNode node = root;
    for (var i = 0; i < prefix.length; i++) {
      if (node.children.containsKey(prefix[i])) {
        node = node.children[prefix[i]]!;
      } else {
        print("no elemetns with prefix $prefix present in the trie");
        return;
      }
    }
    List<String> elements = [];
    displayStringWithPrefixHelper(node, prefix, elements);
    print(elements);
  }

  displayStringWithPrefixHelper(
      TrieNode node, String currentString, List<String> elements) {
    if (node.children.containsKey(endSymbol)) {
      elements.add(currentString);
    }
    node.children.forEach((key, value) {
      if (key != endSymbol && value != null) {
        displayStringWithPrefixHelper(value, currentString + key, elements);
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
  print(trie.contains("sham"));
  List<String> strings = trie.displayStrings();
  print(strings);
  trie.delete("shambu");
  strings = trie.displayStrings();
  trie.displayStringWithPrefix("ffff");
  
}