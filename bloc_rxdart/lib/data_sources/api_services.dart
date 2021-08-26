import 'package:base_api/data_sources/api_urls.dart';
import 'package:base_api/models/video_model.dart';
import 'package:base_api/resources/utils/logs.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

class ApiServices {
  // fetching videos
  Future<List<VideoModel>> fetchVideoList() async {
    List<VideoModel> videoList = [];
    var videoListUrl = ApiUrl.VIDEO_URL;
    var response ;
    try{
      response = await http.get(videoListUrl);
    }
    catch(e){
      print("EROR VIDEO LOADING... " + e.toString());
    }
    var body = json.jsonDecode(response.body);
    Log().printJson(json: body);
    print(body['message']);
    if(body["code"]=="success")
      {

        List jsonList = body['list'] ;
        for (var json in jsonList)
          {
            VideoModel videoModel = VideoModel.fromJson(json);
            videoList.add(videoModel);
          }

      }
    return videoList;
  }
  // login
  // logout
  // register
  // update information




}