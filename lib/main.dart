import 'package:flutter/material.dart';
import 'package:multiplaygame/pages/create_pages.dart';
import 'package:multiplaygame/pages/game_pages.dart';
import 'package:multiplaygame/pages/home_pages.dart';
import 'package:multiplaygame/pages/join_room_paes.dart';
import 'package:multiplaygame/provider/game_state_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>GameStateProvider())
      ],
      child: MaterialApp(

        initialRoute: '/',
        routes: {
          "/":(context)=>const HomePages(),
          '/create-room':(context)=>CreatePages(),
          '/join-room':(context)=>JoinRoomPaes(),
          '/game':(context)=>GamePages(),
        },

      debugShowCheckedModeBanner: false,
      ),
    );
  }
}
