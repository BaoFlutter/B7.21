import 'package:reactive_programing/reactive_programing.dart' as reactive_programing;
import 'package:rxdart/rxdart.dart';


void main(List<String> arguments) {
 //demoPublishSubject();
 //demoBehaviourSubject();
 demoReplaySubject();

}

demoPublishSubject(){
  // chỉ lấy dữ liệu thêm vào sau
  PublishSubject publishSubject = PublishSubject<int>(); 
  publishSubject.listen((value) {
  print("Lấy dữ liệu lần 1: $value");
   });

   publishSubject.add(100);
   publishSubject.add(101);

   publishSubject.listen((value) {
  print("Lấy dữ liệu lần 2: $value");
   });
   publishSubject.add(200);
   publishSubject.add(201);

}

demoBehaviourSubject(){
  // nó chỉ lấy dữ liệu thêm vào sau lệnh nghe và 1 dữ liệu thêm vào ngay trước lệnh nghe
  BehaviorSubject behaviorSubject = BehaviorSubject<int>(); 
  behaviorSubject.listen((value) {
  print("Lấy dữ liệu lần 1: $value");
   });

   behaviorSubject.add(100);
   behaviorSubject.add(101);

   behaviorSubject.listen((value) {
  print("Lấy dữ liệu lần 2: $value");
   });
   behaviorSubject.add(200);
   behaviorSubject.add(201);

}

demoReplaySubject(){
  // có bao dữ liệu trong stream nó in ra hết 
  ReplaySubject replaySubject = ReplaySubject<int>(); 
  replaySubject.listen((value) {
  print("Lấy dữ liệu lần 1: $value");
   });

   replaySubject.add(100);
   replaySubject.add(101);

   replaySubject.listen((value) {
  print("Lấy dữ liệu lần 2: $value");
   });
   replaySubject.add(200);
   replaySubject.add(201);

}
