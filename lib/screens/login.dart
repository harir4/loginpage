import 'package:flutter/material.dart';
import 'package:loginpage/helper/loginhelper.dart';
import 'package:loginpage/screens/home.dart';
import 'package:loginpage/services/apiServices.dart';
import 'package:loginpage/widgets/button.dart';
import 'package:loginpage/widgets/sizedBox.dart';
import 'package:loginpage/widgets/txtfield.dart';
import 'package:loginpage/screens/register.dart';

class Login extends StatelessWidget {
  Login({super.key});
  var username = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final login = ApiServices();
  

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
            Button(
              text: 'Login',
              onClick: () async {
                try {
                 await login.login(
                      username: username.text, password: password.text,);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ));
                } catch (e) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(e.toString())));
                }
              },
            ),
            Sizbox(height: 20),
            Row(
              children: [
                Text('Dont have a Account?'),
                Text('Register'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
