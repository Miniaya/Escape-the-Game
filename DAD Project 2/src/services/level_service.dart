import 'package:hive_ce_flutter/hive_flutter.dart';

class LevelService {
  final storage = Hive.box("storage");

  final allLevels = ["Riddles", "Ball Smack", "Sorting"];
  var currentLevel = "";
  var completedLevels;

  LevelService(): completedLevels = Set() {
    completedLevels = storage.get('completed') ?? Set();
  }

  void completeLevel() {
    completedLevels.add(currentLevel);
    storage.put('completed', completedLevels);
  }

  void clearCompleted() {
    completedLevels.clear();
    storage.put('completed', completedLevels);
  }
}