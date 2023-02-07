import 'package:flutter/material.dart';
import 'package:quize_app/question.dart';
import 'package:alert/alert.dart';
import 'quize_brain.dart';
QuizeBrain quize = new QuizeBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quizzler_Flutter"),
          centerTitle: true,
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List <Icon> scorekeeper = [];

  void checAnswer (bool userPickedAnswer){
    bool correctanswer = quize.getCorrectanswer();

    setState(() {
      if (quize.isFinished() == true){
        Alert (
            message: "No More Question ",
            shortDuration: true
        ).show();
        quize.reset();
        scorekeeper = [];

      }
        else
          if (userPickedAnswer == correctanswer){
      scorekeeper.add(Icon(Icons.check,color: Colors.blueAccent,size: 30,));
    } else{
      scorekeeper.add(Icon(Icons.close,color: Colors.pinkAccent,size: 30,));
    }

      quize.nextquestion() ;
    });
  }

  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children:  <Widget> [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quize.getquestionText(questionNumber),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Container(
              color: Colors.blueAccent,
              child: TextButton(

                child:  Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: (() {
                  checAnswer(true);
                  }

                )

                  //The user picked true.

              ),
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Container(
              color: Colors.pinkAccent,
              child: TextButton(
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  checAnswer(false);
                  //The user picked false.
                },
              ),
            ),
          ),
        ),

        Row(
          
          children: scorekeeper ,
        )
      ],
    );
  }
}