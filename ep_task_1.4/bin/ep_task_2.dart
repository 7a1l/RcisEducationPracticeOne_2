import 'dart:convert'; 
import 'dart:io'; 
import 'dart:async'; 
  
void main() async { 
  final file = File('numsTask2.txt'); 
  String nums_txt = ""; 
  Stream<String> lines = file 
      .openRead() 
      .transform(utf8.decoder)  
      .transform(LineSplitter());  
  try { 
    await for (var line in lines) { 
      nums_txt += line; 
    } 
  } catch (e) { 
    print('Error: $e'); 
  } 
  
  List<double> nums = []; 
  String num = ""; 
  double res = 0; 
  
  for (int i = 0; i < nums_txt.length; i++) { 
    if (nums_txt[i] != ";") { 
      num += nums_txt[i]; 
    } 
    if (nums_txt[i] == ";" || i + 1 == nums_txt.length) { 
      try{
      nums.add(double.parse(num)); 
      }
      catch(e) {
        print('Error: $e');
      }
      num = ""; 
    } 
  } 
  for (int i = 0; i < nums.length; i++) { 
    if (nums[i] > 0) { 
      res += nums[i]; 
    } 
    if (nums[i] == 0) { 
      break; 
    } 
  } 
  print("сумма - $res "); 
} 