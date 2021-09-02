
import 'package:flutter/material.dart';
class SecondScreen extends StatelessWidget {
  final String username;
  final String age;
  const SecondScreen({Key? key, required this.username, required this.age}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chi tiết"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Center(
            child: informationWidget(
                userNameContent: username,
                ageContent: age)
            ,
          ),
        ),
      )

    );
  }

  Widget informationWidget({required String userNameContent, required String ageContent}){
    return Container(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
          child: Column(
            children: [
              const Center( child: Text("Thông tin", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),),
              textWidget(lableText: "Họ và tên: ", content: userNameContent),
              const SizedBox(height: 20,),
              textWidget(lableText: "Tuổi: ", content: ageContent)
            ],
          ),
        ),
      ),
    );
  }

  Widget textWidget({required String lableText, required String content})
  {
    return Container(
      child:  Row(
        children: [
          Text(lableText, style: TextStyle(color: Colors.red),),
          Text(content)
        ],
      ),
    );
  }

}
