import 'package:chat_app/screens.dart/registrayion_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/screens.dart/signin_screen.dart';
import 'package:chat_app/screens.dart/chat_screen.dart';
import 'package:chat_app/screens.dart/face_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      // home: chatscreen(),
      initialRoute: _auth.currentUser!=null?chatscreen.screenroute:faceapp.screenroute,
      routes: {
        faceapp.screenroute:(context) => faceapp(),
        chatscreen.screenroute:(context) => chatscreen(),
        registratinoscreen.screenroute:(context) => registratinoscreen(),
        signinscreen.screenroute:(context) => signinscreen(),



      },
      );
        
        }
        }