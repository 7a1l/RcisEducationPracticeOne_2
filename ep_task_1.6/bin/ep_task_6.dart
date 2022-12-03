import 'dart:math';
void main()  {
  List<double> positive = [];
  List<double> neggative = [];
  List<double> nums = List.generate(Random().nextInt(5) + 1, (index) => (Random().nextDouble() * (20) + -10));
  for(int i = 0; i< nums.length; i++){
    if(nums[i] < 0){
      neggative.add(nums[i]);
    }
    else{
      positive.add(nums[i]);
    }
  }
  print(nums);
  print('положительные числа - $positive');
  print('отрицательные числа - $neggative');
}
