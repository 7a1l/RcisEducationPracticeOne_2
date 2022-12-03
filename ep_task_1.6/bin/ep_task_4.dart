import 'dart:io';
void main()  {
  List<int> nums = [];
  int a = 0;
  while(1!= 0){
  stdout.write('введите число A: ');
  try{
  a = int.parse(stdin.readLineSync()!);
  }
  catch(e){
    print('вы ввели не число!');
    continue;
  }
  if(a < 0){
    continue;
  }
  else{
    break;
  }
  }
  while(1 != 0){
  stdout.write("введите число: ");
  int num = 0;
    try{
   num = int.parse(stdin.readLineSync()!);
  }
  catch(e){
    print('вы ввели не число!');
    continue;
  }
  if(num < 0){
    break;
  }else{
  nums.add(num);
  }
  }
  int sum = 0;
  for(int i = 0; i < nums.length; i++){
    if(nums[i] % a == 0){
      sum+= nums[i];
    }
  }
  print('сумма чисел кратных $a = $sum');
}