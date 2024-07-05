import 'package:flutter/material.dart';

class CustomTextFeildWidget extends StatelessWidget {
   CustomTextFeildWidget({super.key,
  required this.controller,required this.hintText});
  TextEditingController controller;
  String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.transparent)
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.transparent)
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14
        ),
        fillColor: Color(0xffF5F5FA),
        hintText: hintText ,
        hintStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)
      ),


    );
  }
}
