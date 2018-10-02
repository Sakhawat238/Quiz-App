import 'package:flutter/material.dart';

import 'landing_page.dart';

class ScorePage extends StatelessWidget {
  final int _score;
  final int _noOfStatement;

  ScorePage(this._score, this._noOfStatement);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.teal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Your Score :',
            style: TextStyle(
              color: Colors.white,
              fontSize: 45.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            _score.toString() + '/' + _noOfStatement.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 45.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
          ),
          Container(
            decoration:
                BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            child: IconButton(
              icon: Icon(Icons.close),
              color: Colors.black,
              iconSize: 50.0,
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => LandingPage()),
                  (Route route) => route == null),
            ),
          )
        ],
      ),
    );
  }
}
