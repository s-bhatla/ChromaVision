import 'package:flutter/material.dart';
import 'questions/ques1.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      // appBar: AppBar(title: Text('ColourVision Test'), backgroundColor: Color(0xFF45ABE6),),
      body: Container(
      decoration: new BoxDecoration(color: Color(0xFF8CFFFF)),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 64.0, 8.0, 16.0),
              child: Center(
                child: Container(
                  constraints: BoxConstraints.expand(
                    height: 200.0,
                    width: 350.0,
                  ),
                  // decoration: BoxDecoration(color: Color(0xFF8CFFFF)),
                  child: Image.asset('assets/images/eye.png', fit: BoxFit.cover,),
                ),
              ),
            ),
            Center(child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 32.0, 8.0, 8.0),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.of(context)
                      .push(
                      MaterialPageRoute(builder: (context) => Q1())
                  );
                },
                child: Text('Start Test', style: TextStyle(fontSize: 18, fontFamily: 'Avenir',),),
                  style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),

                  side: BorderSide(color: Color(0xFF45ABE6))
              )
    )
    )
              ),
            ),
            )],

      ),
    ),
    );
  }
}