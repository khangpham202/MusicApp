// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:music_app/widgets/widgets.dart';

import '../main.dart';
import '../models/user_model.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // String userId = auth.currentUser!.uid;

    // final userRef = FirebaseDatabase.instance.ref("Users/$userId");

    return Scaffold(
      bottomNavigationBar: const CustomNavBar(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(35),
                          bottomRight: Radius.circular(35)),
                      color: Colors.blue,
                      gradient: LinearGradient(
                          colors: [
                            Colors.deepPurple.shade800.withOpacity(0.8),
                            Colors.deepPurple.shade200.withOpacity(0.8)
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: const [0.0, 1.0],
                          tileMode: TileMode.clamp)),
                ),
                const Positioned(
                    bottom: -50.0,
                    child: InkWell(
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 75,
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage("assets/images/lisa_nnqw.png"),
                        ),
                      ),
                    ))
              ]),
          const SizedBox(
            height: 55,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                children: [
                  const Card(
                    elevation: 4,
                    child: ListTile(
                      leading: Icon(Icons.person, color: Colors.brown),
                      title: Text(
                        "Lionel",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const Card(
                    elevation: 4,
                    child: ListTile(
                      leading: Icon(Icons.email, color: Colors.purple),
                      title: Text(
                        "Lionel@gmail.com",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const Card(
                    elevation: 4,
                    child: ListTile(
                      leading: Icon(Icons.lock, color: Colors.blue),
                      title: Text(
                        "Change Passowrd",
                        style: TextStyle(color: Colors.black),
                      ),
                      onTap: null,
                    ),
                  ),
                  Card(
                    elevation: 4,
                    child: ListTile(
                      leading: const Icon(Icons.logout, color: Colors.red),
                      title: const Text(
                        "Log-out",
                        style: TextStyle(color: Colors.black),
                      ),
                      onTap: signOut,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        // await getInforUser('5cyy5Kfp56Y1cBVJ6BiXnkuxBOI2');
                        getInforUser('5cyy5Kfp56Y1cBVJ6BiXnkuxBOI2');
                      },
                      child: Text("abcd"))
                ],
              ),
            ),
          )
        ],
      )),
    );
  }

  Future<void> getInforUser(String userId) async {
    try {
      final userRef = FirebaseDatabase.instance.ref("Users/$userId");
      late final UserModel user;
      userRef.onValue.listen((event) {
        final data = event.snapshot.value;
        user = UserModel.fromJson(jsonDecode(jsonEncode(data)));
      });
      print(user);
    } catch (e) {
      return;
    }
  }

  Future signOut() async {
    await auth.signOut();
    navigatorKey.currentState?.pushNamed('/login');
  }
}
