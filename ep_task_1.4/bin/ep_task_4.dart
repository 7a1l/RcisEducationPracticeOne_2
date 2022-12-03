import 'dart:convert';
import 'dart:io';
import 'dart:async';

void main() async {
  final file = File('numsTask4.txt');
  String numstxt = "";
  Stream<String> lines =
      file.openRead().transform(utf8.decoder).transform(LineSplitter());
  try {
    await for (var line in lines) {
      numstxt += line;
    }
  } catch (e) {
    print('Error: $e');
  }
  List<int> nums = [];
  String num = "";

  for (int i = 0; i < numstxt.length; i++) {
    if (numstxt[i] != " ") {
      num += numstxt[i];
    }
    if (numstxt[i] == " " || i + 1 == numstxt.length) {
      try {
        nums.add(int.parse(num));
      } catch (e) {
        print("Error: $e");
      }
      num = "";
    }
  }
  int result = 0;
  for (int i = 0; i < nums.length - 1; i++) {

    if (nums[i] == nums[i + 1]) {
      result++;

    }

  }
  print(result);
}