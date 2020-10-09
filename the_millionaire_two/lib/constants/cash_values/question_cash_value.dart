class QuestionCashValues {
  List<String> cashValuesLvl = List<String>();

  QuestionCashValues() {
    cashValuesLvl = getFillCashVal();
  }

  List<String> getFillCashVal() {
    cashValuesLvl.add('200');
    cashValuesLvl.add('300');
    cashValuesLvl.add('500');
    cashValuesLvl.add('1000');
    cashValuesLvl.add('2000');

    cashValuesLvl.add('4000');
    cashValuesLvl.add('8000');
    cashValuesLvl.add('16000');
    cashValuesLvl.add('32000');
    cashValuesLvl.add('64000');

    cashValuesLvl.add('125000');
    cashValuesLvl.add('250000');
    cashValuesLvl.add('500000');
    cashValuesLvl.add('1000000');

    return cashValuesLvl;
  }
}
