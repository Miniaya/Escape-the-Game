import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './flying_screen.dart';
import './start_screen.dart';
import './sorting_screen.dart';

import '../levels/riddle_level.dart';

import '../services/level_service.dart';

import '../widgets/game_button.dart';
import '../widgets/game_scaffold.dart';

class LevelScreen extends StatelessWidget {
  final levelService = Get.find<LevelService>();

  @override
  Widget build(BuildContext context) {
    final levels = levelService.allLevels;

    return GameScaffold(content: [
      Text("Choose a level", style: TextStyle(fontSize: 36)),
      Padding(
        padding: EdgeInsets.all(16),
      ),
      GameButton(
        text:
            "${levels[0]} (${levelService.completedLevels.contains(levels[0]) ? "Completed" : "Not completed"})",
        onPressed: () {
          levelService.currentLevel = levels[0];
          Get.to(RiddleLevel());
        },
      ),
      Padding(
        padding: EdgeInsets.all(16),
      ),
      GameButton(
        text:
            "${levels[1]} (${levelService.completedLevels.contains(levels[1]) ? "Completed" : "Not completed"})",
        onPressed: () {
          levelService.currentLevel = levels[1];
          Get.to(FlyingScreen());
        },
      ),
      Padding(
        padding: EdgeInsets.all(16),
      ),
      GameButton(
        text:
            "${levels[2]} (${levelService.completedLevels.contains(levels[2]) ? "Completed" : "Not completed"})",
        onPressed: () {
          levelService.currentLevel = levels[2];
          Get.to(SortingScreen());
        },
      ),
      Padding(
        padding: EdgeInsets.all(16),
      ),
      GameButton(
        text: "Back to start",
        onPressed: () => Get.to(StartScreen()),
      )
    ]);
  }
}