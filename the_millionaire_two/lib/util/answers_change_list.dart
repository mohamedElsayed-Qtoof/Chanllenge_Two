import 'package:who_win_the_million/models/the_answers.dart';

class TheAnswersChangeList {
  List<TheAnswers> _answerChangeList = [
    TheAnswers(
        theLevel: 'L1',
        questAnsAt: 4,
        qAns1: 'الكوكب الأبيض',
        qAns2: 'الكوكب الغازي',
        qAns3: 'الكوكب الأحمر',
        qAns4: 'الكوكب الأسود'),
    TheAnswers(
        theLevel: 'L1',
        questAnsAt: 5,
        qAns1: '3.121 ملايين سنة',
        qAns2: '4.543 ملايين سنة',
        qAns3: '2.103 ملايين سنة',
        qAns4: '5.211 ملايين سنة'),
    TheAnswers(
        theLevel: 'L1',
        questAnsAt: 2,
        qAns1: 'الأنف والأذن',
        qAns2: 'المخ والصدغ',
        qAns3: 'العين والقلب',
        qAns4: 'الشعر والأظافر'),
    TheAnswers(
        theLevel: 'L2',
        questAnsAt: 4,
        qAns1: 'الأكسجين',
        qAns2: 'الميثان',
        qAns3: 'الماء',
        qAns4: 'الدم'),
    TheAnswers(
        theLevel: 'L2',
        questAnsAt: 5,
        qAns1: 'أكسيد الميثان',
        qAns2: 'أكسيد الأوزون',
        qAns3: 'أكسيد النحاسيك',
        qAns4: 'أكسيد النيتروس'),
    TheAnswers(
        theLevel: 'L2',
        questAnsAt: 4,
        qAns1: '11 كواكب',
        qAns2: '6 كواكب',
        qAns3: '8 كواكب',
        qAns4: '7 كواكب'),
    TheAnswers(
        theLevel: 'L3',
        questAnsAt: 4,
        qAns1: 'جير هاردت',
        qAns2: 'البيروني',
        qAns3: 'وليام هارفي',
        qAns4: 'ابن سينا'),
    TheAnswers(
        theLevel: 'L3',
        questAnsAt: 5,
        qAns1: 'دائري',
        qAns2: 'نصف قطري',
        qAns3: 'شبة مستطيل',
        qAns4: 'حلزوني'),
    TheAnswers(
        theLevel: 'L3',
        questAnsAt: 3,
        qAns1: 'بسبب اختلاف مواقعها',
        qAns2: 'بسبب اختلاف درجات حرارتها',
        qAns3: 'بسبب اختلاف ابعادها',
        qAns4: 'بسبب اختلاف أعمارها'),
  ];

  TheAnswers getAnswersChangedList(int qNum, String levelNum) =>
      _answerChangeList[qNum];
}
