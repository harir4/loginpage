import 'package:flutter/material.dart';
import 'package:loginpage/screens/home.dart';
import 'package:loginpage/screens/login.dart';
import 'package:loginpage/services/apiServices.dart';
import 'package:loginpage/widgets/button.dart';
import 'package:loginpage/widgets/sizedBox.dart';
import 'package:loginpage/widgets/txtfield.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final username = TextEditingController();
  final name = TextEditingController();
  final password = TextEditingController();
  final phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final register = ApiServices();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Sizbox(height: 20),
            Txtfield(
              controller: username,
              hinttxt: 'username',
            ),
            Sizbox(height: 10),
            Txtfield(
              controller: password,
              hinttxt: 'password',
            ),
            Sizbox(height: 10),
            Txtfield(
              controller: name,
              hinttxt: 'name',
            ),
            Sizbox(height: 10),
            Txtfield(
              controller: phone,
              hinttxt: 'phone',
            ),
            Sizbox(height: 10),
            Button(
              text: 'Register',
              onClick: () async {
                try {
                  await register.register(
                      name: name.text,
                      username: username.text,
                      password: password.text,
                      phone: phone.text);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ));
                } catch (e) {
                  print(e);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(e.toString())));
                }
              },
            ),
            Sizbox(height: 20),
            Center(
              child: Row(
                children: [
                  Text('Already have a Account?'),
                  Text('Login'),
                ],
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
