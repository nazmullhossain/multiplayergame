import 'package:flutter/cupertino.dart';
import 'package:multiplaygame/utils/socket_io_cliient_utils.dart';

class SocketMethodUtils{
  final _socketClient=SocketIoCliientUtils.instance.socket!;

  //create game
createGame(String nickName){
  if(nickName.isNotEmpty){
    _socketClient.emit("create-room",{
      "nickname":nickName
    });
  }
}
updateGameListener(BuildContext context){
  _socketClient.on('updateGame', (data){
    print(data);
  });
}
}