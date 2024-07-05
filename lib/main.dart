import 'package:flutter/material.dart';
import 'package:multiplaygame/pages/create_pages.dart';
import 'package:multiplaygame/pages/home_pages.dart';
import 'package:multiplaygame/pages/join_room_paes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: '/',
      routes: {
        "/":(context)=>const HomePages(),
        '/create-room':(context)=>CreatePages(),
        '/join-room':(context)=>JoinRoomPaes()
      },

    debugShowCheckedModeBanner: false,
    );
  }
}
