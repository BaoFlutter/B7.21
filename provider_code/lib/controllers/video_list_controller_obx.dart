import 'package:base_api/models/video_model.dart';
import 'package:get/get.dart';

class ObxVideoListController extends GetxController{
  var videoList = [].obs;
  // RxString nameRx = "bao".obs;
  // String name = nameRx.value;

  updateVideoList({ required videoList})
  {
    this.videoList = videoList;
  }

}