import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/result_screen.dart';

import '../services/level_service.dart';

import '../utils/riddles.dart';

import '../widgets/game_button.dart';
import '../widgets/game_scaffold.dart';
import '../widgets/responsive_widget.dart';

class RiddleLevel extends StatelessWidget {
  final levelService = Get.find<LevelService>();

  var questionIndex = 0.obs;
  var score = 0.obs;

  _answerQuestion(int answer) {
    var answerCorrect = riddles[questionIndex.value]["correctAnswer"] == answer;
    if (answerCorrect) {
      score.value++;
    }

    if (questionIndex.value < riddles.length - 1) {
      questionIndex.value++;
    } else {
      if (score.value == riddles.length) {
        levelService.completeLevel();
      }
      Get.to(ResultScreen(score: score.value, max: riddles.length));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: GameScaffold(
        content: [
          Obx(
            () => Column(
              children: [
                Text(
                  riddles[questionIndex.value]["riddle"] as String,
                  style: TextStyle(fontSize: 28),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                ),
                GameButton(
                  text: (riddles[questionIndex.value]["answerOptions"] as List<String>)[0],
                  onPressed: () => _answerQuestion(0),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                ),
                GameButton(
                  text: (riddles[questionIndex.value]["answerOptions"] as List<String>)[1],
                  onPressed: () => _answerQuestion(1),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                ),
                GameButton(
                  text: (riddles[questionIndex.value]["answerOptions"] as List<String>)[2],
                  onPressed: () => _answerQuestion(2),
                ),
              ]
            ),
          )
        ],
      ),
      desktop: GameScaffold(
        content: [
          Obx(
            () => Column(
              children: [
                Text(
                  riddles[questionIndex.value]["riddle"] as String,
                  style: TextStyle(fontSize: 28),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                ),
                Row(
                  children: [
                    Expanded(
                      child: GameButton(
                        text: (riddles[questionIndex.value]["answerOptions"] as List<String>)[0],
                        onPressed: () => _answerQuestion(0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                    ),
                    Expanded(
                      child: GameButton(
                        text: (riddles[questionIndex.value]["answerOptions"] as List<String>)[1],
                        onPressed: () => _answerQuestion(1),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                    ),
                    Expanded(
                      child: GameButton(
                        text: (riddles[questionIndex.value]["answerOptions"] as List<String>)[2],
                        onPressed: () => _answerQuestion(2),
                      ),
                    ),
                  ]
                )
              ]
            ),
          )
        ],
      ),
    );
  }
}