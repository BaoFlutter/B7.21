import 'package:base_api/models/video_model.dart';
import 'package:base_api/providers/video_list_provider_model.dart';
import 'package:base_api/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
class VideoListSecondScreen extends StatelessWidget {
  const VideoListSecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Cách 2:
    //final videoList = Provider.of<VideoListProviderModel>(context).videoList;
    //Cách 1
  var videoList = context.watch<VideoListProviderModel>().videoList;
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
      ),


      /*
      child: Consumer<VideoListProviderModel>(
      builder: (context, videoListProviderModel, child){
        List<VideoModel> videoList = videoListProviderModel.videoList;
        return GridView.builder(
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
        );
      }

    ),
     */

       )


    );
  }
}
