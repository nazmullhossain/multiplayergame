import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {super.key,
      required this.onTap,
      required this.text,
       this.isHome=false});
  final VoidCallback onTap;
  final String text;
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    final width=MediaQuery.of(context).size.width;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        minimumSize: Size(!isHome?width:width/5, 50)
      ),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ));
  }
}
