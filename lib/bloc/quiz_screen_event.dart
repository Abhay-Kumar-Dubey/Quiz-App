part of 'quiz_screen_bloc.dart';

@immutable
sealed class QuizScreenEvent {}

final class NextQuestion extends QuizScreenEvent {
  int questionNo;
  int numberOfQuestion;
  NextQuestion({required this.questionNo, required this.numberOfQuestion});
}

final class FetchData extends QuizScreenEvent {
  final String url;

  FetchData({required this.url});
}

final class AnswerSelected extends QuizScreenEvent {
  final int optionSelected;
  final bool ifOptioniscorrect;

  AnswerSelected(
      {required this.optionSelected, required this.ifOptioniscorrect});
}

final class RadioButton extends QuizScreenEvent {
  bool radiobutton1;
  bool radiobutton2;
  bool radiobutton3;
  bool radiobutton4;
  RadioButton({
    this.radiobutton1 = false,
    this.radiobutton2 = false,
    this.radiobutton3 = false,
    this.radiobutton4 = false,
  });
}
