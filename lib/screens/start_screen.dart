import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './level_screen.dart';

import '../widgets/game_button.dart';
import '../widgets/game_scaffold.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GameScaffold(
      content: [
        Text("Are you ready to escape the game?", style: TextStyle(fontSize: 36)),
        Padding(
          padding: EdgeInsets.all(16),
        ),
        GameButton(
          text: "Yes!",
          onPressed: () => Get.to(LevelScreen()),
        ),
      ],
    );
  }
}