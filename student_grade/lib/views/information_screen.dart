import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_grade/resources/strings.dart';
import 'package:student_grade/resources/widgets/text_card.dart';
class Information extends StatefulWidget {
  final String averageMark;
  final String grade;
  const Information({Key? key, required this.averageMark, required this.grade}) : super(key: key);

  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(INFORMATION),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Center(
          child: TextCard(
              labelCard: "",
              firstLabel: AVERAGE_MARK,
              secondLabel: GRADE,
              firstContent: widget.averageMark,
              secondContent: widget.grade),
        ),
      ),

    );
  }
}
