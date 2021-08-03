import 'dart:ffi';

class HinhChuNhat {
  double? chieuRong;
  double? chieuDai; 

  HinhChuNhat({ required this.chieuRong, required this.chieuDai});

  tinhChuVi(){
    return (this.chieuDai! + this.chieuRong!) * 2; 
  }

  tinhDienTich(){
    return (this.chieuDai! * this.chieuRong!); 
  }



}