import 'package:flutter/material.dart';
import 'package:flame/game.dart';

import '../levels/sorting_level.dart';

class SortingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: SortingLevel(),
    );
  }
}