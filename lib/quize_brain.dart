import 'question.dart';
 class  QuizeBrain{
  int _questionNumber = 0;
  List <Question> _Questionbink = [
    Question(q:'Some cats are actually allergic to humans', b: true),
    Question(q:'You can lead a cow down stairs but not up stairs.',b: false),
    Question(q:'Approximately one quarter of human bones are in the feet.',b: true),
    Question(q:'A slug\'s blood is green.' ,b: true),
    Question(q:'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', b:true),
    Question(q:'It is illegal to pee in the Ocean in Portugal.',b: true),
    Question(

        q:'No piece of square dry paper can be folded in half more than 7 times.',
        b:false),
    Question(
        q:'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        b: true),
    Question(
        q: 'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        b:false),
    Question(
        q:'The total surface area of two human lungs is approximately 70 square metres.',
        b: true),
    Question(q:'Google was originally called \"Backrub\".', b:true),
    Question(
        q:'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        b:true),
    Question(
        q:'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        b: true),
  ];
  String getquestionText(int questionNumber){
    return _Questionbink[_questionNumber].QuestionText;

  }
  void nextquestion(){
    if (_questionNumber < _Questionbink.length - 1){
      _questionNumber++;

    }
  }
  bool getCorrectanswer(){
    return _Questionbink[_questionNumber].Answer;
  }
    bool isFinished() {
    if(_questionNumber >= _Questionbink.length - 1){
      return true;
    }
      else {
        return false;

    }
    }


  void reset() {
    _questionNumber = 0;
  }
}