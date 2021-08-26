import 'package:base_api/data_sources/repository.dart';
import 'package:base_api/models/video_model.dart';
import 'package:rxdart/rxdart.dart';

class VideoListBloc {

  final _repository = Repository();

  final videoListSubject = PublishSubject<List<VideoModel>>();

  // put Data into Bloc
  putDatatoVideoListSubject() async {
    List<VideoModel> videoList = await _repository.fetchAllVideos();
    videoListSubject.sink.add(videoList);
  }
  // push Data from Bloc into Views
  Stream<List<VideoModel>>? get videoListStream => videoListSubject.stream;

  // close Bloc ( Stream )
 dispose(){
   videoListSubject.close();
 }





}