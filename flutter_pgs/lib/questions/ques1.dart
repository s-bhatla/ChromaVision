import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'ques2.dart';
import 'dart:io';


class Q1 extends StatefulWidget{
  @override
  Q1State createState() => new Q1State();
}

class Q1State extends State<Q1>{
  String ans = "";
  List<int> cb = [0, 0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Question 1')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                constraints: BoxConstraints.expand(
                  height: 200.0,
                  width: 200.0,
                ),
                decoration: BoxDecoration(color: Colors.grey),
                child: Image.asset('assets/images/1.jpg', fit: BoxFit.cover,),
              ),
            ),
          ),
          new TextField(decoration: InputDecoration(prefixIcon: Icon(Icons.remove_red_eye_sharp), labelText: "Enter the number"),
          onChanged: (String str){
            setState(() {
              ans = str;
            });
          },
          ),
          Center(child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 32.0, 8.0, 8.0),
            child: ElevatedButton(
              onPressed: (){
                if (ans != '29'){
                  cb[0]++;
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Incorrect. The number was 29"),
                  ));
                }

                Navigator.of(context)
                    .push(
                  MaterialPageRoute(builder: (context) => Q2(cb))
                );
              },
              child: Text('Next Question'),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Color(0xFF45ABE6))
                        )
                    )
                )
            ),
          )),
        ],
      )
    );
  }
}