import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreatePage extends StatefulWidget {
  final User user;
  CreatePage(this.user);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  // Text 입력을 할 때 사용하는 객체. 화면이 바뀔때 제거해야 하므로 dispose 함수를 넣어준다.
  final textEditingController = TextEditingController();



  ImagePicker _picker = ImagePicker();
  var _image;

  @override
  void dispose() {
    // 객체 해제.
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImage,
        child: Icon(Icons.camera),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(actions: <Widget>[
      IconButton(
        icon: Icon(Icons.send),
        onPressed: () {
          // 파일을 'ref 경로/post/파일명'으로 저장한다.
          final firebaseStorageRef = FirebaseStorage.instance
              .ref()
              .child('post')
              .child('${DateTime.now().millisecondsSinceEpoch}.png');

          final task = firebaseStorageRef.putFile(
            _image, SettableMetadata(contentType: 'image/png'));
          task.then((value){
            var downloadUrl = value.ref.getDownloadURL();
            downloadUrl.then((uri){
              var doc = FirebaseFirestore.instance.collection('post').doc();
              //Json 형식을 넣을때는 dictionary가 좋음.
              doc.set({
                'id' : doc.id,
                'photoUrl': uri.toString(),
                'contents' : textEditingController.text,
                'email' : widget.user.email,
                'displayName' : widget.user.displayName,
                'userPhotoUrl': widget.user.photoURL
              }). then((onValue){
                Navigator.pop(context);
              }); //return 값이 Futrue이므로 비동기로 끝난 다음에 처리하기 위해 then을 사용.
            });
          });
        },
      )
    ]);
  }

  Widget _buildBody() {
    // 화면이 넘어가게 되는 케이스가 생긴다면 스크롤 뷰를 이용하면 된다.
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _image == null ? Text('No Image') : Image.file(File(_image!.path)),
          Text('No Image'),
          TextField(
            controller: textEditingController,
            decoration: InputDecoration(hintText: '내용을 입력하세요'),
          )
        ],
      ),
    );
  }

  Future<void> _getImage() async {

   XFile? image = await _picker.pickImage(source: ImageSource.gallery);

  setState(() {
    _image = File(image!.path);
  });
  }
}
