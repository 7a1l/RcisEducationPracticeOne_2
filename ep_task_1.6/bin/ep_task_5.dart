import 'dart:io';
import 'dart:math';
void main()  {
  stdout.write('введите n: ');
  int n = 0;
  int m = 0;
  try{
   n = int.parse(stdin.readLineSync()!);
  }catch(e){
    print('вы ввели не число!');
  }
  stdout.write('введите m: ');
   try{
   m = int.parse(stdin.readLineSync()!);
  }catch(e){
    print('вы ввели не число!');
  }
  List<List<int>> nums = List.generate(n, (index) => List.generate(m + 1, ((index) => Random().nextInt(2))));
  for(int i = 0; i < n; i++){
    int count = 0;
    for(int j = 0; j < m; j++){
      if(nums[i][j] == 1){
        count++;
      }
    }
    if(count % 2 != 0){
      nums[i][m] = 1;
    }else{
      nums[i][m] = 0;
    }
  }
  for(int i = 0; i < n; i++){
    for(int j = 0; j < m + 1; j++){
      stdout.write('${nums[i][j]} ');
    }
    print('');
  }
}