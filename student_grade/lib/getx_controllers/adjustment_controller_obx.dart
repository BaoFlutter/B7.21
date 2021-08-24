import 'package:get/get.dart';

class AdjustmentControllerObx extends GetxController{
  // Obx = Observer + Rx

  // RxString nameRx = "BaoFlutter".obs;
  //String name = nameRx.value ;

  var averageMark = "Chưa cập nhật".obs ; // RxString
  var grade = "Chưa cập nhật".obs ; // RxString

  void  getResult({ required double mathMark, required double litetureMark , required double englishMark}){
    averageMark =  ((mathMark + litetureMark + englishMark ) /3).toString().obs;
    grade = adjustStudent(averageMark: double.parse(averageMark.value)).obs;
    update();
  }

  String adjustStudent({required double averageMark}){
    if ((averageMark >10 )||(averageMark < 0)) return "Điểm không hợp lệ" ;
    else if (averageMark <5) return "Học lực chưa đạt" ;
    else if (averageMark <8.5) return "Học lực  đạt";
    return "Học lực xuất sắc" ;

  }

}