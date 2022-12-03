import 'dart:io';
void main() {
  try{
  List<String> words = File('numsTask1.txt').readAsLinesSync();
  for(var h in words){
    words = h.split(' ');
  }
  int count = 0;
  List<String> result = [];
  for(int i = 0; i < words.length; i++){
    count =  words[i].length;
    if(count % 2  != 0){
      result.add(words[i]);
    }
  }
  print(result);
  }
  catch(e){
    print('файл не найден!');
  }
}