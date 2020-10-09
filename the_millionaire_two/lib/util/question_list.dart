import 'package:who_win_the_million/models/question.dart';

class QuestionList {
  List<Question> _questionList = [
    Question(
      theLevel: 'L1',
      questionNum: 1,
      questionIs: 'ما هي عاصمة إثيوبيا؟',
      answerIs: 'أديس أبابا',
    ),
    Question(
      theLevel: 'L1',
      questionNum: 2,
      questionIs: 'كم عدد أحرف اللغة الإنجليزية؟',
      answerIs: '26 حرفاً',
    ),
    Question(
      theLevel: 'L1',
      questionNum: 3,
      questionIs: 'ما هو أصل جبنة البارميزان؟',
      answerIs: 'إيطاليا',
    ),
    Question(
      theLevel: 'L1',
      questionNum: 4,
      questionIs: 'ما هي أكبر هضبة في العالم؟',
      answerIs: 'هضبة التبت',
    ),
    Question(
      theLevel: 'L1',
      questionNum: 5,
      questionIs: 'من هي أول امرأة فازت بجائزة نوبل؟',
      answerIs: 'ماري كوري',
    ),
    Question(
      theLevel: 'L2',
      questionNum: 6,
      questionIs: 'أين تم افتتاح أول بنك للدم في العالم؟',
      answerIs: 'في مدينة نيويورك، عام 1940م',
    ),
    Question(
      theLevel: 'L2',
      questionNum: 7,
      questionIs: 'ما هي الدولة التي اشتهرت بالسوشي؟',
      answerIs: 'اليابان',
    ),
    Question(
      theLevel: 'L2',
      questionNum: 8,
      questionIs: 'ما هو أعلى جبل في العالم؟',
      answerIs: 'جبل إيفرست',
    ),
    Question(
      theLevel: 'L2',
      questionNum: 9,
      questionIs: 'ما هي أكبر قارة في العالم من حيث المساحة؟',
      answerIs: 'قارة آسيا',
    ),
    Question(
      theLevel: 'L2',
      questionNum: 10,
      questionIs: 'ما هي أكبر بحيرة في العالم حسب المساحة؟',
      answerIs: 'بُحيرة قزوين',
    ),
    Question(
      theLevel: 'L3',
      questionNum: 11,
      questionIs: 'ما هو أعلى شلالات العالم؟',
      answerIs: 'شلالات آنجل',
    ),
    Question(
      theLevel: 'L3',
      questionNum: 12,
      questionIs: 'ما هي أكبر دولة في العالم من حيث المساحة؟',
      answerIs: 'روسيا',
    ),
    Question(
      theLevel: 'L3',
      questionNum: 13,
      questionIs: 'ما هو البحر الذي يفصل بين دولتي تركيا واليونان؟',
      answerIs: 'بحر إيجه',
    ),
    Question(
      theLevel: 'L3',
      questionNum: 14,
      questionIs: 'ما هو لقب كوكب بلوتو؟',
      answerIs: 'الكوكب القزم',
    ),
    Question(
      theLevel: 'L3',
      questionNum: 15,
      questionIs: 'ما هو الغاز المشهور بغاز الضحك؟',
      answerIs: 'أكسيد النيتروس',
    ),
    Question(
      theLevel: 'L3',
      questionNum: 16,
      questionIs: 'ما هما العضوان اللذان يستمران بالنمو طوال حياة الإنسان؟',
      answerIs: 'الأنف والأذن',
    ),
    Question(
      theLevel: 'L3',
      questionNum: 17,
      questionIs: 'لماذا تختلف ألوان النجوم؟',
      answerIs: 'بسبب اختلاف درجات حرارتها',
    ),
    Question(
      theLevel: 'L3',
      questionNum: 18,
      questionIs: 'ما هو شكل مجرة درب التبانة؟',
      answerIs: 'حلزوني',
    ),
    Question(
      theLevel: 'L3',
      questionNum: 19,
      questionIs: 'ما هو الغاز المشهور بغاز الضحك؟',
      answerIs: 'أكسيد النيتروس',
    ),
  ];

  Question getQuestionList(int qNum) => _questionList[qNum];
}
