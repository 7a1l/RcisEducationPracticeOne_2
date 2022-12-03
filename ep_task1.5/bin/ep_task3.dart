import 'dart:convert';
import 'dart:io';
import 'dart:async';

void main() async {
  final file = File('numsTask3.txt');
  String nums_txt = "";
  Stream<String> lines =
      file.openRead().transform(utf8.decoder).transform(LineSplitter());
  try {
    await for (var line in lines) {
      nums_txt += line;
    }
  } catch (e) {
    print('Error: $e');
  }
  List<int> nums = [];
  String num = "";
  for (int i = 0; i < nums_txt.length; i++) {
    if (nums_txt[i] != " ") {
      num += nums_txt[i];
    }
    if (nums_txt[i] == " " || i + 1 == nums_txt.length) {
      try {
        nums.add(int.parse(num));
      } catch (e) {
        print('введено не число!');
      }
      num = "";
    }
  }
  print(nums);
  int min = 9999;
  int index = 0;
  for(int i = 0; i < nums.length; i++){
     if (nums[i] < min) { 
      min = nums[i];
      index = i; 
    }
  }
  int sum = 0;
  for(int i = 0; i < index; i++){
    sum += nums[i];
  }
  double avg = sum / index;
  print("Cреднее значение чисел до ${nums[index]} = $avg");
}