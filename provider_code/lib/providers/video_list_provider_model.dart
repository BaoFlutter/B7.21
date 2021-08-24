import 'package:base_api/models/video_model.dart';
import 'package:flutter/material.dart';

class VideoListProviderModel with ChangeNotifier{
  List<VideoModel> videoList = [];

  updateVideoList({required videoList})
  {
    this.videoList = videoList;
    notifyListeners();
  }

}