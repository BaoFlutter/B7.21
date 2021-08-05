import 'package:base_flutter/views/second_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController? userNameController , birthYearController;

  String userName = "Chưa nhập tên";
  String age = "Chưa nhập năm sinh";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userNameController = TextEditingController();
    birthYearController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông tin cá nhân"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            // name widget
            textInputWidget(
                labelText: "Họ và tên",
                hintText: "Nhập họ và tên",
                controller: userNameController),
            // birthYear Widget
            textInputWidget(
                labelText: "Năm sinh",
                hintText: "Nhập năm sinh",
                controller: birthYearController),

            // confirm button Widget
            /*
            ElevatedButton(
                onPressed: () {
                  print("Đã xác nhận");
                },
                child: Text("Xác nhận")),

             */
            confirmButtonWidget(
                buttonTitle: "Xác nhận",
                onPressed: (){
                  setState(() {
                    userName = userNameController!.text;
                    age = (DateTime.now().year - int.parse(birthYearController!.text)).toString();
                  });
                }),
            informationWidget(
                userNameContent: userName,
                ageContent: age),
            ElevatedButton(
                onPressed: (){
                  var route = MaterialPageRoute(builder: (context)=>
                      SecondScreen(username: userName, age: age));
                  Navigator.push(context, route);
                },
                child: Text("Next Page"))

            // information widget
          ],
        ),
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

  Widget textInputWidget({ required String labelText, required String hintText, required controller}){
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText:labelText,
          hintText: hintText,
        ),
        controller: controller,
      ) ,
    );
  }

  Widget confirmButtonWidget({required String buttonTitle, required onPressed}){
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
        child: Text(buttonTitle),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.orangeAccent
        ),
      ),
      onTap: onPressed,
    );
  }
}



