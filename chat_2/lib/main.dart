import 'package:chat/resources/strings.dart';
import 'package:chat/views/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/firebase_auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<FirebaseAuthController>(create: (_)=> FirebaseAuthController()),

        ],
    builder: (context, child) => MaterialApp(
    title: CHAT_APPLICATION,
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
    fontFamily:"Baloo2",
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white
    ),
    home: MainScreen(),
    )
    );
  }
}

