import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'quiz_screen_event.dart';
part 'quiz_screen_state.dart';

int finalScore = 0;

class QuizScreenBloc extends Bloc<QuizScreenEvent, QuizScreenState> {
  QuizScreenBloc() : super(QuizScreenInitial()) {
    on<QuizScreenEvent>((event, emit) {});
    on<FetchData>(_fetchData);
    on<NextQuestion>(_nextQuestion);
    on<RadioButton>(_radioButton);
    on<AnswerSelected>(_answerSelected);
  }

  void _fetchData(FetchData event, Emitter<QuizScreenState> emit) async {
    http.Response response = await http.get(Uri.parse(event.url));
    Map mapResponse;
    List mapdataResponse;
    mapResponse = jsonDecode(response.body);
    mapdataResponse = mapResponse['questions'];
    List Question = mapdataResponse
        .map((element) => element['description'] as String)
        .toList();
    List explanation = mapdataResponse
        .map((element) => element['detailed_solution'] as String)
        .toList();
    List option = mapdataResponse.map((element) => element['options']).toList();

    emit(QuizStart(
        Options: option, Question: Question, Explanation: explanation));
  }

  void _nextQuestion(NextQuestion event, Emitter<QuizScreenState> emit) {
    if (event.questionNo < event.numberOfQuestion - 1) {
      emit(NextQuesState(questionNo: event.questionNo + 1));
    } else {
      emit(SubmitQuiz(Score: finalScore));
    }
  }

  void _radioButton(RadioButton event, Emitter<QuizScreenState> emit) {
    if (event.radiobutton1 == true) {
      event.radiobutton2 = event.radiobutton3 = event.radiobutton4 = false;
    }
    if (event.radiobutton2 == true) {
      event.radiobutton1 = event.radiobutton3 = event.radiobutton4 = false;
    }
    if (event.radiobutton3 == true) {
      event.radiobutton2 = event.radiobutton1 = event.radiobutton4 = false;
    }
    if (event.radiobutton4 == true) {
      event.radiobutton2 = event.radiobutton3 = event.radiobutton1 = false;
    }
    emit(RadioButtonState(
        radioButton1: event.radiobutton1,
        radioButton2: event.radiobutton2,
        radioButton3: event.radiobutton3,
        radioButton4: event.radiobutton4));
  }

  void _answerSelected(AnswerSelected event, Emitter<QuizScreenState> emit) {
    if (event.ifOptioniscorrect == true) {
      finalScore++;
      print('finalScore:$finalScore');
    }
  }
}
