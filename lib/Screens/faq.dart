import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class FAQ extends StatefulWidget {
  @override
  _FAQState createState() => _FAQState();
}

Widget getanswers(BuildContext context, String answers) {
  return SingleChildScrollView(
    child: Container(
      height: 350,
      margin: EdgeInsets.all(8),
      width: double.infinity,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Color.fromRGBO(91, 74, 127,10),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: <Widget>[
          Text(
            answers,
            style: TextStyle(
              fontFamily: 'Slabo27',
              fontSize: 20,
              fontWeight: FontWeight.bold,
                color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget getQuestions(BuildContext context, String questions) {
  return SingleChildScrollView(
    child: Container(
      height: 350,
      margin: EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromRGBO(91, 74, 127,10),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          questions,
          style: TextStyle(
            fontFamily: 'Slabo27',
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}

Widget getQuestion(BuildContext context, String question, String answers) {
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Container(
          margin: EdgeInsets.all(8),
          height: 370,
          width: double.infinity,
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Color.fromRGBO(91, 74, 127,10),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: <Widget>[
              FlipCard(
                front: getQuestions(context, question),
                back: getanswers(context, answers),
                direction: FlipDirection.HORIZONTAL,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class _FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            getQuestion(context, 'How to Place Bids ?',
                '1. After SignUp go to HomePage and select the Live Bids\n\n2.Then you will see the products which are running live\n\n3. Select the product on which you wants to place the Bids.\n\n4. Select the  Bid Number \n\n5. Wait for the result\n\n6. Win the Exciting Prizes'),
            getQuestion(context, 'How to Buy Bids ?',
                '1. After SignUp go to HomePage and select the Buy Bid Option\n\n2. Then Select the number of Bids you want to Buy\n\n3. Click on Price\n\n4.Enter your Mobile Number if you have not updated in your profile\n\n5. Choose the Payment Method and pay the amount\n\n6. Bid are added to your account'),
            // getQuestion(context, 'How to Play ?',
            //     '1. First Signup verifiy your email and phone numbers.\n2.Then login and Play'),
          ],
        ),
      ),
    );
  }
}
