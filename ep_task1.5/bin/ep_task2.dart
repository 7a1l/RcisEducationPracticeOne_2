import 'dart:convert';
import 'dart:io';
import 'dart:async';

void main() async {
  final file = File('numsTask2.txt');
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
  List<double> nums = [];
  String num = "";
  for (int i = 0; i < nums_txt.length; i++) {
    if (nums_txt[i] != ";") {
      num += nums_txt[i];
    }
    if (nums_txt[i] == ";" || i + 1 == nums_txt.length) {
      try {
        nums.add(double.parse(num));
      } catch (e) {
        print('введено не число!');
      }
      num = "";
    }
  }
List<double> sorted = sort(nums);
  String res = sorted.toString();
   File out = await File('numsTask2.txt').writeAsString(res);
}
List<double> sort(List<double> nums){
  double swap = 0;
  for (int i = 0; i < nums.length - 1; i++){
    for (int j = 0; j < nums.length - i - 1; j++){
      if (nums[j] > nums[j + 1]){
        swap = nums[j];
        nums[j] = nums[j+1];
        nums[j+1] = swap;
        }
    }
  }
  return nums;
}