import 'package:flutter/material.dart';

class Txtfield extends StatelessWidget {
   Txtfield({super.key,required this.hinttxt,required this.controller});
  
 final String hinttxt;
   final TextEditingController controller;

  
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      
      decoration: InputDecoration(
        hintText: hinttxt,
        
        border: OutlineInputBorder(


      )),
    );
  }
}
