import 'package:base_api/blocs/video_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'models/video_model.dart';
import 'views/video_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
    MyApp({Key? key}) : super(key: key);

    final videoListBloc = VideoListBloc();

  @override
  Widget build(BuildContext context) {
    videoListBloc.putDatatoVideoListSubject();
    return StreamProvider<List<VideoModel>>(
        create: (context) => videoListBloc.videoListStream,
        initialData: [],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: VideoListScreen(),
        ),
    );
  }
}

