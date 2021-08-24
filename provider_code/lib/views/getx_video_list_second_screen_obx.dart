import 'package:base_api/controllers/video_list_controller.dart';
import 'package:base_api/controllers/video_list_controller_obx.dart';
import 'package:base_api/models/video_model.dart';
import 'package:base_api/providers/video_list_provider_model.dart';
import 'package:base_api/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
class GetXObxVideoListSecondScreen extends StatelessWidget {
  const GetXObxVideoListSecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final videoListController = Get.put(ObxVideoListController());
   // List<VideoModel> videoList = videoListController.videoList;
    return Scaffold(
        appBar: AppBar(
        title: Text(VIDEO_LIST),
        centerTitle: true,
    ),
    body: Container(
       height: Get.height,
       width: Get.width,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: videoListController.videoList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                color: Colors.white,
                child: Container(
                  child: Column(
                    children: [
                      Image.network(videoListController.videoList[index].url_photo!),
                      Text(videoListController.videoList[index].title!),
                    ],
                  ),
                )
            );
          }
      ),

       )
    );
  }
}
