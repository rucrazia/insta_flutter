import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final User user;

  const HomePage(this.user, {Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    // String? nullableString;
    //
    // void main(){
    //   if (widget.user.user?.photoURL != null) {
    //     var photo = widget.user.user?.photoURL;
    //   }
    // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Instagram Clon',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: _buildBody()
    );
  }

  Widget _buildBody() {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: SafeArea(
            child: SingleChildScrollView(
                child: Center(
          child: Column(children: <Widget>[
            Text(
              '인스타그램 오신 것을 환영합니다.',
              style: TextStyle(fontSize: 24.0),
            ),
            Padding(padding: EdgeInsets.all(8)),
            Text(
              '사진과 동영상을 보려면 팔로우하세요.',
            ),
            Padding(padding: EdgeInsets.all(16)),
            SizedBox(
                width: 260.0,
                child: Card(
                    child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: 80.0,
                      height: 80.0,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(widget.user.photoURL!),
                      )
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    Text(widget.user.email!),
                    Text(widget.user.displayName!),
                    Padding(padding: EdgeInsets.all(8.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 70.0,
                          height: 70.0,
                          child: Image.network('https://newsimg.sedaily.com/2021/12/03/22V5FF35UJ_1.jpg',
                          fit : BoxFit.cover)
                        ),
                        Padding(padding: EdgeInsets.all(1.0)),
                        SizedBox(
                            width: 70.0,
                            height: 70.0,
                            child: Image.network('https://newsimg.sedaily.com/2021/12/03/22V5FF35UJ_1.jpg'
                            , fit : BoxFit.cover)
                        ),
                        Padding(padding: EdgeInsets.all(1.0)),
                        SizedBox(
                            width: 70.0,
                            height: 70.0,
                            child: Image.network('https://newsimg.sedaily.com/2021/12/03/22V5FF35UJ_1.jpg'
                            , fit : BoxFit.cover)
                        ),
                      ]
                    ),
                    Padding(padding: EdgeInsets.all(4.0)),
                    Text('Facebook 친구'),
                    Padding(padding: EdgeInsets.all(4.0)),
                    RaisedButton(
                      child: Text('팔로우'),
                      color: Colors.blueAccent,
                      textColor: Colors.white,
                      onPressed: () {},
                    ),
                    Padding(padding: EdgeInsets.all(4.0)),
                  ],
                )))
          ]),
        ))));
  }
}
