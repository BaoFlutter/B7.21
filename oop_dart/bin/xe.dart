class Xe{

String? brand; 
int? productionYear; 

Xe({required this.brand, required this.productionYear});

getAge()
{
  return DateTime.now().year - this.productionYear!;
}

chuyenCho(){
  print("Tính chuyên chở: ");
}

}