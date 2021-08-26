import 'package:base_api/blocs/video_list_bloc.dart';
import 'package:base_api/data_sources/api_services.dart';
import 'package:base_api/models/video_model.dart';
import 'package:base_api/resources/strings.dart';
import 'package:base_api/views/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class VideoListScreen extends StatelessWidget {
  const VideoListScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final videoList = Provider.of<List<VideoModel>>(context) ;
    return Scaffold(
        appBar: AppBar(
          title: Text(VIDEO_LIST),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){
              Get.to(SecondScreen());
            }, icon: Icon(Icons.share)),
          ],
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

