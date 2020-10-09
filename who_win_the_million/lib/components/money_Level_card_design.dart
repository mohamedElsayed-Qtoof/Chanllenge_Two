import 'package:flutter/material.dart';
import 'package:who_win_the_million/GUI/card/custom_card_design.dart';
import 'package:who_win_the_million/constants/cash_values/question_cash_value.dart';
import 'package:who_win_the_million/constants/cash_values/question_num_val.dart';
import 'package:who_win_the_million/constants/colors/app_colors.dart';
import 'package:who_win_the_million/models/player_info.dart';

// ------------------------------------
// * Auto Draw Cards By options Upate
// ------------------------------------

class MoneyNumCards extends StatefulWidget {
  MoneyNumCards({Key key}) : super(key: key);
  int curQestionIs = 0;
  int wrongAnswers = 0;

  methodMoney(curQestionIs, wrongAnswers) =>
      createState().getMoneyCardDsgn(curQestionIs, wrongAnswers);
  methodNum() => createState().getNumCardDsgn();

  CustomCardDesign myMoneyData, myNumLvlData;
  QuestionCashValues cashValuesClass = QuestionCashValues();
  @override
  _MoneyNumCardsState createState() => _MoneyNumCardsState();
}

class _MoneyNumCardsState extends State<MoneyNumCards> {
  Color moneyBtnColor = AppColors.myMoneyBtnColorNrml;
  Color moneyBtnColorEff = AppColors.myMoneyBtnColorEff;
  Color moneyBtnColorEff2 = AppColors.myMoneyBtnColorEff2;
  Color theColor = AppColors.theColor;
  Color levelBtnColor = AppColors.cardBgColor5;
  double myCustHeightVal = 17;
  Color theCardColr;
  Color curColor;

  int curQestionIs = 0;
  int wrongAnswers = 0;

  bool monyCard = false;
  bool numCard = false;
  // * -------------------------
  // * Classes Instances
  // *
  PlayerInfo playerInfo = PlayerInfo();
  QuestionCashValues cashValuesClass = QuestionCashValues();
  QuestionNumValues numValuesClass = QuestionNumValues();
  CustomCardDesign myMoneyData, myNumLvlData;

  var getMoneyCard = List<Widget>();
  var getNumCard = List<Widget>();
  var effectColor = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: monyCard ? getMoneyCard : (numCard ? getNumCard : null),
    ));
  }

  //*-----------------------------------------------
  //*[METHOD]
  //*--------
  List<Widget> getMoneyCardDsgn(int quesNum, int wrongAns) {
    print('New Question Num. Is = ' + quesNum.toString());
    curQestionIs = quesNum;
    wrongAnswers = wrongAns;
    getMoneyCard = getMoneyLevlCardDesign();
    //* -------------
    if (getMoneyCard != null) {
      monyCard = true;
    }

    return getMoneyCard;
  }

  //*-----------------------------------------------
  //*[METHOD]
  //*--------
  List<Widget> getMoneyLevlCardDesign() {
    // * Start For Loop

    for (int i = cashValuesClass.cashValuesLvl.length - 1; i >= 0; i--) {
      if (curQestionIs - wrongAnswers == i) {
        curColor = moneyBtnColorEff;
        effectColor = true;
      } else {
        curColor = moneyBtnColor;
        effectColor = false;
      }

      // * --------------------------------------------------------
      myMoneyData = myCustomCardDesign(
        color: curColor,
        cusHeight: myCustHeightVal,
        txtLable: Text(
          cashValuesClass.cashValuesLvl[i],
          style: TextStyle(
            fontSize: effectColor ? 16 : 12,
            color: Colors.white,
          ),
        ),
      );

      getMoneyCard.add(myMoneyData);
    } // * End For Loop
    return getMoneyCard;
  }

  //*-----------------------------------------------
  //*[METHOD]
  //*--------
  List<Widget> getNumCardDsgn() {
    getNumCard = getNumberLevlDesign();
    //* -------------
    if (getNumCard != null) {
      numCard = true;
    }
    return getNumCard;
  }

  //*-----------------------------------------------
  //*[METHOD]
  //*--------
  // *  Drow Number And Level Card Items
  List<Widget> getNumberLevlDesign() {
    // * Start Loop
    for (int i = numValuesClass.getNumLvl.length - 1; i >= 0; i--) // *
    {
      if (i == 0 || i == 5 || i == 10) {
        // * Number Level Effect Color
        theCardColr = levelBtnColor;
      } else {
        // * Number Level Normal Color
        theCardColr = moneyBtnColor;
      }

      myNumLvlData = myCustomCardDesign(
        color: theCardColr,
        cusHeight: myCustHeightVal,
        txtLable: Text(
          numValuesClass.getNumLvl[i].toString(),
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.white,
          ),
        ),
      );
      getNumCard.add(myNumLvlData);
    } // * End Loop
    return getNumCard;
  }
  // *  Drow Number And Level Card Items

  //*-----------------------------------------------
  //*[METHOD]
  //*--------
  // * Drow Custom Card -- Begin
  Widget myCustomCardDesign({
    Color color,
    Text txtLable,
    double cusWidth,
    double cusHeight,
  }) {
    return CustomCardDesign(
      colour: color,
      cardWidget: Center(
        child: txtLable,
      ),
      width: cusWidth,
      height: cusHeight,
    );
  }
}
