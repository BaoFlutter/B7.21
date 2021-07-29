import 'dart:convert';

import 'xe.dart';

class XeTai extends Xe{

XeTai({required String brand, required int productionYear}) 
  : super(brand:brand  , productionYear: productionYear );

@override
  getAge() {
    // TODO: implement getAge
    print(super.brand);
    return super.getAge();
  }

  @override
  chuyenCho() {
    // TODO: implement chuyenCho
    print("Chở Vật liệu");
    
  }




}