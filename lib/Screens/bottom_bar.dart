// import 'package:Bid2Win/Screens/homepage.dart';
import 'package:flutter/material.dart';
// import './winners.dart';
// import './faq.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  // final List<Map<String, Object>> _pages = [
  //   {'page': HomePage(), 'title': 'Home'},
  //   {'page': FAQ(), 'title': 'Faq'},
  //   {'page': Winners(), 'title': 'Winners'},
  // ];



  void _onClickChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.purpleAccent,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onClickChange,
        
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.deepPurpleAccent,
            icon: Icon(
              Icons.home,
            ),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.deepPurpleAccent,
            icon: Icon(
              Icons.add_comment,
            ),
            title: Text('FAQ'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.deepPurpleAccent,
            icon: Icon(
              Icons.star_border,
            ),
            title: Text('Winners'),
          ),
        ],
      );
    
  }
}
