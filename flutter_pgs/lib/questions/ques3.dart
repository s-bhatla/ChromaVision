import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'ques4.dart';

class Q3 extends StatefulWidget{
  List<int> cb;
  Q3(this.cb);
  @override
  Q3State createState() => new Q3State(cb);
}

class Q3State extends State<Q3>{
  String ans = "";
  List<int> cb;
  Q3State(this.cb);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Question 3')),
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
                  child: Image.asset('assets/images/3.jpg', fit: BoxFit.cover,),
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
                  if (ans != '45'){
                    cb[0]++;
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Incorrect. The number was 45"),
                    ));
                  }
                  Navigator.of(context)
                      .push(
                      MaterialPageRoute(builder: (context) => Q4(cb))
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