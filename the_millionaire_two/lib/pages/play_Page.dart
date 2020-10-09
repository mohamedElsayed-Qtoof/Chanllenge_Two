import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:who_win_the_million/GUI/card/custom_card_design.dart';
import 'package:who_win_the_million/components/money_Level_card_design.dart';
import 'package:who_win_the_million/constants/cash_values/question_cash_value.dart';
import 'package:who_win_the_million/constants/cash_values/question_num_val.dart';
import 'package:who_win_the_million/constants/colors/app_colors.dart';
import 'package:who_win_the_million/models/player_info.dart';
import 'package:who_win_the_million/models/question.dart';
import 'package:who_win_the_million/models/the_answers.dart';
import 'package:who_win_the_million/pages/finish_page.dart';
import 'package:who_win_the_million/util/answers_list.dart';
import 'package:who_win_the_million/util/generate_ques.dart';

// ------------------------
// * Main Competition Page
// ------------------------

class PlayPage extends StatefulWidget {
  static final id = 'PlayPage';

  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  //*
  //*
  _PlayPageState parent;
  // ***********************************************
  Color moneyBtnColor = AppColors.myMoneyBtnColorNrml;
  Color moneyBtnColorEff = AppColors.myMoneyBtnColorEff;
  Color levelBtnColor = AppColors.cardBgColor5;
  Color ansBtnColor = AppColors.ansBtnColrNormalState;
  Color ansBtnColorBlue = AppColors.btnColorEff1;
  Color btnColorWithDrow = AppColors.btnColorWithDrow;
  Color ansBtnColorEff = AppColors.ansBtnColrEffectState;
  Color correctAnsColor = AppColors.correctAnsColor;

  // * ---------------------------------------------
  // * Class Instances
  // * ---------------
  TheAnswersList theAnswersList = TheAnswersList();
  QuestionCashValues cashValues = QuestionCashValues();
  QuestionNumValues numValues = QuestionNumValues();

  PlayerInfo playerInfo = PlayerInfo();
  Question question = Question();
  TheAnswers theAnswers = TheAnswers();
  GenerateQues generateQes = GenerateQues();

  // * Get MoneyLeverCardSeign Instance
  MoneyNumCards moneyNumCards = MoneyNumCards();

  // * ---------------------------------------------
  bool btnNotClicked = true;
  bool _enabled = true;

  // bool isChangeQestion = false;
  bool changeQuestionIsUsed = false;

  //* Active Per Clicked Only - To Stop [ Hide Two Question ]
  bool changeQuestionIsActive = false;

  //* Active Per Clicked Only - To Stop [ Change Question ]
  bool hideTwoAnswersIsActive = false;

  bool _isAnswered = false;
  bool _effectColor = false;

  bool ans1 = false;
  bool ans2 = false;
  bool ans3 = false;
  bool ans4 = false;

  //* Hide Answer Per Player Select
  bool hideAns1 = false;
  bool hideAns2 = false;
  bool hideAns3 = false;
  bool hideAns4 = false;

  bool correctPlayerAns = false;
  bool hideTwoAnswersUsed = false;
  bool hideTwoAnswers = false;

  //* ----------------------------------------------
  String newQuestion = "";

  String newAns1 = "";
  String newAns2 = "";
  String newAns3 = "";
  String newAns4 = "";

  String theCorrectAnsIs = "";
  String playerBalance = '0';

  //* ----------------------------------------------
  // * Count of Questions
  // * ------------------
  int countQuestion = 0;
  int wrongeAns = 0;
  int totalQuestion = 18; // Init Value
  int numOfChangeQuestion = 0;
  int totalErrors = 0;

  int playLevel = 1;
  int displayCountQuest = 0;
  int countTotalQuestionUsed = 0;
  int playerCorrectAnswers = 0;

  int helpToolsUsed = 0;
  //* ----------------------------------------------
  double myCustHeightVal = 17;
  double txtFontSize = 13;
  double cusAnsHeight = 35;
  // * --------------------------------------------
  //* [LISTS]
  List<Widget> widgetMoneyList = List<Widget>();
  List<Widget> widgetNumList = List<Widget>();
  List<Widget> drowMoneyCardDesign = List<Widget>();
  List<Widget> tempCardDesignList = List<Widget>();
  List<String> myCashValuesList = [];

  //*-----------------------------------------------
  //*[METHOD]
  //*--------
  @override
  void initState() {
    super.initState();
    playerBalance = '0';
    updateUi(countQuestion);
    checkPlayLevel();
  }

  //*-----------------------------------------------
  //*[METHOD]
  //*--------
  updateUi(int countQuest) {
    //*
    setState(() {
      widgetNumList = MoneyNumCards().methodNum();
      widgetMoneyList = MoneyNumCards().methodMoney(countQuest, wrongeAns);
      getNewQuestion();
    });
  }

  //*-----------------------------------------------
  //*[METHOD]
  //*--------
  void _visibleState(bool visibility) {
    setState(() {
      hideTwoAnswers = visibility;
    });
  }

  //*-----------------------------------------------
  //*[METHOD]
  //*--------
  void getNewQuestion() {
    //*
    question = generateQes.getNewQuestions(countQuestion, wrongeAns);
    theAnswers = generateQes.getAnswers(countQuestion);

    newQuestion = question.questionIs;
    // * Answers Are
    // *
    newAns1 = theAnswers.qAns1;
    newAns2 = theAnswers.qAns2;
    newAns3 = theAnswers.qAns3;
    newAns4 = theAnswers.qAns4;

    // * Player Statistic [ Balance ]
    playerInfo = getPlayerNewBalance(countQuestion);
    // * Display Question Current Number
    displayCountQuest = playerInfo.curQestNum + 1;

    // * UpdateUi END
  }

  //*-----------------------------------------------
  //*[METHOD]
  //*--------
  PlayerInfo getPlayerNewBalance(int quesNum) {
    // *
    // * Get Balance
    var getNewAnswer = theAnswersList.getAnswersList(quesNum);
    playerInfo.wrongsAnsNum = wrongeAns;
    playerInfo.curQestNum = countQuestion;
    playerInfo.curPlayLevel = getNewAnswer.theLevel;

    if (playerInfo.wrongsAnsNum > 0) {
      var countBalance = countQuestion - playerInfo.wrongsAnsNum;

      if (countBalance > 0) {
        playerInfo.curPlayerBalance = myCashValuesList[countBalance - 1];
      } // *
      else if (countBalance == 0) {
        playerInfo.curPlayerBalance = myCashValuesList[countBalance];
      }
      // * ---------------------------------------------------
      playerInfo.curPlayerBalance = myCashValuesList[countBalance];
    }
    return playerInfo;
  }

  // * ------------------------------------------
  // *
  // *  Body
  // *
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Card(
                      color: AppColors.cardBgColor3,
                      child: Row(
                        children: [
                          // * ---------------------------------------------------
                          // *  Statistic Area(Begin)
                          // * ---------------------------------------------------
                          Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Card(
                                    color: AppColors.myMoneyBtnColorEff2,
                                    child: myCustomCardDesign(
                                      color: AppColors.cardBgColor2,
                                      myChild: InkWell(
                                        child: Text(
                                            '($displayCountQuest) السؤال الحالي',
                                            style: TextStyle(
                                                fontSize: txtFontSize)),
                                      ),
                                      cusWidth: 130,
                                      cusHeight: 70,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Card(
                                    color: AppColors.myMoneyBtnColorEff2,
                                    child: myCustomCardDesign(
                                      color: AppColors.cardBgColor2,
                                      myChild: InkWell(
                                        child: Text(
                                          // txtLable: Text(
                                          'وسائل مساعدة ($helpToolsUsed/2)',
                                          style:
                                              TextStyle(fontSize: txtFontSize),
                                        ),
                                      ),
                                      cusWidth: 130,
                                      cusHeight: 70,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Card(
                                    color: AppColors.myMoneyBtnColorEff2,
                                    child: myCustomCardDesign(
                                      color: AppColors.cardBgColor2,
                                      myChild: InkWell(
                                        child: Text(
                                          // txtLable: Text(
                                          'المستوى الحالي ($playLevel)',
                                          style:
                                              TextStyle(fontSize: txtFontSize),
                                        ),
                                      ),
                                      cusWidth: 130,
                                      cusHeight: 120,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Card(
                                    color: AppColors.myMoneyBtnColorEff2,
                                    child: myCustomCardDesign(
                                      color: AppColors.cardBgColor2,
                                      myChild: InkWell(
                                        child: Text(
                                          'عدد الاخطاء ($totalErrors)',
                                          style:
                                              TextStyle(fontSize: txtFontSize),
                                        ),
                                      ),
                                      cusWidth: 130,
                                      cusHeight: 120,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Card(
                                    color: AppColors.myMoneyBtnColorEff2,
                                    child: myCustomCardDesign(
                                      color: AppColors.cardBgColor2,
                                      myChild: InkWell(
                                        child: Text(
                                          'الإسم: علاءالدين',
                                          style:
                                              TextStyle(fontSize: txtFontSize),
                                        ),
                                      ),
                                      cusWidth: 130,
                                      cusHeight: 120,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Card(
                                    color: AppColors.myMoneyBtnColorEff2,
                                    child: myCustomCardDesign(
                                      color: Colors.white10,
                                      myChild: InkWell(
                                        child: Text(
                                          'الرصيد ($playerBalance)',
                                          style:
                                              TextStyle(fontSize: txtFontSize),
                                        ),
                                      ),
                                      cusWidth: 130,
                                      cusHeight: 120,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // * ----------------------------------------
          // * Contesters Development in Competition...
          // * ----------------------------------------
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: ListView(
                          children: <Widget>[
                            CustomCardDesign(
                              colour: _effectColor
                                  ? AppColors.myMoneyBtnColorEff
                                  : AppColors.cardBgColor1,
                              width: 400,
                              myPadding: EdgeInsets.only(top: 1.0),
                              cardWidget: Column(
                                children: widgetMoneyList,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                          child: ListView(
                        children: [
                          CustomCardDesign(
                            colour: AppColors.cardBgColor1,
                            width: 60,
                            cardWidget: Expanded(
                              child: Column(
                                children: widgetNumList,
                              ),
                            ),
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // * ----------------------------------------
          // * Question Area...
          // * ----------------------------------------
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Center(
                        child: myCustomCardDesign(
                          color: AppColors.cardBgColor0,
                          myChild: InkWell(
                            child: Text(
                              '$newQuestion',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          cusHeight: cusAnsHeight + 15,
                          cusWidth: 420,
                        ),
                      ),
                    ),
                  ],
                ),

                // * ----------------------------------------
                // * Answers Options Of Current Question ...
                // * ----------------------------------------
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: <Widget>[
                                // * Answer Numner .................. (2)
                                Expanded(
                                  child: Center(
                                      child: !hideAns2
                                          ? myCustomCardDesign(
                                              color: ans2
                                                  ? (correctPlayerAns
                                                      ? correctAnsColor
                                                      : ansBtnColorEff)
                                                  : ansBtnColorBlue,
                                              myChild: InkWell(
                                                child: Text('$newAns2'),
                                                onTap: _enabled
                                                    ? () async {
                                                        setState(() {
                                                          ans2 = true;
                                                          _enabled = false;
                                                          _isAnswered = true;

                                                          if (question
                                                                  .answerIs ==
                                                              newAns2) {
                                                            btnNotClicked =
                                                                false;
                                                            correctPlayerAns =
                                                                true;

                                                            playerInfo
                                                                    .curPlayerBalance =
                                                                QuestionCashValues()
                                                                        .cashValuesLvl[
                                                                    countQuestion -
                                                                        wrongeAns];
                                                            playerBalance =
                                                                playerInfo
                                                                    .curPlayerBalance;

                                                            playerCorrectAnswers++;
                                                            checkPlayLevel();
                                                            updateUi(
                                                                countQuestion);
                                                          } else {
                                                            correctPlayerAns =
                                                                false;
                                                            wrongeAns++;
                                                            totalErrors =
                                                                wrongeAns -
                                                                    numOfChangeQuestion;
                                                            checkPlayLevel();
                                                          }
                                                        });
                                                      }
                                                    : null,
                                              ),
                                              cusHeight: cusAnsHeight,
                                              cusWidth: 200,
                                            )
                                          : null),
                                ),

                                Expanded(
                                  // * Answer Numner .................. (1)
                                  child: Center(
                                    child: !hideAns1
                                        ? myCustomCardDesign(
                                            color: ans1
                                                ? (correctPlayerAns
                                                    ? correctAnsColor
                                                    : ansBtnColorEff)
                                                : ansBtnColorBlue,
                                            myChild: InkWell(
                                              child: Text('$newAns1'),
                                              onTap: _enabled
                                                  ? () async {
                                                      setState(() {
                                                        _enabled = false;
                                                        print('$newAns1');
                                                        ans1 = true;
                                                        _enabled = false;
                                                        _isAnswered = true;

                                                        if (question.answerIs ==
                                                            newAns1) {
                                                          btnNotClicked = false;
                                                          correctPlayerAns =
                                                              true;

                                                          playerInfo
                                                                  .curPlayerBalance =
                                                              QuestionCashValues()
                                                                      .cashValuesLvl[
                                                                  countQuestion -
                                                                      wrongeAns];
                                                          playerBalance = playerInfo
                                                              .curPlayerBalance;

                                                          playerCorrectAnswers++;
                                                          checkPlayLevel();
                                                          updateUi(
                                                              countQuestion);
                                                        } else {
                                                          correctPlayerAns =
                                                              false;
                                                          wrongeAns++;

                                                          totalErrors = wrongeAns -
                                                              numOfChangeQuestion;
                                                          checkPlayLevel();
                                                        }
                                                      });
                                                    }
                                                  : null,
                                            ),
                                            cusHeight: cusAnsHeight,
                                            cusWidth: 200,
                                          )
                                        : null,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                // * Answer Numner .................. (4)
                                Expanded(
                                  child: Center(
                                    child: !hideAns4
                                        ? myCustomCardDesign(
                                            color: ans4
                                                ? (correctPlayerAns
                                                    ? correctAnsColor
                                                    : ansBtnColorEff)
                                                : ansBtnColorBlue,
                                            myChild: InkWell(
                                              child: Text('$newAns4'),
                                              onTap: _enabled
                                                  ? () async {
                                                      setState(() {
                                                        print('$newAns4');
                                                        ans4 = true;
                                                        _enabled = false;
                                                        _isAnswered = true;

                                                        if (question.answerIs ==
                                                            newAns4) {
                                                          btnNotClicked = false;
                                                          correctPlayerAns =
                                                              true;

                                                          playerInfo
                                                                  .curPlayerBalance =
                                                              QuestionCashValues()
                                                                      .cashValuesLvl[
                                                                  countQuestion -
                                                                      wrongeAns];
                                                          playerBalance = playerInfo
                                                              .curPlayerBalance;

                                                          playerCorrectAnswers++;
                                                          checkPlayLevel();
                                                          updateUi(
                                                              countQuestion);
                                                        } else {
                                                          correctPlayerAns =
                                                              false;
                                                          wrongeAns++;
                                                          totalErrors = wrongeAns -
                                                              numOfChangeQuestion;

                                                          checkPlayLevel();
                                                        }
                                                      });
                                                    }
                                                  : null,
                                            ),
                                            cusHeight: cusAnsHeight,
                                            cusWidth: 200,
                                          )
                                        : null,
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: !hideAns3
                                        ? myCustomCardDesign(
                                            color: ans3
                                                ? (correctPlayerAns
                                                    ? correctAnsColor
                                                    : ansBtnColorEff)
                                                : ansBtnColorBlue,
                                            myChild: InkWell(
                                              child: Text('$newAns3'),
                                              onTap: _enabled
                                                  ? () {
                                                      setState(() {
                                                        print('$newAns3');
                                                        ans3 = true;
                                                        _enabled = false;
                                                        _isAnswered = true;

                                                        //* Answer True
                                                        if (question.answerIs ==
                                                            newAns3) {
                                                          btnNotClicked = false;
                                                          correctPlayerAns =
                                                              true;

                                                          playerInfo
                                                                  .curPlayerBalance =
                                                              QuestionCashValues()
                                                                      .cashValuesLvl[
                                                                  countQuestion -
                                                                      wrongeAns];
                                                          playerBalance = playerInfo
                                                              .curPlayerBalance;

                                                          playerCorrectAnswers++;
                                                          checkPlayLevel();
                                                          updateUi(
                                                              countQuestion);
                                                        } else //* Answer False
                                                        {
                                                          correctPlayerAns =
                                                              false;
                                                          wrongeAns++;
                                                          totalErrors = wrongeAns -
                                                              numOfChangeQuestion;

                                                          checkPlayLevel();
                                                        }
                                                      });
                                                    }
                                                  : null,
                                            ),
                                            cusHeight: cusAnsHeight,
                                            cusWidth: 200,
                                          )
                                        : null,
                                  ),
                                ),
                              ],
                            ),
                            // * Help Tools ...
                            Row(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: myCustomCardDesign(
                                      color: btnColorWithDrow,
                                      myChild: InkWell(
                                          child: Text('أنسحب'),
                                          onTap: (playerCorrectAnswers > 4)
                                              ? () {
                                                  //* WithDrow
                                                  playerWithDrow(context);
                                                }
                                              : null),
                                      cusHeight: cusAnsHeight,
                                      cusWidth: 200,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: myCustomCardDesign(
                                      color: AppColors.cardBgColor1,
                                      myChild: InkWell(
                                          child: Text('حذف إجابتان'),
                                          onTap: playerCorrectAnswers > 4
                                              ? !hideTwoAnswers
                                                  //? !hideTwoAnswersUsed
                                                  //* Solution Of Hiding
                                                  ? (() {
                                                      hideTwoAnswersUsed = true;

                                                      hideTwoAnswers = true;

                                                      hideTwoAnswersMeth();
                                                      checkPlayLevel();
                                                      updateUi(countQuestion);
                                                    })
                                                  : null
                                              : null),
                                      cusHeight: cusAnsHeight,
                                      cusWidth: 200,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: myCustomCardDesign(
                                      color: AppColors.cardBgColor1,
                                      myChild: InkWell(
                                          child: Text('تغيير السؤال'),
                                          onTap: playerCorrectAnswers > 4
                                              ? !changeQuestionIsUsed
                                                  ? () {
                                                      wrongeAns++;
                                                      changeQuestionIsUsed =
                                                          true;

                                                      changeQuestionIsActive =
                                                          false;

                                                      helpToolsUsed =
                                                          helpToolsUsed + 1;

                                                      numOfChangeQuestion = 1;

                                                      goNextQuestion(context);
                                                    }
                                                  : null
                                              : null),
                                      cusHeight: cusAnsHeight,
                                      cusWidth: 200,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Center(
                                        child: myCustomCardDesign(
                                  color: AppColors.cardBgColor1, //cardBgColor5,
                                  myChild: InkWell(
                                    child: Text(
                                      '<<  السؤال التالي',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    //* Check If Player (Hit Answer)

                                    onTap: _isAnswered
                                        ? () {
                                            setState(() {
                                              switch (wrongeAns) {
                                                case 0:
                                                  //* 14 Qestions [0 - 13]
                                                  totalQuestion =
                                                      13 + numOfChangeQuestion;

                                                  break;
                                                case 1:
                                                  totalQuestion = 14 +
                                                      numOfChangeQuestion; //* 15 Questions [0 - 14]
                                                  break;
                                                case 2:
                                                  totalQuestion = 15 +
                                                      numOfChangeQuestion; //* 16 Questions [0 - 15]
                                                  break;
                                                case 3:
                                                  totalQuestion = 16 +
                                                      numOfChangeQuestion; //* 17 Questions [0 - 16]
                                                  break;
                                                case 4:
                                                  totalQuestion = 17 +
                                                      numOfChangeQuestion; //* 17 Questions [0 - 16]
                                                  break;
                                                case 5:

                                                  //* Pop Up To Quit App Or RePlay if Chances Finished
                                                  checkContinuePlayOption(
                                                      context, playerBalance);
                                                  break;
                                              }

                                              //* Reset Hide
                                              resetHideAnswers();
                                              //* Get Next Question
                                              goNextQuestion(context);
                                            });
                                          }
                                        : null,
                                  ),
                                  cusHeight: cusAnsHeight + 14,
                                  cusWidth: 420,
                                )))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // * New Question...
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //*-----------------------------------------------
  //*[METHOD]
  //*--------
  void hideTwoAnswersMeth() {
    if (question.answerIs == newAns1) {
      hideAns2 = true;
      hideAns3 = true;
    } else if (question.answerIs == newAns2) {
      hideAns1 = true;
      hideAns3 = true;
    } else if (question.answerIs == newAns3) {
      hideAns2 = true;
      hideAns4 = true;
    } else if (question.answerIs == newAns4) {
      hideAns2 = true;
      hideAns3 = true;
    }

    helpToolsUsed++;
    hideTwoAnswers = true;
  }

  //*-----------------------------------------------
  //*[METHOD]
  //*--------
  void resetHideAnswers() {
    hideAns1 = false;
    hideAns2 = false;
    hideAns3 = false;
    hideAns4 = false;
  }

  //*-----------------------------------------------
  //*[METHOD]
  //*--------
  void goNextQuestion(BuildContext context) {
    reCalculateTotlaQuestion();

    btnNotClicked = true;
    correctPlayerAns = false;
    _isAnswered = false;
    ans1 = false;
    ans2 = false;
    ans3 = false;
    ans4 = false;

    _enabled = true;
    _effectColor = false;

    //* Check Question Level
    checkPlayLevel();
    countQuestion++;

    displayCountQuest = playerInfo.curQestNum + 1;

    updateUi(countQuestion);
  }

  //*-----------------------------------------------
  //*[METHOD]
  //*--------
  void reCalculateTotlaQuestion() {
    var playerChances = wrongeAns + numOfChangeQuestion;

    if (playerChances < 5) {
      totalQuestion = totalQuestion - (wrongeAns + numOfChangeQuestion);

      if (playerBalance == '1000000') {
        checkContinuePlayOption(context, playerBalance);
      }
      numOfChangeQuestion = 0;
    }
  }

  //*-----------------------------------------------
  //*[METHOD]
  //*--------
  void checkContinuePlayOption(BuildContext context, String pBalance) {
    //*
    var playerTotalBalance = int.parse(playerBalance);

    if (playerTotalBalance < 2000) {
      playerTotalBalance = 0;
    } else if (playerTotalBalance >= 2000 && playerTotalBalance < 64000) {
      playerTotalBalance = 2000;
    } else if (playerTotalBalance >= 64000 && playerTotalBalance < 1000000) {
      playerTotalBalance = 64000;
    } else if (playerTotalBalance == 1000000) {
      playerTotalBalance = 1000000;
    }
    //*
    //* Display Alert (Get Player Choice) ------
    //* ----
    if (pBalance != '1000000') {
      Alert(
          context: context,
          type: AlertType.warning,
          title: "من سيربح المليون (قد خسرت)",
          desc: "رصيد الحالي ($playerTotalBalance) هل تود اللعب مره أخرى",
          closeFunction: () {
            setState(() {
              resetPlay(context, true);
            });
          },
          buttons: [
            DialogButton(
              color: AppColors.genColor1,
              child: Text(
                "اللعب مره أخرى",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              onPressed: () {
                setState(() {
                  resetPlay(context, true);
                });
              },
            ),
            DialogButton(
              color: AppColors.genColor1,
              child: Text(
                "الخروج من المسابقة",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              onPressed: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FinishPage()));
                });
              },
            ),
          ]).show();
    } else {
      Alert(
          context: context,
          type: AlertType.warning,
          title: "من سيربح المليون (قد فزت)",
          desc: "رصيد الحالي ($playerBalance) هل تود اللعب مره أخرى",
          closeFunction: () {
            setState(() {
              resetPlay(context, true);
            });
          },
          buttons: [
            DialogButton(
              color: AppColors.genColor1,
              child: Text(
                "اللعب مره أخرى",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              onPressed: () {
                setState(() {
                  resetPlay(context, true);
                });
              },
            ),
            DialogButton(
              color: AppColors.genColor1,
              child: Text(
                "الخروج من المسابقة",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              onPressed: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FinishPage()));
                });
              },
            ),
          ]).show();
    }
  }

  //*-----------------------------------------------
  //*[METHOD]
  //*--------
  void playerWithDrow(BuildContext context) {
    //*
    Alert(
        context: context,
        type: AlertType.warning,
        title: "من سيربح المليون (إنسحاب اللاعب)",
        desc: "رصيد الحالي ($playerBalance) هل تود اللعب مره أخرى",
        closeFunction: () {
          setState(() {
            resetPlay(context, true);
          });
        },
        buttons: [
          DialogButton(
            color: AppColors.genColor1,
            child: Text(
              "اللعب مره أخرى",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            onPressed: () {
              setState(() {
                resetPlay(context, true);
              });
            },
          ),
          DialogButton(
            color: AppColors.genColor1,
            child: Text(
              "الخروج من المسابقة",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            onPressed: () {
              setState(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FinishPage()));
              });
            },
          ),
        ]).show();
  }

  //*-----------------------------------------------
  //*[METHOD] */
  void resetPlay(BuildContext context, bool fromPopUp) {
    //*
    setState(() {
      //*
      //*
      btnNotClicked = true;
      correctPlayerAns = false;
      _isAnswered = false;
      _enabled = true;
      _effectColor = false;
      ans1 = false;
      ans2 = false;
      ans3 = false;
      ans4 = false;
      changeQuestionIsUsed = false;
      hideTwoAnswersUsed = false;

      playerBalance = '0';
      numOfChangeQuestion = 0;
      helpToolsUsed = 0;
      countQuestion = 0;
      wrongeAns = 0;
      totalErrors = 0;

      playerCorrectAnswers = 0;
      playerInfo.curQestNum = 1;
      playLevel = 1;

      changeQuestionIsActive = false;
      hideTwoAnswersIsActive = false;
      hideTwoAnswers = false;

      //* Total Question Consumed (Right / Wrong / Changed) By Player
      countTotalQuestionUsed = 1;

      Navigator.pop(context);
      updateUi(countQuestion);
    });
  }

  //*-----------------------------------------------
  // * CHECK CURRENT PLAY LEVEL
  //*[METHOD]
  //*--------
  void checkPlayLevel() {
    setState(() {
      if (playerCorrectAnswers >= 5 && playerCorrectAnswers < 10) {
        playLevel = 2;
      } else if (playerCorrectAnswers >= 10) {
        playLevel = 3;
      }
    });
  }

  //*-----------------------------------------------
  //*[METHOD]
  //*--------
  void quitPlayOption() {
    // * POP Up Option
    setState(() {});
  }

  //*-----------------------------------------------
  //*[Refactor Card]
  Widget myCustomCardDesign({
    Color color,
    Text txtLable,
    double cusWidth,
    double cusHeight,
    Function onPressMe,
    InkWell myChild,
  }) {
    return CustomCardDesign(
      colour: color,
      cardWidget: Center(
        child: myChild,
      ),
      onPressed: onPressMe,
      width: cusWidth,
      height: cusHeight,
    );
  }

  //****************************************************************************************************** */

}
