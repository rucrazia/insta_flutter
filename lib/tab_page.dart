import 'package:flutter/material.dart';
import 'package:inf_insta/account_page.dart';
import 'package:inf_insta/home_page.dart';
import 'package:inf_insta/search_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TabPage extends StatefulWidget {

   final User user;
   const TabPage (this.user,  {Key? key}) : super(key: key);

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 0;

  late List _pages;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = [
      HomePage(widget.user),
      SearchPage(widget.user),
      AccountPage(user: widget.user),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Center(child: _pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
      ])
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
