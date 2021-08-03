import 'package:oop_solutions/oop_solutions.dart' as oop_solutions;

import 'hinh_vuong.dart';

void main(List<String> arguments) {
  HinhVuong hinhVuong1 = HinhVuong(canh: 10);
  double dienTichHinhVuong = hinhVuong1.tinhDienTich();
  print("Diện tích hình vuông: $dienTichHinhVuong") ;
}
