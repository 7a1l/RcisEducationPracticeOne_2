import 'dart:io';
import 'dart:convert';

void main() {
  final datenow = DateTime.now();
  print(datenow);
  var space = '\t\t\t\t\t';
  var tasks = {};
  stdout.write('Если вы уже имеете задачи, напишите "1"/ иначе введите "0" : ');
  try {
    int z = int.parse(stdin.readLineSync()!);
    if (z == 1) {
      var myFile = File('tasks.json');
      String student = jsonDecode(myFile.readAsStringSync()).toString();

      student += ', ';
      List<String> dats = [];
      String word = '';
      for (int i = 0; i < student.length; i++) {
        if (student[i] == '{' || student[i] == '}') {
          continue;
        }
        if (student[i] == ':' && student[i + 1] == ' ') {
          dats.add(word);
          word = '';
        } else if (student[i] == ',') {
          word = '';
          i++;
        } else {
          word += student[i];
        }
      }
      List<String> task = [];
      for (int i = 0; i < student.length; i++) {
        if (student[i] == '{' || student[i] == '}') {
          continue;
        }
        if (student[i] == ',' &&
            (student[i + 1] == ' ' || i == (student.length))) {
          task.add(word);
          word = '';
        } else if (student[i] == ':' && student[i + 1] == ' ') {
          i++;
          word = '';
        } else {
          word += student[i];
        }
      }
      for (int i = 0; i < task.length; i++) {
        final data = DateTime.parse(dats[i]);
        tasks.addAll({data: task[i]});
      }
      print('Ваши задачи восстановленны!');
    }
  } catch (e) {
    print('вы ввели не число!');
  }
  print('$space ________________________________________');
  print("$space|Возможности ежедневника: \t\t|");
  stdout.write(
      "$space|1 - добавить задачи\t\t\t|\n$space|2 - удалить задачи\t\t\t|\n$space|3 - редактировать задачи\t\t|\n$space|4 - просмотреть все задачи\t\t|\n$space|5 - просмотреть прошедшие задачи\t|\n$space|6 - просмотреть невыполненные задачи\t|\n$space|7 - просмотреть задачи за период\t|\n");
  print('$space-----------------------------------------');
  while (1 != 0) {
    String n = '';
    stdout.write('Введите число(ДЛЯ ЗАВЕРШЕНИЯ РАБОТЫ ВВЕДИТЕ 0): ');
    n = (stdin.readLineSync()!);
    if (n == '0') {
      break;
    }
    switch (n) {
      case '1':
        {
          var date;
          stdout.write('введите дату задачи(В виде "ГОД-МЕСЯЦ-ДЕНЬ"): ');
          try {
            date = DateTime.parse(stdin.readLineSync()!);
          } catch (e) {
            print('Введена неправильная дата\n');
            continue;
          }
          stdout.write('введите задачу: ');
          String task = stdin.readLineSync()!;
          tasks.addAll({date: task});
          print('вы успешно добавили задачу!\n\n');
          continue;
        }
      case '2':
        {
          if (tasks.isNotEmpty) {
            var num;
            stdout.write(
                'Введите дату задачи, которую нужно удалить(В виде "ГОД-МЕСЯЦ-ДЕНЬ"): ');
            try {
              num = DateTime.parse(stdin.readLineSync()!);
            } catch (e) {
              print('Введена неправильная дата\n');
              continue;
            }
            tasks.remove(num);
            print('Вы успешно удалили задачу!\n\n');
          } else {
            print("Ваш список задач пуст!");
          }
          continue;
        }
      case '3':
        {
          bool check = false;
          if (tasks.isNotEmpty) {
            var date;
            stdout.write(
                'Введите дату задачи, которую хотите редактировать(В виде "ГОД-МЕСЯЦ-ДЕНЬ"): ');
            try {
              date = DateTime.parse(stdin.readLineSync()!);
            } catch (e) {
              print('Введена неправильная дата\n');
              continue;
            }
            stdout.write('введите отредактрованную задачу: ');
            String task = stdin.readLineSync()!;
            for (var key in tasks.keys) {
              if (key == date) {
                tasks[key] = task;
                check = true;
              }
            }
            if (check) {
              print('Вы успешно отредактировали задачу!\n\n');
            } else {
              print('Введена неверная дата!');
            }
          } else {
            print("Ваш список задач пуст!");
          }
          continue;
        }
      case '4':
        {
          if (tasks.isNotEmpty) {
            print('Ваши задачи:');
            for (var key in tasks.keys) {
              print('$key - ${tasks[key]}');
            }
            print('\n\n');
          } else {
            print("Ваш список задач пуст!");
          }
          continue;
        }
      case '5':
        {
          var today = DateTime.now();
          today.toUtc();
          if (tasks.isNotEmpty) {
            print('Выполненные задачи: ');
            for (var key in tasks.keys) {
              if (today.isAfter(key)) {
                print('$key - ${tasks[key]}');
              }
            }
            print('\n\n');
          } else {
            print("Ваш список задач пуст!");
          }
          continue;
        }
      case '6':
        {
          var today = DateTime.now();
          today.toUtc();
          if (tasks.isNotEmpty) {
            print('Предстоящие задачи:');
            for (var key in tasks.keys) {
              if (today.isBefore(key)) {
                print('$key - ${tasks[key]}');
              }
            }
            print('\n\n');
          } else {
            print("Ваш список задач пуст!");
          }
          continue;
        }
      case '7':
        {
          if (tasks.isNotEmpty) {
            var today = DateTime.now();
            today.toUtc();
            print('Выберите период задач: ');
            stdout.write('1 - Сегодня\n2 - Завтра\n3 - Неделя\n');
            String period = stdin.readLineSync()!;
            switch (period) {
              case '1':
                {
                  for (var key in tasks.keys) {
                    var day = key.day;
                    if (day == today.day) {
                      print('$key - ${tasks[key]}');
                    }
                  }
                  continue;
                }

              case '2':
                {
                  var today = DateTime.now();
                  today.toUtc();
                  for (var key in tasks.keys) {
                    var diff = key.difference(today);
                    if ((diff.inDays <= 2) && (key.day != today.day)) {
                      print('$key - ${tasks[key]}');
                    }
                  }
                  continue;
                }
              case '3':
                {
                  var today = DateTime.now();
                  today.toUtc();
                  for (var key in tasks.keys) {
                    var diff = key.difference(today);
                    if (diff.inDays <= 7 && diff.inDays >= 0) {
                      print('$key - ${tasks[key]}');
                    }
                  }
                }
                print('\n\n');
            }
          } else {
            print("Ваш список задач пуст!");
          }
          continue;
        }
      default:
        {
          print('вы ввели не правильное число!');
          continue;
        }
    }
  }
  Map<String, String> zxc = {};
  for (var key in tasks.keys) {
    String p = key.toString();
    zxc.addAll({p: tasks[key]});
    var myFile = File('tasks.json');
    var encoder = JsonEncoder.withIndent(' ');
    myFile.writeAsStringSync(encoder.convert(zxc));
  }
}
