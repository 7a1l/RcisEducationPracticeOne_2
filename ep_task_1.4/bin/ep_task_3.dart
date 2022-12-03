import 'dart:convert'; 
import 'dart:io'; 
import 'dart:async'; 
  
void main() async { 

  final file = File('numsTask3.txt'); 
  String numstxt = ""; 

  Stream<String> lines = file 
      .openRead() 
      .transform(utf8.decoder)  
      .transform(LineSplitter()); 
try{ 
    await for (var line in lines) { 
      numstxt += line; 
    } 
  } catch (e) { 
    print('Error: $e'); 
  } 
  List<int> nums = []; 
  String num = ""; 
  for (int i = 0; i < numstxt.length; i++) { 
    if (numstxt[i] != ",") { 
      num += numstxt[i]; 
    } 
    if (numstxt[i] == "," || i + 1 == numstxt.length) { 
      try{
      nums.add(int.parse(num)); 
      }
      catch(e){
        print('Error: $e');
      }
      num = ""; 
    } 
  } 
  int min = nums[0]; 
  int max = nums[0]; 
  for (int i = 1; i < nums.length; i++) { 
    if (nums[i] == 0) { 
      break; 
    } 
    if (nums[i] > max) { 
      max = nums[i]; 
    } 
    if (nums[i] < min) { 
      min = nums[i]; 
    } 
  } 
  double res = max / min;
  print('$max / $min = ' '$res'); 
} 