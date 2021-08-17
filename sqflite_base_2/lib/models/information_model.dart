class InformationModel{
  int? id;
  String? user_name;
  int? age;

  InformationModel({required this.id, required this.user_name, required this.age});

  InformationModel.fromJson(json):
      this.id = json['id'],
      this.user_name = json['user_name'],
      this.age = json['age'];

  toJson(){
    return {
      'id': this.id,
      'user_name': this.user_name,
      'age': this.age
    };
  }

}