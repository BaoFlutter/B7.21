import 'dart:developer';

import 'package:oop_dart/oop_dart.dart' as oop_dart;
import 'student.dart';
import 'user.dart';
import 'xe_tai.dart';

void main(List<String> arguments) {
  // Hành động tạo đối tượng tên bao 
User bao = User(id: 2, userName: "Báo Flutter", address: "Hà Nội", birthYear: 1991);
print(bao.birthYear.toString());
bao.setPhoneNumber("0349582808") ;
print(bao.phoneNumber);

User bao1 = User(id: 2, userName: "Báo ", address: "Hà Nội", birthYear: 1993);

List<User> userList = [ bao, bao1]; 
/*
userList.add(bao);
userList.add(bao1);
*/
if(userList[0].tinhTuoi() > userList[1].tinhTuoi()) print("Người lớn tuổi nhất là: " + userList[0].userName.toString());
else print("Người lớn tuổi nhất là: " + userList[1].userName.toString());

// Giải bài tập 
Student student1 = Student(studentId: "1", userName: "An", mathMark: 8.5, litetureMark: 6.5, englishMark: 6.7 );
student1.setBirthYear("16Jun1997");
student1.setPhoneNumber("4949594");

Student student2 = Student(studentId: "2", userName: "Binh", mathMark: 9.5, litetureMark: 9.5, englishMark: 8.7 );
student1.setBirthYear("16Jun1998");
student1.setPhoneNumber("4949556764");

Student student3 = Student(studentId: "3", userName: "Hoà", mathMark: 8.5, litetureMark: 9.5, englishMark: 9.7 );
student1.setBirthYear("16Jun1999");
student1.setPhoneNumber("4949592423446");

//student2.printStudentInformation();
List<Student> studentList= [student1, student2, student3];
double maxMark = 0; 
int maxIndex = 0; 
for(int i = 0; i< studentList.length; i++)
{
  double averageMark = studentList[i].getAverageMark();
  if(averageMark > maxMark) {
    maxMark = averageMark;
    maxIndex = i; 
  }

  print("Điểm trung bình của học sinh $i : " +averageMark.toString() );
  studentList[i].adjustStudent();

}

print("Tên người có điểm trung bình lớn nhất: " + studentList[maxIndex].userName.toString());

// Đặc tính 
// Đóng gói 
// Kế thừa 
XeTai xeTai = XeTai(brand: "Huyndai", productionYear: 1989);
//print(xeTai.brand);
print("Tuổi của xe: " + xeTai.getAge().toString());




}
