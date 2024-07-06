import 'package:flutter/material.dart';
import 'package:multiplaygame/provider/game_state_provider.dart';
import 'package:multiplaygame/utils/socket_io_cliient_utils.dart';
import 'package:multiplaygame/utils/socket_method_utils.dart';
import 'package:multiplaygame/widget/custom_button_widget.dart';
import 'package:provider/provider.dart';

class GameTextField extends StatefulWidget {
  const GameTextField({super.key});

  @override
  State<GameTextField> createState() => _GameTextFieldState();
}

class _GameTextFieldState extends State<GameTextField> {
  final SocketMethodUtils socketMethodUtils = SocketMethodUtils();
  late GameStateProvider? game;
  var playerMe = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    game = Provider.of<GameStateProvider>(context, listen: false);
    findPlayerMe(game!);
  }

  findPlayerMe(GameStateProvider game) {
    game.gameState["players"].forEach((player) {
      if (player['socketId'] == SocketIoCliientUtils.instance.socket!.id) {
        playerMe = player;
        print("playerme $playerMe");
      }
    });
  }

  handler(GameStateProvider game) {
socketMethodUtils.startTime(playerMe['_id'], game.gameState['id']);
  }
  @override
  Widget build(BuildContext context) {
    final gameData=Provider.of<GameStateProvider>(context);
    return CustomButtonWidget(onTap: () {
      handler(gameData);
    }, text: "Start");
  }
}
