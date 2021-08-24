import 'package:base_api/resources/strings.dart';
import 'package:base_api/views/video_list_screen.dart';
import 'package:base_api/views/video_list_second_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'getx_video_list_screen.dart';
import 'getx_video_list_screen_obx.dart';
import 'getx_video_list_second_screen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(HOME_SCREEN),
        centerTitle: true,
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Center(
          child: Container(
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: (){
                      Get.to(VideoListScreen());
                    },
                    child: Text(VIDEO_LIST)),

                ElevatedButton(
                    onPressed: (){
                      Get.to(VideoListSecondScreen());
                    },
                    child: Text(VIDEO_LIST_ON_PROVIDER)),

                ElevatedButton(
                    onPressed: (){
                      Get.to(GetXVideoListScreen());
                    },
                    child: Text(VIDEO_LIST_GETX)),

                ElevatedButton(
                    onPressed: (){
                      Get.to(GetXObxVideoListScreen());
                    },
                    child: Text(VIDEO_LIST_ON_PROVIDER_OBX)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
