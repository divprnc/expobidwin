import 'package:Bid2Win/Screens/faq.dart';
import 'package:Bid2Win/Screens/winners.dart';
import 'package:flutter/material.dart';
import './home_page_body.dart';
import './main_drawer.dart';
import '../loadingbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _wid = [
    HomePageBody(),
    FAQ(),
    Winners(),
  ];
  void _onClickChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(91, 74, 127,10),
        title: Text(
          'Bid2Win',
          style: TextStyle(
            fontFamily: 'Slabo27px',
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 1),
          child: LoadingBar(),
        ),
      ),
      
      drawer: MainDrawer(),
      body: _wid[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(91, 74, 127,10),
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Color.fromRGBO(91, 74, 127,10),
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onClickChange,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(91, 74, 127,10),
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            title: Text(
              'Home',
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(91, 74, 127,10),
            icon: Icon(
              Icons.add_comment,
              color: Colors.white,
            ),
            title: Text(
              'FAQ',
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(91, 74, 127,10),
            icon: Icon(
              Icons.star_border,
              color: Colors.white,
            ),
            title: Text(
              'Winners',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
