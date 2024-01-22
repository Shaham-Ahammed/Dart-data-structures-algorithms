void main(List<String> args) {
  List<int> nums = [1, 4, 5, 6, 6, 6, 5, 3, 2, 4];
  Map<int, int> count = {};
  nums.forEach((element) {
    if (count.containsKey(element)) {
      count[element] = count[element]! + 1;
    } else {
      count[element] = 1;
    }
  });
  int? maxKey;
  int maxCount = 0;
  ;
  count.forEach((key, value) {
    if (value > maxCount) {
      maxCount = value;
      maxKey = key;
    }
  });
  print("most occured value is $maxKey");
}
