import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import '../questions/ques1.dart';
import 'directed/cb.dart';

String directed1 = "Red-green color blindness: The most common type of color blindness makes it hard to tell the differencebetween red and green. People with both red and green deficiencies live in a world ofmurky greens where blues andyellows stand out. Browns, oranges, shades of red and green are easily confused. Both types will confuse some blues with some purples and both types will struggle to identifypale shades of most colours.";
String directed2 = "Types :\n1.Deuteranomaly \n2.Protanomaly \n3.Protanopia \n4.Deuteranopia \nThe different anomalous conditions are protanomaly, which is a reduced sensitivity to red light, deuteranomaly which is a reduced sensitivity to green light and is the most common form of colour blindness.People with deuteranomaly and  protanomaly are collectively known as red-green colour blind and they generally have difficulty distinguishing between reds, greens, browns and oranges. They also commonly confuse different types of blue and purple hues.";
String directed3 = "Most people with color blindness lead normal lives. However, having color blindness can make certain day-to-day tasks more difficult,like driving, cooking, and using electronics.However, corrective contact lenses or glasses may help neutralize red green color blindness. These come in the form of tinted lenses or filters that go over your glasses and can help you see reds and greens more clearly.Since red-green color blindness is largely inherited, you may experience issues with seeing certain colors unless you wear corrective lenses.";

class HomePagerg extends StatefulWidget {
  @override
  _HomePagergState createState() => _HomePagergState();
}

class _HomePagergState extends State<HomePagerg> {
  final double _borderRadius = 24;

  var items = [
    PlaceInfo('RED-GREEN COLOUR BLINDNESS', Color(0xFF68F8CC), Colors.blue,directed1),
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
                child: Text('Diagnosis : You might have RED-GREEN Color deficiency',
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