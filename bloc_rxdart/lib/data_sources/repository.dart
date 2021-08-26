import 'package:base_api/data_sources/api_services.dart';
import 'package:base_api/models/video_model.dart';

class Repository
{
  final ApiServices _apiServices = ApiServices();
   // fetching Video List
  Future<List<VideoModel>> fetchAllVideos() => _apiServices.fetchVideoList();


}