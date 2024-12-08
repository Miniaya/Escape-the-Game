import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'dart:async' as dart_async;

import '../screens/result_screen.dart';

import '../services/level_service.dart';

import '../components/fly.dart';

class FlyingLevel extends Forge2DGame {
  final levelService = Get.find<LevelService>();

  final random = Random();
  var gameFinished = false;
  var score = 0;
  var health = 10;
  var winWord = 'CONTINUE';

  FlyingLevel()
    : super(
      camera: CameraComponent.withFixedResolution(
        width: 800,
        height: 600,
      ),
    );
  
  @override
  Color backgroundColor() => const Color(0xFFeeeeee);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await loadSprite('bloodstain.png');
    world.add(Fly());

    dart_async.Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      if (gameFinished) {
        timer.cancel();
      }

      world.add(Fly());

      if ((score >= winWord.length || health <= 0) && !gameFinished) {
        finishGame();
      }

      removeOutOfBoundsFlies();
    });
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
          text: winWord.substring(0, score),
          position: Vector2(camera.visibleWorldRect.left, camera.visibleWorldRect.top),
          textRenderer: TextPaint(
            style: TextStyle(color: Colors.black, fontSize: 6),
          ),
        ),
        TextComponent(
          text: '♥$health',
          position: Vector2(camera.visibleWorldRect.right - 15, camera.visibleWorldRect.top),
          textRenderer: TextPaint(
            style: TextStyle(color: Colors.black, fontSize: 6),
          ),
        ),
      ]
    );
  }

  killFly() {
    if (winWord[random.nextInt(winWord.length)] == winWord[score])
      score++;
  }

  finishGame() {
    gameFinished = true;
    
    if (health > 0) {
      levelService.completeLevel();
      Get.offAll(() => ResultScreen(score: score, max: score));
    } else
      Get.offAll(() => ResultScreen(score: health, max: score + 1));
  }

  removeOutOfBoundsFlies() {
    world.children.whereType<Fly>().forEach((fly) {
      if (fly.body.position.y > camera.visibleWorldRect.bottom) {
        world.remove(fly);
        health--;
      }
    });
  }
}
