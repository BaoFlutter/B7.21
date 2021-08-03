import 'dart:io';

import 'package:try_catch_dart/try_catch_dart.dart' as try_catch_dart;

void main(List<String> arguments) {
 
 var number = "test" ;
/*
try{
 int result = int.parse(number);
}
on HttpException{
  print("Bạn đã nhập không phải số tự nhiên");
}
catch(e)
{
print(e.toString());
}
*/

/* // try - catch - finally 
try{
 int result = int.parse(number);
}
catch(e)
{
print(e.toString());
}
finally{
  print("Lệnh này bắt buộc được chạy !");
}
*/

/*
// try - finally 
try{
 int result = int.parse(number);
}
finally{
  print("Lệnh này bắt buộc được chạy !");
}
*/



// throw Exception 
kiemTraTuoi(-5);

print("Chương trình kết thúc");




 //print(result.toString());
 }

 void kiemTraTuoi(int tuoi) {
if(tuoi<= 0) {
throw new FormatException("Tuổi không được âm");
}
else if (tuoi>60)
{
print ("Bạn đã già");
}
else print ("Bạn vẫn còn trẻ");
}
 
