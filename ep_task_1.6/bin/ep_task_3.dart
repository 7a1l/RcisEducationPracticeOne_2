import 'dart:io';
void main()  {
  int num = 0;
  stdout.write("введите число: ");
  try{num = int.parse(stdin.readLineSync()!);
  }
  catch(e){
    print('вы ввели не число!');
  }
  bool result = isEven(num);
if(result){
  print('Число $num четное и делится на 10');
}else{
  print('число не подходит к данному требованию');
}
}
bool isEven(int num){
  if(num % 2 == 0 && num % 10 == 0){
    return true;
  }
  else{
return false;
  }
}