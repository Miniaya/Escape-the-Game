import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame/components.dart';

import '../levels/sorting_level.dart';

class BallFrame extends BodyComponent<SortingLevel> {
  @override
  Body createBody() {
    final bodyDef = BodyDef(
      position: Vector2(-15, -15),
      type: BodyType.static,
      userData: this,
    );

    final fixtureDefs = [
      FixtureDef(
        CircleShape()
          ..radius = 4,
      )
    ];

    final body = world.createBody(bodyDef);
    fixtureDefs?.forEach(body.createFixture);
    return body;
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final sprite = Sprite(game.images.fromCache('elementStone004.png'));
    add(
      SpriteComponent(
        anchor: Anchor.center,
        sprite: sprite,
        size: Vector2(8, 8),
        position: Vector2(0, 0),
      )
    );
  }
}