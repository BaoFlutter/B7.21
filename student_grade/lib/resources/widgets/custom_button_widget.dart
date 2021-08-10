import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {

  final String buttonTitle;
  final onPressed ;
  const CustomButtonWidget({Key? key, required this.buttonTitle, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
        child: Text(this.buttonTitle),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.orangeAccent
        ),
      ),
      onTap: this.onPressed,
    );
  }


}
