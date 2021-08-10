import 'package:get/get.dart';

class AdjustmentController extends GetxController{
  String averageMark = "Chưa cập nhật" ;
  String grade = "Chưa cập nhật" ;

  void  getResult({ required double mathMark, required double litetureMark , required double englishMark}){
    averageMark =  ((mathMark + litetureMark + englishMark ) /3).toString();
    grade = adjustStudent(averageMark: double.parse(averageMark));
    update();
  }

  String adjustStudent({required double averageMark}){
    if ((averageMark >10 )||(averageMark < 0)) return "Điểm không hợp lệ" ;
    else if (averageMark <5) return "Học lực chưa đạt" ;
    else if (averageMark <8.5) return "Học lực  đạt";
    return "Học lực xuất sắc" ;

  }

}