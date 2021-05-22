import 'package:flutter/material.dart';
import '../questions/ques1.dart';

class Err extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
          child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 64.0, 8.0, 8.0),
          child: Center(child: Text("Could not determine results from the provided data.\nPlease retake the test.",
            style:TextStyle(
              fontFamily: 'Avenir',
              fontSize: 23,
              fontWeight: FontWeight.w300,
              color: Color(0xFF333333),) ,)),
        ),
      ),
          ElevatedButton(onPressed: (){
          Navigator.of(context)
              .push(
          MaterialPageRoute(builder: (context) => Q1())
          );
          }, child: Text("Test Again"))
    ]
    ));
  }
}