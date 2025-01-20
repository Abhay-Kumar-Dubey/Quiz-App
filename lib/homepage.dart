import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/bloc/quiz_screen_bloc.dart';
import 'package:quiz_app/topic_screen.dart';
import 'package:quiz_app/ui_assets/cubical_boxes.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<QuizScreenBloc, QuizScreenState>(
      listener: (context, state) {},
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            "Chapters",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 2200,
            child: Stack(children: [
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  'lib/assets/1.png',
                  height: 200,
                  width: 200,
                ),
              ),
              CubicalBoxes(
                topValue: 0,
                displaytext: "Diversity in Living World",
                leftValue: 240,
                textAlign: TextAlign.start,
              ),
              Positioned(
                top: 230,
                left: 240,
                child: Image.asset(
                  'lib/assets/2.png',
                  height: 200,
                  width: 200,
                ),
              ),
              CubicalBoxes(
                  topValue: 230,
                  displaytext: "Structural organisation in animals and plants",
                  leftValue: -30,
                  textAlign: TextAlign.end),
              Positioned(
                top: 440,
                left: 0,
                child: Image.asset(
                  'lib/assets/3.png',
                  height: 200,
                  width: 200,
                ),
              ),
              CubicalBoxes(
                topValue: 440,
                displaytext: "Cell Structures and functions",
                leftValue: 240,
                textAlign: TextAlign.start,
              ),
              Positioned(
                top: 660,
                left: 240,
                child: Image.asset(
                  'lib/assets/4.png',
                  height: 200,
                  width: 200,
                ),
              ),
              CubicalBoxes(
                  topValue: 660,
                  displaytext: "Plant Physiology",
                  leftValue: -30,
                  textAlign: TextAlign.end),
              Positioned(
                top: 880,
                left: 0,
                child: Image.asset(
                  'lib/assets/5.png',
                  height: 200,
                  width: 200,
                ),
              ),
              CubicalBoxes(
                topValue: 880,
                displaytext: "Human Physiology        ",
                leftValue: 240,
                textAlign: TextAlign.start,
              ),
              Positioned(
                top: 1100,
                left: 240,
                child: Image.asset(
                  'lib/assets/6.png',
                  height: 200,
                  width: 200,
                ),
              ),
              CubicalBoxes(
                  topValue: 1100,
                  displaytext: "Reproduction",
                  leftValue: -30,
                  textAlign: TextAlign.end),
              Positioned(
                top: 1320,
                left: 0,
                child: Image.asset(
                  'lib/assets/7.png',
                  height: 200,
                  width: 200,
                ),
              ),
              CubicalBoxes(
                topValue: 1320,
                displaytext: "Genetics and Evolution",
                leftValue: 240,
                textAlign: TextAlign.start,
              ),
              Positioned(
                top: 1540,
                left: 240,
                child: Image.asset(
                  'lib/assets/8.png',
                  height: 200,
                  width: 200,
                ),
              ),
              CubicalBoxes(
                  topValue: 1540,
                  displaytext: "Biology And Human Welfare",
                  leftValue: -30,
                  textAlign: TextAlign.end),
              Positioned(
                top: 1760,
                left: 0,
                child: Image.asset(
                  'lib/assets/9.png',
                  height: 200,
                  width: 200,
                ),
              ),
              CubicalBoxes(
                topValue: 1760,
                displaytext: "Biotechnology and it's Applications",
                leftValue: 240,
                textAlign: TextAlign.start,
              ),
              CubicalBoxes(
                  topValue: 1980,
                  displaytext: "Echology and Environment",
                  leftValue: -30,
                  textAlign: TextAlign.end),
            ]),
          ),
        )),
      ),
    );
  }
}
