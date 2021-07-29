import 'dart:svg';

import 'animal.dart';

class Dog extends Animal{
  Dog({name, position}) : super (name: name, position: position);

  @override
  getPosition() {
     return this.position;
  }
  
  
}