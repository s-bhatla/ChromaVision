import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../end_msg/msg_rg.dart';
import '../end_msg/msg_by.dart';
import '../end_msg/msg_bw.dart';
import '../end_msg/msg_nv.dart';
import '../end_msg/msg_err.dart';

class Q7 extends StatefulWidget{
  List<int> cb;
  Q7(this.cb);
  @override
  Q7State createState() => new Q7State(cb);
}

class Q7State extends State<Q7>{
  String ans = "";
  List<int> cb;
  Q7State(this.cb);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Question 7')),
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
                  child: Image.asset('assets/images/7.jpg', fit: BoxFit.cover,),
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
                  if (ans != '5'){
                    cb[1]++;
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Incorrect. The number was 5"),
                    ));
                  }
                  if (cb[0] > cb[1]){
                    print("red-green");
                    Navigator.of(context)
                        .push(
                        MaterialPageRoute(builder: (context) => HomePagerg())
                    );
                  }
                  else if (cb[1] > cb[0]){
                    print("blue-yellow");
                    Navigator.of(context)
                        .push(
                        MaterialPageRoute(builder: (context) => HomePageby())
                    );
                  }
                  else if (cb[1] >= 3 && cb[0] >= 3){
                    print("Black and white");
                    Navigator.of(context)
                        .push(
                        MaterialPageRoute(builder: (context) => HomePagebw())
                    );
                  }
                  else if (cb[1] == cb[0] && cb[1] == 1){
                    Navigator.of(context)
                        .push(
                        MaterialPageRoute(builder: (context) => Err())
                    );
                  }
                  else {
                    print("Normal");
                    Navigator.of(context)
                        .push(
                        MaterialPageRoute(builder: (context) => HomePagenv())
                    );
                  }
                },
                child: Text('Submit'),
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