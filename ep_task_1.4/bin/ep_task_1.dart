import 'dart:io';  

void main() { 
  stdout.write("введите число: ");
  int num = 0;
   int proiz = 1;
  try{
  num = int.parse(stdin.readLineSync()!);
  }
  catch(e){
    print('Вы ввели не число!');
    proiz = 0;
  }  
  for (int i = 1; i < num; i++) { 
    if (i % 3 == 0) { 
      proiz *= i; 
    } 
  } 
  print("сумма - $proiz"); 
}