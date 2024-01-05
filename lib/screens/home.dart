import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Login'),
          TextField(),
          TextField(),
          ElevatedButton(onPressed: () {}, child: Text('Login'))
        ],
      ),
    );
  }
}
