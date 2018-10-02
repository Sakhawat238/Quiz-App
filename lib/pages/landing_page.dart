import 'package:flutter/material.dart';
import 'quiz_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.cyan,
      child: InkWell(
        onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => QuizPage())),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Quiz-Quiz',
              style: TextStyle(
                color: Colors.white,
                fontSize: 45.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'tap to start',
              style: TextStyle(
                color: Colors.white.withOpacity(0.85),
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
