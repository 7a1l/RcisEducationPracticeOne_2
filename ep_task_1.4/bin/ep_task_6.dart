import 'dart:io';

void main() {
  int x1 = -2;
  int x2 = 0;
  int x3 = 2;
  int y1 = -3;
  int y2 = 2;
  int y3 = -3;
  double x0 = 0;
  double y0 = 0;
  stdout.write("Введите A (x): ");
  try{
  x0 = double.parse(stdin.readLineSync()!);
  }catch(e){
    print(' вы ввели не число!');
  }
  stdout.write("Введите B (y): ");
  try{
  y0 = double.parse(stdin.readLineSync()!);
  }catch(e){
    print('Вы ввели не число!');
  }
  double a = (x1 - x0) * (y2 - y1) - (x2 - x1) * (y1 - y0);
  double b = (x2 - x0) * (y3 - y2) - (x3 - x2) * (y2 - y0);
  double c = (x3 - x0) * (y1 - y3) - (x1 - x3) * (y3 - y0);

  if ((a >= 0 && b >= 0 && c >= 0) || (a <= 0 && b <= 0 && c <= 0)) {
    print("Точка ($x0 : $y0) входит в заданную область.");
  } else {
    print("Точка ($x0 : $y0) не входит в заданную область.");
  }
}