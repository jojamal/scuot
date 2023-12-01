import 'package:flutter/material.dart';

class mybutton extends StatelessWidget {
  final Color color;
  final String title;
  final VoidCallback onPressed;

   mybutton({super.key, required this.color, required this.title, required this.onPressed});
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,),
      child: Material(
        elevation: 5,
        color: color,
        borderRadius: BorderRadius.circular(10),
        child: MaterialButton(
          onPressed:onPressed,
          minWidth: 200,
          height: 40,
          child: Text(title
          ,style: TextStyle(
            fontSize: 30,
            color: Color.fromARGB(255, 126, 183, 2),
          ),),),
      ),
    );
  }
}


