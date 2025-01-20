import 'package:flutter/material.dart';
import 'package:quiz_app/ui_assets/cubical_boxes.dart';

class TopicScreen extends StatelessWidget {
  const TopicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          "Topics",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 1000,
          child: Stack(children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'lib/assets/7.png',
                height: 200,
                width: 200,
              ),
            ),
            TopicBoxes(
              topValue: 0,
              displaytext: "Heridity and Variations",
              leftValue: 240,
              textAlign: TextAlign.start,
            ),
            Positioned(
              top: 230,
              left: 240,
              child: Image.asset(
                'lib/assets/4.png',
                height: 200,
                width: 200,
              ),
            ),
            TopicBoxes(
                topValue: 230,
                displaytext: "Molecular Basis Of Inheritance",
                leftValue: -30,
                textAlign: TextAlign.end),
            Positioned(
              top: 440,
              left: 0,
              child: Image.asset(
                'lib/assets/9.png',
                height: 200,
                width: 200,
              ),
            ),
            TopicBoxes(
              topValue: 440,
              displaytext: "Evolution",
              leftValue: 240,
              textAlign: TextAlign.start,
            ),
          ]),
        ),
      )),
    );
    ;
  }
}
