import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.text, required this.onClick});

  final String text;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      style:
          ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue)),
    );
  }
}
