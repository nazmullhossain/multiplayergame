import 'package:flutter/material.dart';

import '../widget/custom_button_widget.dart';

class HomePages extends StatelessWidget {
  const HomePages({super.key});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 600
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Create/join a room to play",
              style: TextStyle(
                  fontSize: 24
              ),),
              SizedBox(height: size.height*0.1,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButtonWidget(onTap: () {
                    Navigator.pushNamed(context, '/create-room');
                  },
                    text: 'Create', isHome: true,),
                  CustomButtonWidget(onTap: () {
                    Navigator.pushNamed(context, '/join-room');
                  },
                    text: 'join', isHome: true,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
