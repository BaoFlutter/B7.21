 abstract class Animal {
   String? name; 
   String? position; 
   Animal({this.name, this.position}) ; 

   getPosition();

   printName(){
     print("Tên: " + this.name!);
   }

}