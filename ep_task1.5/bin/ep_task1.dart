import 'dart:convert';
import 'dart:io';
import 'dart:async';

void main() async {
  final file = File('numsTask1.txt');
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
  int min = nums[0];
  int index = 0;
  for(int i = 1; i < nums.length; i++){
    if (nums[i] < min) { 
      min = nums[i];
      index = i; 
    } 
  }
  int sum = 0;
  for(int i = index + 1; i < nums.length; i++){
    sum+= nums[i];
  }
  print("минимальное число - ${nums[index]} \n$sum - сумма");
}