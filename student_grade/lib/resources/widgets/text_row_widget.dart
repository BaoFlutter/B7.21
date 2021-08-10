
import 'package:flutter/material.dart';
class TextRowWidget extends StatelessWidget {

  final  String lableText;
  final String content;
  const TextRowWidget({Key? key, required this.lableText, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Row(
        children: [
          Text(lableText, style: TextStyle(color: Colors.red),),
          const SizedBox(width: 10,),
          Text(content)
        ],
      ),
    );
  }


}
