class Frame {
  int first = 0;
  int second = 0;
  int bonus = 0;

  bool get isSpare => first < 10 && (first + second) == 10;

  bool get isStrike => first == 10;

  int get sum => first + second + bonus;

  Frame();
}

class Game {
  final List<Frame> _frames = List.generate(10, (index) => Frame());

  int _currentIndex = 0;

  bool isFirstThrow = true;
  bool isGameOver = false;

  int get currentFrame => _currentIndex+1;
  List<Frame> get frames => _frames;

  void add(int pinCount) {
    if (_currentIndex >= _frames.length) {
      isGameOver = true;
      return;
    }

    var prevIndex = _currentIndex - 1;
    prevIndex = prevIndex < 0 ?0 : prevIndex;
    if (isFirstThrow) {

      if (_frames[prevIndex].isStrike) {
        _frames[prevIndex].bonus +=  pinCount;
      }
      
      if (_frames[prevIndex].isSpare) {
        _frames[prevIndex].bonus = pinCount;
      } 
      _frames[_currentIndex].first = pinCount;
      if (pinCount == 10) {
        _currentIndex++;
        isFirstThrow = true;
      } else {
        isFirstThrow = false;
      }
    } else {
      if (_frames[prevIndex].isStrike) {
        _frames[prevIndex].bonus +=  pinCount;
      }
      
      _frames[_currentIndex].second = pinCount;
      isFirstThrow = true;
      _currentIndex++;
    }
  }

  int get points {
    return _frames.fold(0, (previousValue, frame) => previousValue + frame.sum);
  }
}
