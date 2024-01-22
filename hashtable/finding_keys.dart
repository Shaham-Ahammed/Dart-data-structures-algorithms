void main(List<String> args) {
  Map<String, int> fruits = {"apple": 3, "orange": 7, "banana": 4, "mango": 3};
  List<String> array = [];

  fruits.forEach((key, value) {
    if (value == 3) {
      array.add(key);
    }
  });
  print(array);
}
