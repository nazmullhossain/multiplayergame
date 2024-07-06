import 'package:flutter/cupertino.dart';
import 'package:multiplaygame/provider/game_state_provider.dart';
import 'package:multiplaygame/utils/socket_io_cliient_utils.dart';
import 'package:provider/provider.dart';

class SocketMethodUtils {
  final _socketClient = SocketIoCliientUtils.instance.socket!;

  //create game
  createGame(String nickName) {
    if (nickName.isNotEmpty) {
      _socketClient.emit("create-room", {"nickname": nickName});
    }
  }

  joinGame(String nickName, String gameId) {
    if (nickName.isNotEmpty && gameId.isNotEmpty) {
      _socketClient.emit("join-room", {"nickname": nickName, "gameId": gameId});
    }
  }

  updateGameListener(BuildContext context) {
    _socketClient.on('updateGame', (data) {
      final gameStateProvider =
          Provider.of<GameStateProvider>(context, listen: false)
              .updateGameState(
                  id: data["_id"],
                  players: data["players"],
                  isJoin: data["isJoin"],
                  isOver: data["isOver"],
                  words: data["words"]);
      if (data['_id'].isNotEmpty) {
        Navigator.pushNamed(context, '/game');
      }
    });
  }
}
