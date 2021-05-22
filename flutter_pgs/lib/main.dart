import 'package:flutter/material.dart';
import 'home.dart';
import 'package:splashscreen/splashscreen.dart';


void main(){
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new Myapp(),

  ));
}

class Myapp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();

}
class _MyAppState extends State<Myapp>{
  @override
  Widget build(BuildContext context){

    return SplashScreen(
      seconds: 3,
      backgroundColor: Color(0xFF8CFFFF),
      image: Image.asset('assets/gif/eyegif.gif'),
      loaderColor: Colors.white,
      photoSize: 150.0,
      navigateAfterSeconds: Home(),
    );
  }
}
