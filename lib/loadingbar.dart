import 'package:flutter/material.dart';

class LoadingBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, snapshot) {
        if(snapshot.hasData && snapshot.data)
        {
          return LinearProgressIndicator(
            backgroundColor: Colors.deepPurpleAccent,
          );
        }
        else return Container(); 
      },
    );
  }
}