import 'package:flutter/material.dart';
import 'package:loginpage/helper/loginhelper.dart';
import 'package:loginpage/model/usermodel.dart';
import 'package:loginpage/services/apiServices.dart';
import 'package:loginpage/widgets/button.dart';
import 'package:loginpage/widgets/sizedBox.dart';
import 'package:loginpage/widgets/txtfield.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? username;
  String? password;
  final namecontroller = TextEditingController();
  final mobilecontroller = TextEditingController();
  final usernamecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final updatedel = ApiServices();

    print(loginid);
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: FutureBuilder(
            future: ApiServices().getUser(id: loginid!),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                namecontroller.text = snapshot.data!.name ?? 'no name';
                usernamecontroller.text =
                    snapshot.data!.username ?? 'no username';
                mobilecontroller.text = snapshot.data!.mobile ?? 'no number';

                return Column(
                  children: [
                    Text(
                      snapshot.data!.name ?? 'no ddd',
                      style: TextStyle(fontSize: 40),
                    ),
                    Text(
                      snapshot.data!.username ?? 'no ddd',
                      style: TextStyle(fontSize: 40),
                    ),
                    Text(
                      snapshot.data!.mobile ?? 'no ddd',
                      style: TextStyle(fontSize: 40),
                    ),
                  ],
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
        Button(
            text: 'update',
            onClick: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text('Update data'),
                        Txtfield(hinttxt: '', controller: namecontroller),
                        Sizbox(height: 20),
                        Txtfield(hinttxt: '', controller: mobilecontroller),
                        Sizbox(height: 20),
                        Txtfield(hinttxt: '', controller: usernamecontroller),
                        Button(
                            text: 'Update',
                            onClick: () async {
                              try {
                                await updatedel.updateUser(
                                    name: namecontroller.text,
                                    mobile: mobilecontroller.text,
                                    username: usernamecontroller.text,
                                    id: loginid!);
                                setState(() {});
                                Navigator.pop(context);
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(e.toString())));
                              }
                            })
                      ],
                    ),
                  );
                },
              );
            }),
        Button(
            text: 'delete',
            onClick: ()async {
              try {
               await updatedel.deleteUser(id: loginid!);
                setState(() {});
              } catch (e) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(e.toString())));
              }
            })
      ],
    )
        // child: ElevatedButton(
        //     onPressed: () async {
        //       var user =
        //           await ApiServices().getUser(id: '659255d58d09dfd533125879');
        //       print(user.name);
        //     },
        //     child: Text("user"))),
        );
  }
}
