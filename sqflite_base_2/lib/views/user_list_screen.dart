import 'package:base_flutter/data_sources/information_database.dart';
import 'package:base_flutter/models/information_model.dart';
import 'package:flutter/material.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {

  final db = InformationDatabase();

  Future<List<InformationModel>>? userListFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List người dùng"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<List<InformationModel>>(
          future: userListFuture,
          builder: (context, snapshot){
            if((snapshot.hasError)||(!snapshot.hasData))
              return Center(
                child: CircularProgressIndicator(),
              );
            List<InformationModel> usertList = snapshot.data! ;
            return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: usertList.length,
                itemBuilder: (BuildContext context, int index) {
                  return informationWidget(
                      userNameContent: usertList[index].user_name??"",
                      ageContent: usertList[index].age.toString());
                }
            );

          },
        )
      ),
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


  fetchAllUser(){
    userListFuture = db.fetchAll();
  }

}
