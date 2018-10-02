import 'package:flutter/material.dart';

class StatementUI extends StatefulWidget {
  final String _statement;
  final int _statementNo;

  StatementUI(this._statement, this._statementNo);

  @override
  State createState() => StatementUiState();
}

class StatementUiState extends State<StatementUI>
    with SingleTickerProviderStateMixin {
  Animation<double> _textAnimation;
  AnimationController _textAnimationController;

  @override
  void initState() {
    super.initState();
    _textAnimationController =
        AnimationController(duration: Duration(milliseconds: 400), vsync: this);
    _textAnimation =
        CurvedAnimation(parent: _textAnimationController, curve: Curves.linear);
    _textAnimation.addListener(() => this.setState(() {}));
    _textAnimationController.forward();
  }

  @override
  void didUpdateWidget(StatementUI oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget._statement != widget._statement) {
      _textAnimationController.reset();
      _textAnimationController.forward();
    }
  }

  @override
  void dispose() {
    _textAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 50.0),
        child: Center(
          child: Text(
            widget._statementNo.toString() + '. ' + widget._statement,
            style: TextStyle(
              fontSize: _textAnimationController.value * 20,
            ),
          ),
        ),
      ),
    );
  }
}
