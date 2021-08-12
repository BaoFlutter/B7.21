import 'package:advanced_ui/views/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<void>? _launched;
  String _phone = '0349582808';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            // cover picture Widget
            coverImage(assestImageLink: "assets/images/cover.jpeg"),
            // title Widget
            titleWidget(nameText: "Oeschinen Lake Campground",
                addressText: "Kandersteg, Switzerland",
                adjustmemtNumber: "41"),
            // buttons widget
            buttonsRowWidget(),
            // description widget,
            descriptionWidget(descriptionText: "Oeschinen Lake or Oeschinensee or Lago di Oeschinen,"
                " with pristine nature and turquoise blue waters, is literally heaven on earth. High mountains rise on all sides of the lake. And Oeschinensee is like a sparkling gem in the centre. The lake is at the foot of Mountains – Blüemlisalp, Oeschinenhorn, Fründenhorn and Doldenhorn. Osechinen Lake is fed by underwater streams as well as glacial waterfalls falling from the top of these mountains. Make sure to check the webcam for weather conditions before you go here. "
                "And by the way, Oeschinen Lake is part of the UNESCO World Heritage Sites list.")
          ],
        ),

      )
    );
  }

  Widget descriptionWidget({ required String descriptionText}){
    return Container(
      padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
      child: Text(
        descriptionText,
        softWrap: true,
      ),
    );

  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget coverImage({required String assestImageLink}){
    return Image.asset(
      assestImageLink,
      fit: BoxFit.cover,
      height: Get.height/2.5,
      width: Get.width,
    );
  }

  Widget titleWidget({ required String nameText, required String addressText,
    required String adjustmemtNumber}){
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20 ),
      child: Row(
        children: [
          // text widget
          Expanded(
              flex: 5,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(nameText, style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(addressText),
                  ],
                ),

              )),
          Expanded(flex: 1,
            child: Container(
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.red,),
                  Text(adjustmemtNumber)
                ],
              ),
            )
          )
          // icon & number widget
        ],
      ),
    );

  }

  Widget buttonsRowWidget(){
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: iconTextButton(
                  onPressed: () => setState(() {
                    _launched = _makePhoneCall('tel:$_phone');
                  }),
                  buttonColor: Colors.blue,
                  icon: Icons.phone,
                  text: "call")),
          Expanded(
              flex: 1,
              child: iconTextButton(
                  onPressed: (){
                   // var route = MaterialPageRoute(builder: (context) => ProfileScreen());
                    //Navigator.push(context, route);
                    Get.to(ProfileScreen());
                  },
                  buttonColor: Colors.blue,
                  icon: Icons.navigation,
                  text: "route")),
          Expanded(
              flex: 1,
              child: iconTextButton(
                  onPressed: (){
                    print("Sharing..");
                  },
                  buttonColor: Colors.blue,
                  icon: Icons.share,
                  text: "share")),

        ],
      ),
    );
  }

  Widget iconTextButton({
    required onPressed,
    required Color buttonColor,
    required IconData icon ,
    required String text
  }){
    return GestureDetector(
      onTap: onPressed,
      child: Container(
       child: Column(
     children: [
        Icon(icon, color: buttonColor, ),
        const SizedBox(height: 10,),
        Text(text.toUpperCase(), style: TextStyle(color: buttonColor),)
        ],
),
),


    );
  }
}
