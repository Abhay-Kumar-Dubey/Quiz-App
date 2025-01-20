part of 'quiz_screen_bloc.dart';

@immutable
sealed class QuizScreenState {}

final class QuizScreenInitial extends QuizScreenState {}

final class SubmitQuiz extends QuizScreenState {
  final int Score;
  SubmitQuiz({required this.Score});
}

final class RadioButtonState extends QuizScreenState {
  bool radioButton1;
  bool radioButton2;
  bool radioButton3;
  bool radioButton4;
  RadioButtonState({
    required this.radioButton1,
    required this.radioButton2,
    required this.radioButton3,
    required this.radioButton4,
  });
}

final class QuizStart extends QuizScreenState {
  List Question;
  List Options;
  List Explanation;

  QuizStart(
      {required this.Options,
      required this.Question,
      required this.Explanation});
}

final class NextQuesState extends QuizScreenState {
  int questionNo;
  NextQuesState({required this.questionNo});
}
