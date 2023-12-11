import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DrawerData extends StatefulWidget {
  const DrawerData({super.key});

  @override
  State<DrawerData> createState() => _DrawerDataState();
}

class _DrawerDataState extends State<DrawerData> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 172, 135, 235)),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/user.jpeg"),
                    radius: 30,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    user?.email ?? "Email not found",
                    style: TextStyle(color: Colors.black),
                  )
                ],
              )),
          ListTile(
            leading: Icon(Icons.contacts),
            title: Text('Contacts'),
            onTap: () {
              // Handle Contacts tap
            },
          ),
          ListTile(
            leading: Icon(Icons.save),
            title: Text('Saved Blogs'),
            onTap: () {
              // Handle Saved Blogs tap
            },
          ),
        ],
      ),
    );
  }
}
