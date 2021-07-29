import 'student.dart';

class User {

  // Thuộc tính : các biến
  int? id; // public
  String? userName; 
  String? address ; 
  int? birthYear;
  String? _phoneNumber; // private 
  Student? student; 
  final String COUNTRY = "VIETNAM" ;


  // Phương thức : các hàm

  // 1. Hàm khởi tạo
  /*
 User({ int? id, String? userName, String? address, int? birthYear}){
   this.id = id; 
   this.userName = userName; 
   this.address = address;
   this.birthYear = birthYear;
 }
 */
User({ required this.id, required this.userName,required this.address, required this.birthYear});
  
  int tinhTuoi(){
    return DateTime.now().year - this.birthYear!;
  }

  // gettter, setterr 
  // setter

  void setPhoneNumber(String phoneNumber)
  {
    this._phoneNumber = phoneNumber;
  }

  // getter 
  /*
  String getPhoneNumber(){
    return this._phoneNumber!;
  }
  */

  String getPhoneNumber() => this._phoneNumber!;

  String get phoneNumber => this._phoneNumber!;
  // => : { return }


}