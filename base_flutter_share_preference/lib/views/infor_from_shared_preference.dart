
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InforFromSharedPreference extends StatefulWidget {
  const InforFromSharedPreference({Key? key}) : super(key: key);

  @override
  _InforFromSharedPreferenceState createState() => _InforFromSharedPreferenceState();
}

class _InforFromSharedPreferenceState extends State<InforFromSharedPreference> {

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<String>? userNameAndAge ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInformationFromSharedPreference();
  }

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
            child: FutureBuilder<String>(
              future: userNameAndAge,
                builder: (context, snapshot)
            {
              if(snapshot.hasError)
                return Center(
                  child: Text("Load dữ liệu lỗi !"),
                );
              if(!snapshot.hasData)
                return Center(
                  child: CircularProgressIndicator(),
                );

              String information = snapshot.data??"";
              return Center(
                child: Card(
                  child: Text(information),
                ),
              );

            })
          ),
        )

    );
  }

  getInformationFromSharedPreference() async {
    userNameAndAge = _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('information') ?? "Thông tin chưa được lưu vào");
    });

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


