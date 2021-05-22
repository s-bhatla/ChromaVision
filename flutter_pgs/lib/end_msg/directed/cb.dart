import 'package:flutter/material.dart';

class CB extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    final String detail = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        backgroundColor: Color(0xFF8CFFFF),
        appBar: AppBar(
          title: Text(''),
          backgroundColor: Color(0x118CFFFF),
        ),
        body:
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              child: Container(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Text(
                      detail,
                      style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 23,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF333333),
                      ),
                    ),
                  ),
                  height: 600.0,
                  width: 370.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      color: Color(0xFFE6FFFC),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10.0,
                            offset: Offset(5.0,10.0)
                        )
                      ]
                  )),
            ),
          ],
        )
    );
  }



}
