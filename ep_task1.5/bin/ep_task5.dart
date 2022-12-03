import 'dart:convert';
import 'dart:io';
import 'dart:async';

void main() async {
  final file = File('numsTask5.txt');
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
  int index_max = 0;
  int index_min = 0;
  int min = nums[0];
  int max = nums[0];
  for(int i = 0; i< nums.length; i++){
    if(min> nums[i]){
      min = nums[i];
      index_min = i;
    }
    if(max < nums[i]){
      max = nums[i];
      index_max = i;
    }
  }
  int sum = 0;
  if(index_min < index_max){
  for(int i = index_min + 1; i < index_max; i++){
    sum+= nums[i];
  }
  }
  else{
    for(int i = index_max + 1; i < index_min; i++){
    sum+= nums[i];
  }
  }
  int count = (index_max.abs() - index_min.abs()).abs() - 1;
  double avg = sum / count;
  print(nums);
  print("среднее чисел расположенных между $min и $max = $avg");
}