import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AccountPage extends StatefulWidget {
  final User user;

  const AccountPage({Key? key, required this.user}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext  context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(onPressed: () {
          FirebaseAuth.instance.signOut();
          _googleSignIn.signOut();
        }, icon: Icon(Icons.exit_to_app))
      ],
    );
  }

  Widget _buildBody() {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Stack(children: <Widget>[
                    SizedBox(
                      width: 80.0,
                      height: 80.0,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'http://spnimage.edaily.co.kr/images/photo/files/NP/S/2021/10/PS21102000043.jpg'),
                      ),
                    ),
                    // 오른쪽 아래에 Actionbutton을 두기 위해 Container로 감싼다.
                    Container(
                        width: 80.0,
                        height: 80.0,
                        alignment: Alignment.bottomRight,
                        // Actionbutton만 추가했다면 크기가 크게 들어갔을 것임.
                        // SizedBox로 감싸서 크기를 줄임.
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            // 첫번째 Action Button은 뒤에 음영을 주기 위한 것
                            SizedBox(
                              width: 28.0,
                              height: 28.0,
                              child: FloatingActionButton(
                                onPressed: null,
                                backgroundColor: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 25.0,
                              height: 25.0,
                              child: FloatingActionButton(
                                onPressed: null,
                                backgroundColor: Colors.blue,
                                child: Icon(Icons.add),
                              ),
                            ),
                          ],
                        ))
                  ]),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  Text('이름',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0))
                ],
              ),
              Text(
                '0\게시물',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                '0\n팔로워',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                '0\n팔로잉',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0),
              ),
            ]));
  }
}
