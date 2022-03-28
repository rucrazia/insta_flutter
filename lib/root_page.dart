import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:inf_insta/tab_page.dart';
import 'login_page.dart';

class RootPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoginPage();//const LoadingPage();
        } else {
          if (snapshot.hasData) {
            return TabPage(snapshot.data!);
          }
          return LoginPage();
        }
      },
    );

  }
}


