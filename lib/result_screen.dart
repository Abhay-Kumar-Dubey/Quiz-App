import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/bloc/quiz_screen_bloc.dart';
import 'package:quiz_app/ui_assets/result_ui.dart';

class ResultScreen extends StatelessWidget {
  final int finalScore;
  List questions;
  List Options;
  List ChoosenOptions;
  List Explanation;

  ResultScreen(
      {super.key,
      required this.finalScore,
      required this.questions,
      required this.Options,
      required this.ChoosenOptions,
      required this.Explanation});

  @override
  Widget build(BuildContext context) {
    List CorrectAnswers = [];
    for (int i = 0; i < questions.length; i++) {
      for (int j = 0; j < 4; j++) {
        if (Options[i][j]['is_correct'] == true) {
          CorrectAnswers.add(j);
        }
      }
    }
    double progress = 0;
    progress = (finalScore / 10);
    return BlocConsumer<QuizScreenBloc, QuizScreenState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.cyanAccent,
          appBar: AppBar(
            title: Text('Result'),
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30),
                        // color: Colors.cyanAccent,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 16, left: 20.0, bottom: 40),
                            child: Text(
                              'Final Score is ${finalScore * 4}/${10 * 4}',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 150,
                                height: 150,
                                child: RadialProgressAnimation(
                                    progress: progress, color: Colors.red),
                              ),
                              progress > 0.5
                                  ? Lottie.asset('lib/assets/gold.json',
                                      width: 150)
                                  : Lottie.asset('lib/assets/Bronze.json',
                                      width: 150)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30),
                        // color: Colors.cyanAccent,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 19.0),
                            child: Text(
                              'Summary Of Your Quiz',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: ListView.builder(
                                itemCount: questions.length,
                                itemBuilder: (context, index) {
                                  return ResultListCard(
                                    Question: questions[index],
                                    OptionText: ChoosenOptions[index] == 5
                                        ? "No option Selected"
                                        : Options[index][ChoosenOptions[index]]
                                            ['description'],
                                    index: index,
                                    CorrectOption: Options[index]
                                        [CorrectAnswers[index]]['description'],
                                    Explanation: Explanation[index],
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
