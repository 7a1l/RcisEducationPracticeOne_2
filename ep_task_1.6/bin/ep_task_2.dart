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
      nums_txt+= ' ';
    }
  } catch (e) {
    print('Error: $e');
  }
  print(nums_txt);
}