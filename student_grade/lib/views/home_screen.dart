import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_grade/getx_controllers/adjustment_controller.dart';
import 'package:student_grade/getx_controllers/adjustment_controller_obx.dart';
import 'package:student_grade/resources/strings.dart';
import 'package:student_grade/resources/widgets/custom_button_widget.dart';
import 'package:student_grade/resources/widgets/text_card.dart';
import 'package:student_grade/resources/widgets/text_input_widget.dart';

import 'information_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController? mathMarkController, litetureMarkController, englishMarkController ;

  String averageMark = "Chưa cập nhật" ;
  String grade = "Chưa cập nhật" ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mathMarkController = TextEditingController();
    litetureMarkController = TextEditingController();
    englishMarkController  = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mathMarkController!.dispose();
    litetureMarkController!.dispose();
    englishMarkController!.dispose();
  }


  @override
  Widget build(BuildContext context) {
    if(mounted) {
      print("Building widget tree tổng") ;
    };

    final controlerObx =  Get.put(AdjustmentControllerObx());

    return Scaffold(
      appBar: AppBar(
        title: Text(STUDENT_ADJUSTMENT),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(right: 20, left: 20),
          //height: MediaQuery.of(context).size.height,
          //width: MediaQuery.of(context).size.width,
          height: Get.height,
          width: Get.width,
          child: Column(
            children: [
              const Text(MARK_INPUT),
              TextInputWidget(labelText: MATH_MARK, hintText: MATH_MARK_INPUT, controller: mathMarkController),
              TextInputWidget(labelText: LITETURE_MARK, hintText: LITETURE_MARK_INPUT, controller: litetureMarkController),
              TextInputWidget(labelText: ENGLISH_MARK, hintText: ENGLISH_MARK_INPUT, controller: englishMarkController),
              CustomButtonWidget(
                  buttonTitle: ADJUST,
                  onPressed: (){
                    Get.find<AdjustmentController>().getResult(
                        mathMark: double.parse(mathMarkController!.text),
                        litetureMark: double.parse(litetureMarkController!.text),
                        englishMark: double.parse(englishMarkController!.text));

                    /*
                  setState(() {
                    averageMark = getAverageMark(
                        mathMark: double.parse(mathMarkController!.text),
                        litetureMark: double.parse(litetureMarkController!.text),
                        englishMark: double.parse(englishMarkController!.text)).toString();
                    grade = adjustStudent(averageMark: double.parse(averageMark)) ;
                  });

                   */
                  }),
              GetBuilder<AdjustmentController>(
                  init: AdjustmentController(),
                  builder: (controller){
                    averageMark = controller.averageMark;
                    grade =  controller.grade;
                    return TextCard(
                        labelCard: RESULT,
                        firstLabel: AVERAGE_MARK,
                        secondLabel: GRADE,
                        firstContent: controller.averageMark,
                        secondContent: controller.grade);
                  }),
              CustomButtonWidget(buttonTitle: NEXT,
                  onPressed: (){
                    /*
                  var route = MaterialPageRoute(builder: (context) => Information(
                    averageMark: averageMark ,
                  grade:  grade,));
                  Navigator.push(context, route);

               */
                    Get.to(Information(
                      averageMark: averageMark ,
                      grade:  grade,));

                  }),


            ],
          ),
        ),
      )
    );
  }



}
