import 'package:who_win_the_million/models/the_answers.dart';

class TheAnswersList {
  List<TheAnswers> _ansList = [
    TheAnswers(
      theLevel: 'L1',
      questAnsAt: 4,
      qAns1: 'لواندا',
      qAns2: 'كانبرا',
      qAns3: 'أديس أبابا',
      qAns4: 'غابورون',
    ),
    TheAnswers(
      theLevel: 'L1',
      questAnsAt: 3,
      qAns1: '29 حرفاً',
      qAns2: '26 حرفاً',
      qAns3: '28 حرفاً',
      qAns4: '24 حرفاً',
    ),
    TheAnswers(
        theLevel: 'L1',
        questAnsAt: 2,
        qAns1: 'إيطاليا',
        qAns2: 'فرنسا',
        qAns3: 'سويسرا',
        qAns4: 'هولاندا'),
    TheAnswers(
        theLevel: 'L1',
        questAnsAt: 5,
        qAns1: 'هضبة الجولان',
        qAns2: 'الهضبة الأثيوبية',
        qAns3: 'هضبة نجد',
        qAns4: 'هضبة التبت'),
    TheAnswers(
        theLevel: 'L1',
        questAnsAt: 2,
        qAns1: 'ماري كوري',
        qAns2: 'سلمى لاغرلوف',
        qAns3: 'غراتسيا ديليدا',
        qAns4: 'سيغريد أوندست'),
    TheAnswers(
        theLevel: 'L2',
        questAnsAt: 3,
        qAns1: 'في مدينة باريس، عام 1937م',
        qAns2: 'في مدينة نيويورك، عام 1940م',
        qAns3: 'في مدينة امستردام، عام 1943م',
        qAns4: 'في مدينة منهاتن، عام 1946م'),
    TheAnswers(
        theLevel: 'L2',
        questAnsAt: 5,
        qAns1: 'الفلبين',
        qAns2: 'كوريا الجنوبية',
        qAns3: 'باكستان',
        qAns4: 'اليابان'),
    TheAnswers(
        theLevel: 'L2',
        questAnsAt: 4,
        qAns1: 'جبل كي 2',
        qAns2: 'جبل وستو',
        qAns3: 'جبل إيفرست',
        qAns4: 'جبل كانغشينجونغا'),
    TheAnswers(
        theLevel: 'L2',
        questAnsAt: 3,
        qAns1: 'قارة أفريقيا',
        qAns2: 'قارة آسيا',
        qAns3: 'قارة أمريكا',
        qAns4: 'قارة أستراليا'),
    TheAnswers(
        theLevel: 'L2',
        questAnsAt: 2,
        qAns1: 'بُحيرة قزوين',
        qAns2: 'بُحيرة سوبيريور',
        qAns3: 'بُحيرة تنجانيقا',
        qAns4: 'بُحيرة فيكتوريا'),
    TheAnswers(
        theLevel: 'L3',
        questAnsAt: 4,
        qAns1: 'شلالات فيكتوريا',
        qAns2: 'شلالات إجوازو',
        qAns3: 'شلالات آنجل',
        qAns4: 'شلالات أوزود'),
    TheAnswers(
        theLevel: 'L3',
        questAnsAt: 5,
        qAns1: 'الجزائر',
        qAns2: 'الصين',
        qAns3: 'البرازيل',
        qAns4: 'روسيا'),
    TheAnswers(
        theLevel: 'L3',
        questAnsAt: 5,
        qAns1: 'بحر الشمال',
        qAns2: 'بحر بيرنغ',
        qAns3: 'البحر الأبيض',
        qAns4: 'بحر إيجه'),
    TheAnswers(
        theLevel: 'L3',
        questAnsAt: 2,
        qAns1: 'الكوكب القزم',
        qAns2: 'الكوكب الأحمر',
        qAns3: 'الكوكب المظلم',
        qAns4: 'الكوكب العملاق'),

    //******************************************************** */
    TheAnswers(
        theLevel: 'L3',
        questAnsAt: 4,
        qAns1: 'أكسيد الحديد',
        qAns2: 'أكسيد البوتاسيم',
        qAns3: 'أكسيد النيتروس',
        qAns4: 'أكسيد النحاس'),
    //*
    TheAnswers(
        theLevel: 'L3',
        questAnsAt: 2,
        qAns1: 'الأنف والأذن',
        qAns2: 'المخ والصدغ',
        qAns3: 'العين والقلب',
        qAns4: 'الشعر والأظافر'),
    //*
    TheAnswers(
        theLevel: 'L3',
        questAnsAt: 3,
        qAns1: 'بسبب اختلاف مواقعها',
        qAns2: 'بسبب اختلاف درجات حرارتها',
        qAns3: 'بسبب اختلاف ابعادها',
        qAns4: 'بسبب اختلاف أعمارها'),
    TheAnswers(
        theLevel: 'L3',
        questAnsAt: 5,
        qAns1: 'دائري',
        qAns2: 'نصف قطري',
        qAns3: 'شبة مستطيل',
        qAns4: 'حلزوني'),
    TheAnswers(
        theLevel: 'L3',
        questAnsAt: 2,
        qAns1: 'الكوكب القزم',
        qAns2: 'الكوكب الأحمر',
        qAns3: 'الكوكب المظلم',
        qAns4: 'الكوكب العملاق'),
  ];

  TheAnswers getAnswersList(int qNum) => _ansList[qNum];
}
