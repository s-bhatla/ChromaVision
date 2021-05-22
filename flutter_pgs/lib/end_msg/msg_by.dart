import 'dart:ui' as ui;
import 'package:flutter/material.dart';
//import 'package:foody/directed_pages/directed_1.dart';
import '../questions/ques1.dart';
import 'directed/cb.dart';


String directed1 = "Blue-Yellow color blindness: This less-common type of color blindness makes it hard to tell the difference between blue and green, and between yellow and red.People with reduced blue sensitivity have difficulty identifying differences between blue and yellow, violet and red and blue and green.To these people the world appears as generally red, pink, black, white, grey and turquoise.";
String directed2 = "Types : \n1.Tritanomaly \n2.Tritanopia \nTritanomaly makes it hard to tell the difference between blue and green, and between yellow and red.Tritanopia makes you unable to tell the difference between blue and green, purple and red, and yellow and pink.It also makes colors look less bright.The most common colour confusions for tritanopes are light blues with greys, dark purples with black, mid-greens with blues and oranges with reds.";
String directed3 = "Most people with color blindness lead normal lives. However, having color blindness can make certain day-to-day tasks more difficult, like driving, cooking, and using electronics.However, corrective contact lenses or glasses may help neutralize blue yellow color blindness. These come in the form of tinted lenses or filters that go over your glasses and can help you see blue and yellows more clearly.";


class HomePageby extends StatefulWidget {
  @override
  _HomePagebyState createState() => _HomePagebyState();
}

class _HomePagebyState extends State<HomePageby> {
  final double _borderRadius = 24;

  var items = [
    PlaceInfo('BLUE-YELLOW COLOUR BLINDNESS', Color(0xFF68F8CC), Colors.blue,directed1),
    PlaceInfo('TYPES OF COLOR BLINDNESS', Color(0xFF68F8CC), Colors.blue,directed2),
    PlaceInfo('HOW TO LIVE WITH IT', Color(0xFF68F8CC), Colors.blue,directed3),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('RESULT'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 24.0),
            child: Center(
                child: Text('Diagnosis : You might have BLUE-YELLOW Color deficiency',
                style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, fontSize: 24, fontFamily: 'Avenir', color: Color(0xFF333333)),)
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {

                return  new GestureDetector(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => CB(),
                        settings: RouteSettings(
                          arguments: items[index].location,
                        )
                    ));
                  },
                  child:Center(

                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(_borderRadius),
                              gradient: LinearGradient(colors: [
                                items[index].startColor,
                                items[index].endColor
                              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                              boxShadow: [
                                BoxShadow(
                                  color: items[index].endColor,
                                  blurRadius: 12,
                                  offset: Offset(0, 6),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            top: 0,
                            child: CustomPaint(
                              size: Size(100, 150),
                              painter: CustomCardShapePainter(_borderRadius,
                                  items[index].startColor, items[index].endColor,items[index].location
                              ),
                            ),
                          ),

                          Positioned.fill(
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                    flex: 4,
                                    child: Image.asset(
                                      'assets/icon.png',
                                      height: 64,
                                      width: 64,
                                    )
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        items[index].name,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Avenir',
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ),

                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Icon(
                                        Icons.arrow_forward,
                                        size: 60,
                                        color: Colors.white,

                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 28.0, 8.0, 24.0),
            child: ElevatedButton(onPressed: (){
              Navigator.of(context)
                  .push(
                  MaterialPageRoute(builder: (context) => Q1())
              );
            }, child: Text('Test Again'),
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Color(0xFF45ABE6))
                    )
                )
            ),),
          )
        ],
      ),

    );
  }
}

class PlaceInfo {
  final String name;

  final Color startColor;
  final Color endColor;
  final String location;

  PlaceInfo(this.name, this.startColor, this.endColor,this.location
      );
}

class CustomCardShapePainter extends CustomPainter {
  final double radius;
  final Color startColor ;
  final Color endColor ;
  final String location;

  CustomCardShapePainter(this.radius,this.startColor,this.endColor,this.location);

  @override
  void paint(Canvas canvas, Size size) {
    var radius = 24.0;

    var paint = Paint();
    paint.shader = ui.Gradient.linear(
        Offset(0, 0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
      endColor
    ]);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}