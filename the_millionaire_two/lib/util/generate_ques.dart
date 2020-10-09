import 'package:who_win_the_million/constants/cash_values/question_cash_value.dart';
import 'package:who_win_the_million/models/player_info.dart';
import 'package:who_win_the_million/models/question.dart';
import 'package:who_win_the_million/util/question_list.dart';

import 'package:who_win_the_million/models/the_answers.dart';
import 'package:who_win_the_million/util/answers_list.dart';

import 'package:who_win_the_million/models/change_question.dart';
import 'package:who_win_the_million/util/change_question_list.dart';

class GenerateQues {
  int questionNum = 0;
  int wrongAnswers = 0;
  int numOfChangeQuestion = 0;

  // * ---------------------------------------------------
  // * Question to Player
  Question qestion = Question();
  // * Question List
  QuestionList qestionList = QuestionList();
  // * ---------------------------------------------------
  QuestionCashValues cashQuestionsValues = QuestionCashValues();

  // * ---------------------------------------------------
  // * Suggested Answers Class (Get Input To Compare)
  TheAnswers theAnswers = TheAnswers();
  // * Suggested Answers List
  TheAnswersList theAnswersList = TheAnswersList();
  // * ---------------------------------------------------

  // * ---------------------------------------------------
  // * Change Question
  ChangeQuestion changeQuestion = ChangeQuestion();

  // * ------
  // * List of Subestedude Question
  // * -> (onChange Question After Fifth Question (Level2))
  // *
  ChangeQuestionList changeQuestionList = ChangeQuestionList();
  // * ---------------------------------------------------
  // *  Player Statistic
  //
  PlayerInfo playerInfo = PlayerInfo();
  // * ---------------------------------------------------
  // *   [ Method ]

  GenerateQues() {
    getNewQuestions(questionNum, wrongAnswers);
  }

  // * ---------------------------------------------------
  // *   [ Method ]
  // * Get Question & Answer form List

  Question getNewQuestions(int quesNum, int wrongAnswers) {
    var newQestion = qestionList.getQuestionList(quesNum);

    //playerInfo = getPlayerNewBalance(quesNum);
    return newQestion;
  }

  // * ---------------------------------------------------
  // *   [ Method ]
  // * Get Answers of a Question form List

  TheAnswers getAnswers(int quesNum) {
    var newAnswersList = theAnswersList.getAnswersList(quesNum);
    return newAnswersList;
  }

  // * ---------------------------------------------------
  // *   [ Method ]
  // * Change Player Question As  (Help Tools)

  ChangeQuestion changeTheQestion(int quesNum) {
    var newAnswersList = changeQuestionList.changeQestion(quesNum);
    return newAnswersList;
  }

  // * ---------------------------------------------------
  // *   [ Method ]

}
