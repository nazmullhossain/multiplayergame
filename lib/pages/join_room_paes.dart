import 'package:flutter/material.dart';

import '../widget/custom_button_widget.dart';
import '../widget/custom_text_feild_widget.dart';

class JoinRoomPaes extends StatefulWidget {
  const JoinRoomPaes({super.key});

  @override
  State<JoinRoomPaes> createState() => _JoinRoomPaesState();
}

class _JoinRoomPaesState extends State<JoinRoomPaes> {
  TextEditingController _nameController=TextEditingController();
  TextEditingController _gameController=TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _gameController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body:  Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 600),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "join Room",
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: size.height * 0.08,
                ),
                CustomTextFeildWidget(
                  controller: _nameController,
                  hintText: 'Enter your nick name',
                ),
                SizedBox(height: 20,),
                CustomTextFeildWidget(
                  controller: _gameController,
                  hintText: 'game id',
                ),
                SizedBox(height: 40,),
                CustomButtonWidget(onTap: (){}, text: "Create")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
