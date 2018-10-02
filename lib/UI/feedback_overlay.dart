import 'dart:math';
import 'package:flutter/material.dart';

class FeedbackOverlay extends StatefulWidget {
  final bool _isCorrect;
  final VoidCallback _onTap;

  FeedbackOverlay(this._isCorrect, this._onTap);

  @override
  State createState() => FeedbackOverlayState();
}

class FeedbackOverlayState extends State<FeedbackOverlay>
    with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = AnimationController(
        duration: Duration(milliseconds: 500), vsync: this);
    _iconAnimation = CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.elasticOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black54,
      child: InkWell(
        onTap: () => widget._onTap(),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Transform.rotate(
                  angle: _iconAnimationController.value * 2 * pi,
                  child: Icon(
                    widget._isCorrect ? Icons.done : Icons.clear,
                    size: _iconAnimationController.value * 80.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
              ),
              Text(
                widget._isCorrect ? 'Correct' : 'Wrong',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              )
            ]),
      ),
    );
  }
}
