import 'xe.dart';

class XeKhach extends Xe{
  XeKhach({required String brand, required int productionYear}) 
  : super(brand:brand  , productionYear: productionYear );

  @override
  chuyenCho() {
    // TODO: implement chuyenCho
    print("Chuyên chở người");
  }


}