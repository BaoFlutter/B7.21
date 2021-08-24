import 'package:base_api/controllers/video_list_controller.dart';
import 'package:base_api/controllers/video_list_controller_obx.dart';
import 'package:base_api/data_sources/api_services.dart';
import 'package:base_api/models/video_model.dart';
import 'package:base_api/providers/video_list_provider_model.dart';
import 'package:base_api/resources/strings.dart';
import 'package:base_api/views/getx_video_list_second_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'getx_video_list_second_screen_obx.dart';
class GetXObxVideoListScreen extends StatefulWidget {
  const GetXObxVideoListScreen({Key? key}) : super(key: key);

  @override
  _GetXObxVideoListScreenState createState() => _GetXObxVideoListScreenState();
}

class _GetXObxVideoListScreenState extends State<GetXObxVideoListScreen> {

  Future<List<VideoModel>>? futureVideoList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadVideo();
  }

  @override
  Widget build(BuildContext context) {
   //final videoListProvider = Provider.of<VideoListProviderModel>(context);

    final videoListController = Get.put(VideoListController());

    return Scaffold(
      appBar: AppBar(
        title: Text(VIDEO_LIST),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Get.to(GetXObxVideoListSecondScreen());
          }, icon: Icon(Icons.ac_unit))
        ],
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: FutureBuilder<List<VideoModel>>(
          future: futureVideoList,
          builder: (context, snapshot){
            // lấy dữ liệu lỗi hoặc là chưa lấy hoàn thành
            if(snapshot.hasError){
              return Center(
                child: Text(VIDEO_LOAD_ERROR),
              );
            }
            if(!snapshot.hasData)
              return Center(
                child: CircularProgressIndicator(),
              );
            // đã có dữ liệu tĩnh ( hoàn thành)
            List<VideoModel> videoList = snapshot.data!;
            Get.put(ObxVideoListController()).updateVideoList(videoList: videoList.obs);
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


          },
        )

        ,

      )
    );
  }

  loadVideo(){
    futureVideoList = ApiServices().fetchVideoList();
  }
}
