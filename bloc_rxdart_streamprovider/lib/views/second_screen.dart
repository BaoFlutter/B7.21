import 'package:base_api/models/video_model.dart';
import 'package:base_api/resources/strings.dart';
import 'package:base_api/views/video_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final videoList = Provider.of<List<VideoModel>>(context) ;
    return Scaffold(
        appBar: AppBar(
          title: Text(VIDEO_LIST),
          centerTitle: true,
          leading:IconButton(onPressed: (){
            Get.back();// xoá đường route đc luu tren Navigator
            /*
            === VideoListScreen===
            === SecondScreen=====
            === VideoListScreen===
             */
            /*
            === VideoListScreen===
             */
            // Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_outlined)),
        ),
        body: Container(
            height: Get.height,
            width: Get.width,
            child: videoList.length > 0 ?
            GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: videoList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      color: Colors.white,
                      child: Container(
                        child: Column(
                          children: [
                            Image.network(videoList[index].url_photo!),
                            Text(videoList[index].title!),
                          ],
                        ),
                      )
                  );
                }
            ) :
            Center(
              child: CircularProgressIndicator(),
            )
        )
    );
  }
}
