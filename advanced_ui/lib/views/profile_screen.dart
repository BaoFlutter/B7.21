import 'package:advanced_ui/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined,),
          onPressed: () {
          //Navigator.of(context).pop();
            //var route = MaterialPageRoute(builder: (context) => HomeScreen());
            //Navigator.push(context, route);
            Get.back();
          },
        ),
        title: Text('Page Title',),
        actions: [
          IconButton(
            icon: Icon(Icons.share, ),
            onPressed: () {

            },
          ),
          IconButton(
            icon: Icon(Icons.search,),
            onPressed: () {

            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert, ),
            onPressed: () {

            },
          ),
        ],
      ),
    );
  }
}
