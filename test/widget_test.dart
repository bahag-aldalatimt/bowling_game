import 'package:flutter_test/flutter_test.dart';
import 'package:bowling_problem/main.dart';

void main() {
  test('should contain four points after hit four pins in the first throw',
      () async {
    // arrange
    final game = Game();

    // act
    game.add(4);

    // assert
    expect(game.points, 4);
    expect(game.currentFrame, 1);
  });

  test(
      'should sum 9 points after hit four pins and five pins, should go to the next frame',
      () async {
    // arrange
    final game = Game();

    // act
    game.add(4);
    game.add(5);

    // assert
    expect(game.points, 9);
    expect(game.currentFrame, 2);
  });

  test('should sum 15 points in the first frame ', () async {
    // arrange
    final game = Game();

    // act
    game.add(4);
    game.add(6);
    game.add(5);

    // assert
    expect(game.frames[0].sum, 15);
    expect(game.points, 20);
    expect(game.currentFrame, 2);
  });

  test('should sum 19 points in the first frame and 28 in the total points ', () async {
    // arrange
    final game = Game();

    // act
    game.add(10);
    game.add(6);
    game.add(3);

    // assert
    expect(game.frames[0].sum, 19);
    expect(game.points, 28);
    expect(game.currentFrame, 3);

  });

  test('should sum 300 points in a perfect game ', () async {
    // arrange
    final game = Game();

    // act
    game.add(10); // 1
    game.add(10); // 2
    game.add(10); // 3
    game.add(10); // 4
    game.add(10); // 5
    game.add(10); // 6
    game.add(10); // 7
    game.add(10); // 8
    game.add(10); // 9
    
    game.add(10); // 10
    game.add(10); // 11
    game.add(10); // 12
  

    // assert
    expect(game.frames[0].sum, 30);
    expect(game.points, 300);
    expect(game.currentFrame, 11);

  });
}
