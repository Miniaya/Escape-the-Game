import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/level_service.dart';

import './level_screen.dart';
import './final_screen.dart';

import '../widgets/game_button.dart';
import '../widgets/game_scaffold.dart';

class ResultScreen extends StatelessWidget {
  final levelService = Get.find<LevelService>();

  final int score;
  final int max;
  
  ResultScreen({required this.score, required this.max});

  @override
  Widget build(BuildContext context) {
    return GameScaffold(
      content: [
        score == max 
        ? Text(
          "Congratulations! You cleared this level",
          style: TextStyle(fontSize: 36),
        )
        : Text(
          "Your score was not high enough. Try again",
          style: TextStyle(fontSize: 36),
        ),
        Padding(
          padding: EdgeInsets.all(16),
        ),
        GameButton(
          text: "Continue",
          onPressed: () => levelService.allLevels.length == levelService.completedLevels.length
            ? Get.to(FinalScreen())
            : Get.to(LevelScreen()),
        ),
      ],
    );
  }
}