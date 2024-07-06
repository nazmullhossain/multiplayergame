import 'package:flutter/cupertino.dart';
import 'package:multiplaygame/model/game_state_model.dart';

class GameStateProvider extends ChangeNotifier {
  GameStateModel _gameStateModel = GameStateModel(
      id: "", players: [], isJoin: true, isOver: false, words: []);

  Map<String, dynamic> get getState => _gameStateModel.toJson();

  void updateGameState(
      {required id,
      required players,
      required isJoin,
      required isOver,
      required words}) {
    _gameStateModel = GameStateModel(
        id: id, players: players, isJoin: isJoin, isOver: isOver, words: words);
    notifyListeners();
  }
}
