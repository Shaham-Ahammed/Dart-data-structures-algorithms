class TrieNode {
  Map<String, TrieNode?> children = {};
}

//prefix tree

class Trie {
  TrieNode root = TrieNode();
  String endSymbol = "*";
  Trie(String str) {
    populatePrefixTrie(str);
  }
  populatePrefixTrie(String str) {
    for (var i = 0; i < str.length; i++) {
      insertSubstringStaringAtIndex(i, str);
    }
  }

  insertSubstringStaringAtIndex(int index, String str) {
    TrieNode node = root;
    for (var i = index; i < str.length; i++) {
      String letter = str[i];
      if (!node.children.containsKey(letter)) {
        TrieNode newNode = TrieNode();
        node.children.addAll({letter: newNode});
      }
      node = node.children[letter]!;
    }
    node.children.addAll({endSymbol: null});
  }

  bool contains(String str) {
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
}

void main(List<String> args) {
  Trie trie = Trie("catty");
  print(trie.contains("tty"));
   print(trie.contains("cat"));
}
