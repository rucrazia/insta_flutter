import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'create_page.dart';

class SearchPage extends StatefulWidget {

  final User user;
  const SearchPage(this.user, {Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => CreatePage(widget.user)));
      },
      child: Icon(Icons.create),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget _buildBody() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      childAspectRatio: 1.0,
      crossAxisCount: 3,
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 1.0),
        itemCount:5,
        itemBuilder: (context, index){
      return _buildListItem(context,index);
    });
  }

  Widget _buildListItem(context, index) {
    return Image.network('http://www.busan.com/nas/data/content/image/2018/02/14/20180214000357_0.jpg',
        fit: BoxFit.cover);
  }
}
