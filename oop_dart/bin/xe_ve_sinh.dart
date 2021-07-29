import 'xe.dart';

class XeVeSinh extends Xe{

 XeVeSinh({required String brand, required int productionYear}) 
  : super(brand:brand  , productionYear: productionYear );

  @override
  chuyenCho() {
    // TODO: implement chuyenCho
    print("Xe chở rác");
  }

}