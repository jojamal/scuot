import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

  late User signinuser;

class chatscreen extends StatefulWidget {

  static const String screenroute = 'chat_screen';

  @override
  State<chatscreen> createState() => _chatscreenState();
}

class _chatscreenState extends State<chatscreen> {
  final massegtextconttroller=TextEditingController();
  final firestore =FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  String? massegText;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gettheUser();
  }
  void gettheUser(){
    try {
      final user= _auth.currentUser;
    if(user!=null){
      signinuser = user;
      print(signinuser.email);
      
      }

    } catch (e) {
      print(e);
      
    }
    
  }
  // void getmasseges()async{
  //   final massges = await firestore.collection('massages').get();
  //   for(var masseg in massges.docs) {
  //     print(masseg.data());
  //   }
  // }
  // void massegesstream()async{
  //   await for (var snapshot in firestore.collection('massages').snapshots()){
  //     for(var masseg in snapshot.docs){
  //       print(masseg.data());
  //     }
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Row(
          children: [
          Text('massage me'),
        ],
        ),
        actions: [
          IconButton(onPressed: (){
            // getmasseges();
            _auth.signOut();
            Navigator.pop(context);
            // massegesstream(); 
                       
          }, 
           icon: Icon(Icons.close),),
         
        ],
      ),
      body: SafeArea(child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: firestore.collection('massages').orderBy('time').snapshots(),
            builder: (context, snapshot){
              List<massegline>massagewidgets=[];
              if(!snapshot.hasData){
                return Center(
                  child: CircularProgressIndicator(backgroundColor: Colors.blue,
                ));

              };
              final masseges = snapshot.data!.docs.reversed;
              for(var massage in masseges){
                final massegetext=massage.get('text');
                final massegesender=massage.get('sender');
                final currentuser= signinuser.email;
                // if(currentuser==massegesender){}

                
                final massegewidget=massegline(
                  sender: massegesender,text: massegetext,
                   isme:currentuser==massegesender ,);
                massagewidgets.add(massegewidget);


              }
               return Expanded(
                 child: ListView(
                  reverse: true,
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20,),
                  children: massagewidgets,
                 ),
               );


            },
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: const Color.fromARGB(255, 235, 76, 76),
                  width: 2,
                )
              )
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Expanded(
                
                child: TextField(
                  controller: massegtextconttroller,
                onChanged:(value){
                  massegText=value;
                } ,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,

                  ),
                  hintText: 'write here',
                  border: InputBorder.none,
                ),
                ),
                ),
                TextButton(onPressed:(){
                  massegtextconttroller.clear();
                  firestore.collection('massages').add(
                    {
                      'text':massegText,
                      'sender':signinuser.email,
                      'time': FieldValue.serverTimestamp(),
                    }
                  );
                },
                child: Text('send',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                ),
                ),
            ],
            ),
          ),
        ],
      )
      ),
    );
  }
}

class massegline extends StatelessWidget {

  final String sender;
  final String text;
  final bool isme;

  const massegline({super.key ,required this.isme, required this.sender, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment:isme? CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          Text('$sender'),
          Material(
            elevation: 5,
            borderRadius:isme? BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ):BorderRadius.only(
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            color:isme?  Color.fromARGB(255, 9, 1, 47): Colors.blue ,
            child: Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Text('$text',
              style: TextStyle(fontSize: 17,
              color: Color.fromARGB(255, 254, 254, 253)),))),
        ],
      ),
    );
  }
}













