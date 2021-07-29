class Student {
  String? studentId; 
  String? userName; 
  String? _birthDay; 
  String? _phoneNumber; 
  double? mathMark; 
  double? litetureMark; 
  double? englishMark ; 

  Student({ required this.studentId, required this.userName, required this.mathMark, required this.litetureMark, required this.englishMark });

  String get birthDay => this._birthDay!;
  String get phoneNumber => this._phoneNumber!;

  void setBirthYear( String? birthDay){
    this._birthDay = birthDay ;
  }

  void setPhoneNumber(String? phoneNumber) {
    this._phoneNumber = phoneNumber;
  }

  void printStudentInformation(){
    print(
      "Mã học sinh: " + this.studentId! + "\n" + 
      "Tên học sinh: " + this.userName! + "\n" + 
      "Ngày sinh: " + this.birthDay! + "\n" + 
      "Số điện thoại: " + this.phoneNumber! + "\n" + 
      "Điểm Toán: " + this.mathMark!.toString() + "\n" + 
      "Điểm Văn: " + this.litetureMark!.toString()+ "\n" + 
      "Điểm Anh: " + this.englishMark!.toString() + "\n"
    );
  }

  double getAverageMark(){
    return (this.mathMark! + this.litetureMark! + this.englishMark!)/3;
  }

  void adjustStudent()
  {
    double avarageMark = getAverageMark(); 
    if((avarageMark < 0)||(avarageMark>10)) { 
      print("Điểm nhập vào không hợp lệ");
      }
      else if(avarageMark <5) print("Hoc lực yếu");
      else if(avarageMark<8.5) print("Học lực đạt");
      else print("Học lực xuất sắc");
  }

}