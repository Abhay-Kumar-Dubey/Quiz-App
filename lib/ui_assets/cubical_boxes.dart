import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/bloc/quiz_screen_bloc.dart';
import 'package:quiz_app/homepage.dart';
import 'package:quiz_app/quiz_screen.dart';
import 'package:quiz_app/topic_screen.dart';

class CubicalBoxes extends StatelessWidget {
  double topValue;
  double leftValue;
  String displaytext;
  TextAlign textAlign;

  CubicalBoxes(
      {required this.topValue,
      required this.leftValue,
      required this.displaytext,
      required this.textAlign});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizScreenBloc, QuizScreenState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Positioned(
          top: topValue,
          left: leftValue,
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TopicScreen()));
            },
            child: Container(
              height: 200,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.cyanAccent,
                  borderRadius: BorderRadius.circular(38)),
              child: ClipRect(
                child: new BackdropFilter(
                  filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: new Container(
                    width: 200.0,
                    height: 200.0,
                    decoration: new BoxDecoration(
                        color: Colors.grey.shade200.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(38)),
                    child: new Center(
                      child: Text(
                        textWidthBasis: TextWidthBasis.parent,
                        displaytext,
                        textAlign: textAlign,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontFamily: 'TafelSans',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class TopicBoxes extends StatelessWidget {
  double topValue;
  double leftValue;
  String displaytext;
  TextAlign textAlign;

  TopicBoxes(
      {required this.topValue,
      required this.leftValue,
      required this.displaytext,
      required this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topValue,
      left: leftValue,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => QuizScreen()));
        },
        child: Container(
          height: 200,
          width: 250,
          decoration: BoxDecoration(
              color: Colors.cyanAccent,
              borderRadius: BorderRadius.circular(38)),
          child: ClipRect(
            child: new BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: new Container(
                width: 200.0,
                height: 200.0,
                decoration: new BoxDecoration(
                    color: Colors.grey.shade200.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(38)),
                child: new Center(
                  child: Text(
                    textWidthBasis: TextWidthBasis.parent,
                    displaytext,
                    textAlign: textAlign,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontFamily: 'TafelSans',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class quizOptions extends StatefulWidget {
  String optiontext;
  bool radiobutton;
  int OptionNo;
  quizOptions(
      {required this.radiobutton,
      required this.optiontext,
      required this.OptionNo});

  @override
  State<quizOptions> createState() => _quizOptionsState();
}

class _quizOptionsState extends State<quizOptions> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget.radiobutton = true;
            if (widget.OptionNo == 1) {
              context
                  .read<QuizScreenBloc>()
                  .add(RadioButton(radiobutton1: widget.radiobutton));
            }
            if (widget.OptionNo == 2) {
              context
                  .read<QuizScreenBloc>()
                  .add(RadioButton(radiobutton2: widget.radiobutton));
            }
            if (widget.OptionNo == 3) {
              context
                  .read<QuizScreenBloc>()
                  .add(RadioButton(radiobutton3: widget.radiobutton));
            }
            if (widget.OptionNo == 4) {
              context
                  .read<QuizScreenBloc>()
                  .add(RadioButton(radiobutton4: widget.radiobutton));
            }
          });
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 3),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      color: widget.radiobutton ? Colors.green.shade600 : null,
                      border: Border.all(color: Colors.black, width: 3),
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
              Flexible(
                child: Text(widget.optiontext,
                    style: TextStyle(fontSize: 20),
                    overflow: TextOverflow.visible),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
