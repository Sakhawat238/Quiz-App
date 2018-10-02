import './statement.dart';

class Quizset{
  List<Statement> _statements;
  int _currentStatementIndex = -1;
  int _score = 0;

  Quizset(this._statements);

  int get score => _score;
  int get currentStatementNo => _currentStatementIndex+1;
  int get length => _statements.length;
  List<Statement> get statements => _statements;
  Statement get nextStatement {
    _currentStatementIndex++;
    if(_currentStatementIndex >= length) return null;
    return _statements[_currentStatementIndex];
  }

  void updateScore(bool isCorrect){
    if(isCorrect) _score++;
  }
}

