import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final bool _answer;
  final VoidCallback _onTap;

  Button(this._answer,this._onTap);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: _answer ? Colors.greenAccent : Colors.redAccent,
        child: InkWell(
          onTap: () => _onTap(),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 5.0,
                ),
              ),
              padding: EdgeInsets.all(15.0),
              child: Text(
                _answer ? 'True' : 'False',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
