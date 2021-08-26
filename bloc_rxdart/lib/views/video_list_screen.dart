import 'package:base_api/blocs/video_list_bloc.dart';
import 'package:base_api/data_sources/api_services.dart';
import 'package:base_api/models/video_model.dart';
import 'package:base_api/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class VideoListScreen extends StatefulWidget {
  const VideoListScreen({Key? key}) : super(key: key);

  @override
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {

  //1. Tạo ra instance của bloc
  final videoListBloc = VideoListBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 2. Put data vào Bloc trước khi build UI
    videoListBloc.putDatatoVideoListSubject();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(VIDEO_LIST),
        centerTitle: true,
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        // 3. Hiển thị dữ liệu từ Bloc lên UI
        child: StreamBuilder<List<VideoModel>>(
          stream: videoListBloc.videoListStream,
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
        ),

      )
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // 4. Đóng Bloc khi thoát màn hình
    videoListBloc.dispose();
  }

}
