import 'package:chat_app/screens.dart/chat_screen.dart';
import 'package:chat_app/widget.dart/my_button.dart';// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:chat_app/widget.dart/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:chat_app/screens.dart/signin_screen.dart';


class registratinoscreen extends StatefulWidget {
  static const String screenroute = 'registratino_screen';
  @override
  State<registratinoscreen> createState() => _registratinoscreenState();
}
class _registratinoscreenState extends State<registratinoscreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool shoespinener = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Color.fromARGB(255, 1, 59, 87),
      body: ModalProgressHUD(
        inAsyncCall: shoespinener,
        child: Padding(
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
            ]
        
            
            ),
            SizedBox(height: 30,),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value){
                email=value;
              },
              decoration: InputDecoration(
                hintText: 'inter your email',
                contentPadding: 
                EdgeInsets.symmetric(
                  horizontal: 10,
                vertical: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: 
                BorderRadius.all(
                  Radius.circular(10)
                )
                ),
                enabledBorder: 
                 OutlineInputBorder(
                  borderSide: 
                  BorderSide(color: const Color.fromARGB(255, 172, 4, 4),
                  width: 1,),
                  borderRadius: 
                BorderRadius.all(
                  Radius.circular(10)
                )
                ),
                focusedBorder:
                OutlineInputBorder(
                  borderSide: 
                  BorderSide(color: Color.fromARGB(255, 249, 140, 140),
                  width: 2,),
                  borderRadius: 
                BorderRadius.all(
                  Radius.circular(10)
                )
                ), 
              ),
              
      
      
            ),
            SizedBox(height: 10,),
           
          
           TextField(
            obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value){
                password=value;
              },
              decoration: InputDecoration(
                hintText: 'inter your password',
                contentPadding: 
                EdgeInsets.symmetric(
                  horizontal: 10,
                vertical: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: 
                BorderRadius.all(
                  Radius.circular(10)
                )
                ),
                enabledBorder: 
                 OutlineInputBorder(
                  borderSide: 
                  BorderSide(color: const Color.fromARGB(255, 172, 4, 4),
                  width: 1,),
                  borderRadius: 
                BorderRadius.all(
                  Radius.circular(10)
                )
                ),
                focusedBorder:
                OutlineInputBorder(
                  borderSide: 
                  BorderSide(color: Color.fromARGB(255, 249, 140, 140),
                  width: 2,),
                  borderRadius: 
                BorderRadius.all(
                  Radius.circular(10)
                )
                ), 
              ),
              
         ),
         mybutton(
          color: Color.fromARGB(255, 0, 0, 0), 
         title: 'register', 
         onPressed: ()async{
          // print(email);
          // print(password);
          setState(() {
          shoespinener=true;

          });
          try {
            final newUser =await _auth.createUserWithEmailAndPassword
          (email: email, password: password);
          Navigator.pushNamed(context,signinscreen.screenroute);
          setState(() {
            shoespinener=false;
          });
            
          } catch (e) {
            print(e);
            
          }
         },
         )
      
         
           
      ], 
          
          ),
        ),
      ),
    );
  }
}    







