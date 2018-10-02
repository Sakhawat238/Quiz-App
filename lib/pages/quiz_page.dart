import 'package:flutter/material.dart';

import '../pages/score_page.dart';

import '../utils/quiz_set.dart';
import '../utils/statement.dart';

import '../UI/answer_button.dart';
import '../UI/statement_ui.dart';
import '../UI/feedback_overlay.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  Statement currentStatement;
  Quizset quizset = Quizset([
    Statement('One piece is a great anime', true),
    Statement('Pirates are evil, Marines are rightous', false),
    Statement(
        'Kids who have never seen peace and Kids who have never seen war have different values',
        true),
    Statement(
        'Those who stands at the top can decide the defintion of evil', true),
    Statement(
        'Justice will prevail, you say? Ofcourse it will, Because the winners will become justice!',
        true),
    Statement(
        'When do you think people die? When they are shot through the heart with a pistol',
        false),
    Statement('When they are struck by an incurable disease', false),
    Statement('People die when they are forgotten', true),
    Statement('The weak cannot even pick their way to die', true),
    Statement(
        'When a man learns to love, he must bear the risk of hatred', true),
    Statement('Love is not necessary, power is the only true necessity', false),
    Statement('Man seeks peace yet at the same time yearning for war', true),
    Statement(
        'In this world, wherever there is light there are also shadows', true),
    Statement(
        'The selfish desire of wanting to maintain peace causes wars', true)
  ]);

  String _statementText;
  int _statementNo;
  bool _isCorrect;
  bool _overlayVisibility = false;

  @override
  void initState() {
    super.initState();
    currentStatement = quizset.nextStatement;
    _statementText = currentStatement.statement;
    _statementNo = quizset.currentStatementNo;
  }

  void handleAnswer(bool answer) {
    _isCorrect = (answer == currentStatement.answer);
    quizset.updateScore(_isCorrect);
    this.setState(() {
      _overlayVisibility = true;
    });
  }

  void refreshPage() {
    if (quizset.length <= _statementNo) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  ScorePage(quizset.score, quizset.length)),
          (Route route) => route == null);
      return;
    }
    currentStatement = quizset.nextStatement;
    this.setState(() {
      _statementText = currentStatement.statement;
      _statementNo = quizset.currentStatementNo;
      _overlayVisibility = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: StatementUI(_statementText, _statementNo),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  Button(true, () => handleAnswer(true)),
                  Button(false, () => handleAnswer(false)),
                ],
              ),
            ),
          ],
        ),
        _overlayVisibility
            ? FeedbackOverlay(_isCorrect, () => refreshPage())
            : Container(),
      ],
    );
  }
}
