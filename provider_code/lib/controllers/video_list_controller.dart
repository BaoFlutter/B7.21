import 'package:base_api/models/video_model.dart';
import 'package:get/get.dart';

class VideoListController extends GetxController{
  List<VideoModel> videoList = [];

  updateVideoList({ required videoList})
  {
    this.videoList = videoList;
    print("Update");
    update();
  }

}