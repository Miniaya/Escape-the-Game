import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame/events.dart';
import 'package:flame/palette.dart';
import 'package:flame/sprite.dart';
import 'dart:math';

import '../levels/flying_level.dart';

import './stain.dart';

class Fly extends BodyComponent<FlyingLevel> with TapCallbacks {
  final random = Random();

  Fly() {
    paint = BasicPalette.black.paint();
  }

  @override
  Body createBody() {
    final worldRect = game.camera.visibleWorldRect;

    final randomX = random.nextInt(worldRect.right.round() - worldRect.left.round()) + worldRect.left;

    final bodyDef = BodyDef(
      position: Vector2(randomX, -30),
      type: BodyType.dynamic,
    );

    final shape = CircleShape();
    shape.radius = 2;
    final fixtureDef = FixtureDef(shape);

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  void onTapDown(TapDownEvent event) {
    game.killFly();
    removeFromParent();
    world.add(Stain(position: body.position, sprite: Sprite(game.images.fromCache('bloodstain.png'))));
  }
}