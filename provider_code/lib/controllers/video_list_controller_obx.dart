import 'package:base_api/models/video_model.dart';
import 'package:get/get.dart';

class ObxVideoListController extends GetxController{
  var videoList = [].obs;

  updateVideoList({ required videoList})
  {
    this.videoList = videoList;

  }

}