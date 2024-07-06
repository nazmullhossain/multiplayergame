import 'package:flutter/material.dart';

import '../widget/game_text_field.dart';

class GamePages extends StatelessWidget {
  const GamePages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(child: GameTextField()),
      body: Center(
        child: Text("game"),
      ),
    );
  }
}
