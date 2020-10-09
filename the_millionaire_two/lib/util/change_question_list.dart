import 'package:who_win_the_million/models/change_question.dart';

class ChangeQuestionList {
  List<ChangeQuestion> _questionChangeList = [
    ChangeQuestion(
      theLevel: 'L1',
      questionNum: 1,
      questionIs: 'ماذا يُسمى كوكب المريخ؟',
      answerIs: 'الكوكب الأحمر',
    ),
    ChangeQuestion(
      theLevel: 'L1',
      questionNum: 2,
      questionIs: 'كم يبلغ عمر الأرض؟',
      answerIs: '4.543 ملايين سنة',
    ),
    ChangeQuestion(
      theLevel: 'L2',
      questionNum: 4,
      questionIs: 'ما هي المادة التي تُشكّل 80% من حجم دماغ الإنسان؟',
      answerIs: 'الماء',
    ),
    ChangeQuestion(
      theLevel: 'L3',
      questionNum: 7,
      questionIs: 'من هو مُكتشف الدورة الدموية؟',
      answerIs: 'وليام هارفي',
    ),
  ];

  ChangeQuestion changeQestion(int qNum) => _questionChangeList[qNum];
}
