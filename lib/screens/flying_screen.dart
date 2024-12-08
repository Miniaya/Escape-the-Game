import 'package:flutter/material.dart';
import 'package:flame/game.dart';

import '../levels/flying_level.dart';

class FlyingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: FlyingLevel(),
    );
  }
}