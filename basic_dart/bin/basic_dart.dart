import 'package:basic_dart/basic_dart.dart' as basic_dart;

bool isOutSide = true;
void main(List<String> arguments) {

  int number = 10; 
  print("Cách 1 - Số vừa đặt là: " + number.toString());
  print("Cách 2 - Số vừa đặt là: $number");

  double? value ; // Nulable , value = null; 
  double? value0; 
  // Dart SDK >= 2.12.0 => Nonnullable // int number;  number chưa được gán

  double value1 = 4.5; 

  double soThapPhan = 6.8;
  bool isLogined = false ; 
  isLogined = true; 
  print(isLogined.toString());

  String userName = "Báo Flutter" ;
  print("Tên tôi là: " + userName);
 
  List<int> numberList1 = []; 
  List<int> numberList2 = []; 
  List<int> numberList3 = [2, 5, 8, 9, 10, 15]; 
  // length: 6, index:    0  1  2  3   4   5
  //inRaSoChanTrongList(numberList3);
  // muốn xuất hiện lable khi mà dùng hàm hay khởi tạo đối tượng, thì dùng { ... } ở biến truyền vào
  inRaSoChanTrongList(numberList: numberList3 );
  

  var age = 27; 
  var address = "Ha Noi";
  dynamic age2 = 28; 
  dynamic isOutDated = true; 

  var sum = tinhTong(soHang1: 4, soHang2: 5);
  print("Giá trị Tổng: $sum");

  var hieu = tinhHieu(soBiTru: 7, soTru: 4);

  final  numberTest = 10; 

  // Toán tử gán

  int index = 0; 
  index += 2; // index = index + 2; // index = 2;
  index -= 1; // index = index -1 ; // index = 1; Tương tự : %, * , / 
  index %= 2; // index = index % 2; // index = 1; 

  // Toán tử so sánh 
  int number1 = 5; 
  int number2 = 10; 
  int number3 = 8; 
  if(number2 >= number1) print("Số thứ 2 lớn hơn số thứ nhất");
  else print("Số thứ 1 lớn hơn hoặc bằng số thứ 2");

  if(number2 != number1) print("Số thứ 2 lớn hơn số thứ nhất");
  else print("Số thứ 1 lớn hơn hoặc bằng số thứ 2");
  // &&, || So sánh 2 biểu thức true, false 

  if((number2 > number1)&& (number2 > number3)) print("Số $number2 là số lớn nhất trong 3 số");

  // && <=> *; true = 1; false = 0; true && true = 1 , true; true && false = 0, false;  
  // || <=> + ; true = 1; false = 0 ; true || true = true; false || false = false ; true || false = true;
 
 adjustStudent(averageMark: -1 );
 checkSochan(number: 2);
 checkSochan(number: 3);

 printNumbersLimited(maxNumber: 50, numberSum: 50);

 List<dynamic> dynamicList = [10, "hello", true, false, 8.5];

 List dynamicList2 = [10, "hello", true, false, 8.5];

 dynamicList2.add("GoodBye");
 print(dynamicList2.toString());
 dynamicList2.clear();
 print(dynamicList2.toString());

 // kiến thức Map ; key: value; 
Map<String, String> map = {
  "name" : "Báo Flutter",
  "phone_number": "0349582808"
};

Map<int, dynamic> map1 = {
  1 : "Báo Flutter",
  4: "0349582808",
  5: 30
};

print("Tên tôi là: " + map1[1].toString()) ;
print("Tuổi tôi là: " + map1[5].toString()) ;

}



void printNumbersLimited({required int maxNumber, required int numberSum})
{
  int sum = 0; 
  int number = 1; 
  print("Các số thoả mãn: ") ; 
  /*
  while((number <= maxNumber)&&(sum<= numberSum))
  {
    print("$number");
    sum += number; // sum = sum + number ;
    number ++;  // number = number + 1; 
  }
  */
  do {
    print("$number");
    sum += number; // sum = sum + number ;
    number ++;  // number = number + 1; 
  }
  while((number <= maxNumber)&&(sum<= numberSum));
  print("Hàm in kết thúc"); 

}


// var không thể dùng trong kiểu dữ liệu đầu ra của hàm
dynamic tinhTong({required dynamic soHang1, required dynamic soHang2}){
  return soHang1 + soHang2 ;
}

tinhHieu({required soBiTru, required soTru}){
  return soBiTru  - soTru ;
}

void checkSochan({required int number}){

  switch(number%2)
  {
    case 0: 
    print("Số $number là số chẵn");
    return;

    case 1: 
    print("Số $number là số lẻ");
    break;

    default:
    print("Không xác đinh");
    break; 
  }

  print("Hàm kết thúc") ;

}



void inRaSoChanTrongList({ List<int>? numberList})
{
  /*
  for( int i = 0 ; i < numberList.length ; i++ )
  {
    if(numberList[i]%2 == 0) print("Số chẵn trong list ở vị trí $i là:" + numberList[i].toString() );

  }
  */
  for(int number in numberList!)
  {
    if(number%2== 0) print("Số chẵn là: $number" );
  }

}

adjustStudent({ required double averageMark})
{
if((averageMark < 0 )||(averageMark > 10)) {
  print("Số điểm nhập vào không hợp lệ");
  return;  
}
else if(averageMark < 5 ) print("Học sinh yếu");
else if(averageMark < 8.5) print("Hoc sinh Đat yêu cầu");
else print("Học sinh Xuất Sắc"); 

}
