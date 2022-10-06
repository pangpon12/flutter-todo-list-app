import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:real_project/readmore.dart';

import 'DetailPage.dart';

class Homefirstpage extends StatefulWidget {
  @override
  HomefirstpageState createState() => HomefirstpageState();
}

class HomefirstpageState extends State<Homefirstpage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 7, 115, 115),
      body: Column(children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            textAlign: TextAlign.left,
            'Home',
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Image(image: AssetImage('image/logoBG.png')),
      ]),
    ));
  }
}
