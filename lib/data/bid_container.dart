
import 'package:flutter/material.dart';

class BidContainer extends StatefulWidget {
  final name;
  BidContainer({this.name});

  @override
  _BidContainerState createState() => _BidContainerState();
}

class _BidContainerState extends State<BidContainer> {
  bool _active = false;
  List item = [];
  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    var names = widget.name;
    return GestureDetector(
      onTap:_handleTap,
      child: Container(
        margin: EdgeInsets.all(8),
        height: 30,
        width: 50,
        child: Center(
          child: Text(
            '$names',
            style: TextStyle(
              color: _active ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: _active ? Colors.deepPurpleAccent : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.deepPurpleAccent,
            width: 1.2,
          ),
        ),
      ),
    );
  }
}


