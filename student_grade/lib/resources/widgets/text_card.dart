import 'package:flutter/material.dart';
import 'package:student_grade/resources/widgets/text_row_widget.dart';
class TextCard extends StatelessWidget {
  final String labelCard;
  final String firstLabel;
  final String secondLabel;
  final String firstContent ;
  final String secondContent ;

  const TextCard({Key? key, required this.labelCard, required this.firstLabel,
    required  this.secondLabel, required this.firstContent, required this.secondContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
          child: Column(
            children: [
              Center( child: Text(labelCard, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),),
              TextRowWidget(lableText: firstLabel, content: firstContent),
              const SizedBox(height: 20,),
              TextRowWidget(lableText: secondLabel, content: secondContent)
            ],
          ),
        ),
      ),
    );
  }



}
