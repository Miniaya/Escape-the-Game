import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame/components.dart';

import '../levels/sorting_level.dart';

class BrickFrame extends BodyComponent<SortingLevel> {
  @override
  Body createBody() {
    final bodyDef = BodyDef(
      position: Vector2(15, 15),
      type: BodyType.static,
      userData: this,
    );

    final fixtureDefs = [
      FixtureDef(
        PolygonShape()
          ..setAsBoxXY(5, 5),
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
        scale: Vector2.all(1),
        sprite: Sprite(game.images.fromCache('elementWood026.png')),
        size: Vector2(10, 10),
        position: Vector2(0, 0),
      )
    );
  }
}