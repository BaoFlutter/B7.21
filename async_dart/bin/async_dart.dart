import 'dart:collection';

import 'package:async_dart/async_dart.dart' as async_dart;

void main(List<String> arguments) async {
  // I. Future
  // 1.1 dùng await - async 
  var number = await makeLateNumber();
  print(number.toString());
  // 1.2 then 
  makeLateNumber().then((number) {
    print("Số vừa lấy được sau từ khoá then: $number ");
  });
  print("Chương trình kết thúc");
  // II. Stream
  // Tạo dữ liệu dạng Stream
  Stream<int> numberStream = Stream<int>.periodic(Duration(seconds: 2),
makeNumber,
);
  //2.1 await - async 
  //printNumberInStream(numberStream);

  //2.1  listen 
  /*
  numberStream.listen((number) {
    print("Số lấy từ Stream sử dụng listen: $number");
   });
   */
   // async* , yield 
   Stream<int> numberStreamFromYield = countStream(10);

  numberStreamFromYield.listen((number) {
    print("Số lấy từ Count Stream sử dụng listen: $number");
   });

}

// Tạo dữ liệu dạng Stream kiểu int với yield ,async* 
Stream<int> countStream(int max)async*
{
  for (int i = 0; i<= max; i++)
    yield i; 
}

printNumberInStream(Stream<int> stream) async {
  await for (int number in stream)
  {
    print(number.toString());
  }
}




// => value  : { return value; }
int makeNumber(int value) => (value + 1); 

// Tạo dữ liệu dạng Future
Future<int> makeLateNumber(){
  return Future.delayed(
    (Duration(seconds: 2)), 
    (){ return 10; }
    );
}
