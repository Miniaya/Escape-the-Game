import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/level_service.dart';

import './start_screen.dart';

import '../widgets/game_button.dart';
import '../widgets/game_scaffold.dart';

class FinalScreen extends StatelessWidget {
  final levelService = Get.find<LevelService>();

  _toStart() {
    levelService.clearCompleted();
    Get.to(StartScreen());
  }

  @override
  Widget build(BuildContext context) {
    return GameScaffold(
      content: [
        Text(
          "You successfully escaped the game!",
          style: TextStyle(fontSize: 36),
        ),
        Padding(
          padding: EdgeInsets.all(16),
        ),
        GameButton(
          text: "Play again",
          onPressed: _toStart,
        ),
      ],
    );
  }
}