import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame/components.dart';

import '../levels/flying_level.dart';

class Stain extends SpriteComponent with HasGameReference<FlyingLevel> {
  Stain({required super.position, required super.sprite})
    : super(
        anchor: Anchor.center,
        size: Vector2(9, 7),
      );
}