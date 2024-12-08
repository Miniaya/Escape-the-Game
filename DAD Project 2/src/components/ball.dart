import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'dart:math';

import '../levels/sorting_level.dart';

import './ball_frame.dart';

class Ball extends BodyComponent<SortingLevel> with DragCallbacks {
  final random = Random();

  @override
  Body createBody() {
    final worldRect = game.camera.visibleWorldRect;

    var randomX = random.nextInt(worldRect.right.round() - worldRect.left.round()) + worldRect.left;
    var randomY = random.nextInt(worldRect.bottom.round() - worldRect.top.round()) + worldRect.top;

    final bodyDef = BodyDef(
      position: Vector2(randomX, randomY),
      type: BodyType.kinematic,
      userData: this,
    );

    final fixtureDefs = [
      FixtureDef(
        CircleShape()
          ..radius = 3,
      )
    ];

    final body = world.createBody(bodyDef);
    fixtureDefs?.forEach(body.createFixture);
    return body;
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(
      SpriteComponent(
        anchor: Anchor.center,
        sprite: Sprite(game.images.fromCache('elementStone001.png')),
        size: Vector2(6, 6),
        position: Vector2(0, 0),
      )
    );
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    super.onDragUpdate(event);
    body.setTransform(body.position + event.localPosition, body.angle);
  }

  @override
  void onDragEnd(DragEndEvent event) {
    super.onDragEnd(event);
    world.children.whereType<BallFrame>().forEach((frame) {
      if (frame.body.position.x - 5 < body.position.x && body.position.x < frame.body.position.x + 5 && body.position.y < frame.body.position.y + 5 && frame.body.position.y - 5 < body.position.y) {
        world.remove(this);
        game.incrementBallScore();
      }
    });
  }
}