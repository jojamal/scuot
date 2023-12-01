import 'package:chat_app/screens.dart/registrayion_screen.dart';
import 'package:chat_app/screens.dart/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/widget.dart/my_button.dart';

class faceapp extends StatefulWidget {
 static const String screenroute = 'face_screen';



  @override
  State<faceapp> createState() => _faceappState();
}

class _faceappState extends State<faceapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 59, 87),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Column(children: [
            Container(
              height: 200,
              child:Image.network('https://cdn.wallpapersafari.com/30/52/c5sgfo.jpg'),
               ),
               Text('chitchat',
               style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Color.fromARGB(255, 118, 138, 1)
      
               ),),
      
          ],),
          SizedBox(height: 30,),
          mybutton( color: Color.fromARGB(255, 61, 62, 62),
          title: 'sign in',
          onPressed: (){
            Navigator.pushNamed(context, signinscreen.screenroute);
          },),
          mybutton(color: Color.fromARGB(255, 55, 24, 134), title: 'register', 
          onPressed: (){
             Navigator.pushNamed(context, registratinoscreen.screenroute);


          })
        ],),
      ),
    );
  }
}















