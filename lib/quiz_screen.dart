import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/bloc/quiz_screen_bloc.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/ui_assets/cubical_boxes.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  bool radiobutton1 = false;
  bool radiobutton2 = false;
  bool radiobutton3 = false;
  bool radiobutton4 = false;
  int questionNumber = 0;
  List QuizQuestion = [];
  List Options = [];
  List Explanation = [];
  int optionSelected = 0;
  List OptionList = [];
  @override
  void initState() {
    context
        .read<QuizScreenBloc>()
        .add(FetchData(url: "https://api.jsonserve.com/Uw5CrX"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ;
    return BlocConsumer<QuizScreenBloc, QuizScreenState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is QuizStart) {
          // Update the quiz data when state changes
          setState(() {
            QuizQuestion = state.Question;
            Options = state.Options;
            Explanation = state.Explanation;
          });
        }
        if (state is NextQuesState) {
          setState(() {
            questionNumber = state.questionNo;
          });
          print(questionNumber);
        }
        if (state is SubmitQuiz) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ResultScreen(
                        finalScore: state.Score,
                        questions: QuizQuestion,
                        Options: Options,
                        ChoosenOptions: OptionList,
                        Explanation: Explanation,
                      )));
        }
        if (state is RadioButtonState) {
          setState(() {
            radiobutton1 = state.radioButton1;
            radiobutton2 = state.radioButton2;
            radiobutton3 = state.radioButton3;
            radiobutton4 = state.radioButton4;

            if (radiobutton1 == true) {
              optionSelected = 0;
              OptionList.add(optionSelected);
            }
            if (radiobutton2 == true) {
              optionSelected = 1;
              OptionList.add(optionSelected);
            }
            if (radiobutton3 == true) {
              optionSelected = 2;
              OptionList.add(optionSelected);
            }
            if (radiobutton4 == true) {
              optionSelected = 3;
              OptionList.add(optionSelected);
            } else {
              OptionList.add(5);
            }
          });
        }
      },
      builder: (context, state) {
        if (state is! QuizStart && (QuizQuestion.isEmpty || Options.isEmpty)) {
          return Scaffold(
              appBar: AppBar(
                title: Text("Test"),
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
              ),
              body: Center(child: CircularProgressIndicator()));
        }

        return Scaffold(
            appBar: AppBar(
              title: Text("QUIZ"),
              foregroundColor: Colors.white,
              backgroundColor: Colors.black,
            ),
            body: Center(
              child: Column(
                children: [
                  Text(
                    "Question : ${questionNumber + 1}/${QuizQuestion.length}",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.cyanAccent,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: SizedBox(
                                    width: 350,
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    child: ClipRect(
                                      child: new BackdropFilter(
                                        filter: new ImageFilter.blur(
                                            sigmaX: 10.0, sigmaY: 10.0),
                                        child: Container(
                                          decoration: new BoxDecoration(
                                              color: Colors.grey.shade300
                                                  .withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Center(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0),
                                              child: Text(
                                                QuizQuestion.isNotEmpty
                                                    ? QuizQuestion[
                                                        questionNumber] // Access safely
                                                    : "Loading...",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                    fontFamily: 'TafelSans',
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Column(
                                  children: [
                                    quizOptions(
                                      radiobutton: radiobutton1,
                                      optiontext: Options[questionNumber][0]
                                          ['description'],
                                      OptionNo: 1,
                                    ),
                                    quizOptions(
                                        radiobutton: radiobutton2,
                                        optiontext: Options[questionNumber][1]
                                            ['description'],
                                        OptionNo: 2),
                                    quizOptions(
                                        radiobutton: radiobutton3,
                                        optiontext: Options[questionNumber][2]
                                            ['description'],
                                        OptionNo: 3),
                                    quizOptions(
                                        radiobutton: radiobutton4,
                                        optiontext: Options[questionNumber][3]
                                            ['description'],
                                        OptionNo: 4),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: TextButton(
                                onPressed: () {
                                  context.read<QuizScreenBloc>().add(
                                      NextQuestion(
                                          questionNo: questionNumber,
                                          numberOfQuestion:
                                              QuizQuestion.length));
                                  context
                                      .read<QuizScreenBloc>()
                                      .add(RadioButton());
                                  context.read<QuizScreenBloc>().add(
                                      AnswerSelected(
                                          optionSelected: optionSelected,
                                          ifOptioniscorrect:
                                              Options[questionNumber]
                                                      [optionSelected]
                                                  ['is_correct']));
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Center(
                                    child: Text(
                                      questionNumber < QuizQuestion.length - 1
                                          ? 'NEXT'
                                          : 'Submit',
                                      style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
