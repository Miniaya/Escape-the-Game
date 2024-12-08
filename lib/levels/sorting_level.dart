import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/result_screen.dart';

import '../components/brick.dart';
import '../components/brick_frame.dart';
import '../components/ball.dart';
import '../components/ball_frame.dart';

import '../services/level_service.dart';

class SortingLevel extends Forge2DGame {
  final levelService = Get.find<LevelService>();
  
  var ballScore = 0;
  var brickScore = 0;
  var gameFinished = false;

  SortingLevel()
    : super(
      camera: CameraComponent.withFixedResolution(
        width: 800,
        height: 600,
      ),
    );
  
  @override
  Color backgroundColor() => const Color(0xFFFFFFFF);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await loadSprite('elementWood017.png');
    await loadSprite('elementWood026.png');
    await loadSprite('elementStone001.png');
    await loadSprite('elementStone004.png');

    world.add(BrickFrame());
    world.add(BallFrame());

    Iterable.generate(7).forEach((i) => world.add(Brick()));
    Iterable.generate(7).forEach((i) => world.add(Ball()));
  }

  @override
  void update(double dt) {
    super.update(dt);
    
    world.children.whereType<TextComponent>().forEach((text) {
      world.remove(text);
    });

    world.addAll(
      [
        TextComponent(
          text: '$ballScore',
          position: Vector2(-16.7, -18.9),
          textRenderer: TextPaint(
            style: TextStyle(color: Colors.black, fontSize: 6),
          ),
        ),
        TextComponent(
          text: '$brickScore',
          position: Vector2(13.3, 11.2),
          textRenderer: TextPaint(
            style: TextStyle(color: Colors.black, fontSize: 6),
          ),
        ),
      ]
    );

    if (
      isMounted
        && brickScore + ballScore > 0
        && world.children.whereType<Brick>().isEmpty
        && world.children.whereType<Ball>().isEmpty
        && !gameFinished
    ) {
      finishGame();
    }
  }

  incrementBrickScore() {
    brickScore++;
  }

  incrementBallScore() {
    ballScore++;
  }

  finishGame() {
    gameFinished = true;
    levelService.completeLevel();
    Get.offAll(() => ResultScreen(score: brickScore + ballScore, max: brickScore + ballScore));
  }
}
