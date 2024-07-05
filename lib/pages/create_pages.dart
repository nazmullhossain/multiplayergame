import 'package:flutter/material.dart';
import 'package:multiplaygame/widget/custom_button_widget.dart';

import '../widget/custom_text_feild_widget.dart';

class CreatePages extends StatefulWidget {
  const CreatePages({super.key});

  @override
  State<CreatePages> createState() => _CreatePagesState();
}

class _CreatePagesState extends State<CreatePages> {
  final TextEditingController _namecontroller=TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _namecontroller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: 600),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Create Room",
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: size.height * 0.08,
                ),
                CustomTextFeildWidget(
                  controller: _namecontroller,
                  hintText: 'Enter your nick name',
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
