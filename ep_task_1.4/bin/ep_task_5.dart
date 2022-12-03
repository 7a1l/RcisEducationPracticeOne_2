import 'dart:io';  
void main() { 
  int x_left = -1; 
  int x_right = 3; 
  int y_left = -2; 
  int y_right = 4; 
  double b = 0;
  double a = 0;
  stdout.write("Введите А: "); 
  try{
  a = double.parse(stdin.readLineSync()!);
  }catch(e){
    print('введено не число!');
  } 
  stdout.write("Введите В: "); 
   try{
   b = double.parse(stdin.readLineSync()!); 
  }catch(e){
    print('введено не число!');
  } 
  if ((x_left < a && a < x_right) && (y_left < b && b < y_right)) { 
    print("Точка ($a : $b) входит в заданную область."); 
  } else { 
    print("Точка ($a : $b) не входит в заданную область."); 
  } 
} 