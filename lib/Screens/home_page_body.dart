import 'package:Bid2Win/Screens/buy_bid.dart';
import 'package:Bid2Win/Screens/live_bids.dart';
import '../animation_for_Page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  Widget getCard(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 1, right: 3, bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(91, 74, 127,10),
          borderRadius: BorderRadius.circular(5),
        ),
        width: double.infinity,
        height: 170,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(
              icon,
              size: 100,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Slabo27',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getContainer(String title) {
    return Container(
      height: 50,
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Card(
        elevation: 14,
        color: Color.fromRGBO(91, 74, 127,10),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'Slabo27',
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // FadeAnimation(
            //   1,
            //   CarouselSlider(
            //     aspectRatio: 2.0,
            //     height: 200,
            //     autoPlay: true,
            //     items: [
            //       AssetImage('assets/images/Gift.jpg'),
            //       AssetImage('assets/images/Gift.jpg'),
            //       AssetImage('assets/images/Gift.jpg'),
            //     ].map((i) {
            //       return Builder(
            //         builder: (BuildContext context) {
            //           return Container(
            //               width: MediaQuery.of(context).size.width,
            //               margin: EdgeInsets.symmetric(horizontal: 5.0),
            //               decoration: BoxDecoration(color: Colors.amber),
            //               child: Text(
            //                 'text $i',
            //                 style: TextStyle(fontSize: 16.0),
            //               ),
            //               );
            //         },
            //       );
            //     }).toList(),
            //   ),
            // ),
            Container(
              width: double.infinity,
              height: 200,
              child: Carousel(
                autoplay: true,
                autoplayDuration: Duration(seconds: 1),
                // animationDuration: Duration(seconds: 6),
                images: [
                  AssetImage('assets/images/cro1.png'),
                  AssetImage('assets/images/cro2.png'),
                  AssetImage('assets/images/cro3.png'),
                  AssetImage('assets/images/cro1.png'),
                  AssetImage('assets/images/cro4.png'),
                  // AssetImage('assets/images/Gift.jpg'),
                  // AssetImage('assets/images/Gift.jpg'),
                ],
              ),
            ),
            Card(
              color: Color.fromRGBO(91, 74, 127,10),
              elevation: 15,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image(
                      width: double.infinity,
                      fit: BoxFit.cover,
                      height: 250,
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.attach_money,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Welcome to Bid2Win\nWin Exciting Prizes',
                              style: TextStyle(
                                fontFamily: 'Slabo27',
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  InkWell(
                      child: getCard('Live Bids', Icons.live_tv),
                      onTap: () {
                        Navigator.push(
                            context, AnimationForPage(wid: LiveBidsPage()));
                      }),
                  InkWell(
                      child: getCard('Buy Bids', Icons.account_balance_wallet),
                      onTap: () {
                        Navigator.push(
                            context, AnimationForPage(wid: BuyBids()));
                      }),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(3),
              width: double.infinity,
              height: 250,
              color:Color.fromRGBO(91, 74, 127,10),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                        top: 8,
                      ),
                      width: 370,
                      height: 50,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Color.fromRGBO(91, 74, 127,4),
                        Color.fromRGBO(91, 74, 127,5),
                      ])),
                      child: Center(
                        child: Text(
                          "Create Your Account",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          "Select the Product",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Color.fromRGBO(91, 74, 127,4),
                        Color.fromRGBO(91, 74, 127,5),
                      ])),
                      margin: EdgeInsets.only(
                        top: 8,
                      ),
                      width: 370,
                      height: 50,
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          "Place the Unique Bid",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Color.fromRGBO(91, 74, 127,4),
                        Color.fromRGBO(91, 74, 127,6),
                      ])),
                      margin: EdgeInsets.only(
                        top: 8,
                      ),
                      width: 370,
                      height: 50,
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          "Get the Product",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      margin: EdgeInsets.only(
                        top: 8,
                      ),
                      width: 370,
                      height: 50,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Color.fromRGBO(91, 74, 127,4),
                        Color.fromRGBO(91, 74, 127,5),
                      ])),
                    ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //       gradient: LinearGradient(colors: [
                    //     Colors.deepPurpleAccent.shade100,
                    //     Colors.deepPurpleAccent.shade100,
                    //   ])),
                    //   margin: EdgeInsets.only(
                    //     top: 8,
                    //   ),
                    //   width: 370,
                    //   height: 50,
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
