import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BuyBids extends StatefulWidget {
  @override
  _BuyBidsState createState() => _BuyBidsState();
}

class _BuyBidsState extends State<BuyBids> {
  final navigatorKey = GlobalKey<NavigatorState>();
  Razorpay _razorpay;
  String email;
  String phone;
  int buyBids;
  int totalAmount;
  String totalBids = '';
  int _totalBids;
  int myBid;
  // TextEditingController _tb;
  void _fetchUserAndBidData() async {
    try {
      FirebaseUser _currentUser = await FirebaseAuth.instance.currentUser();
      String authid = _currentUser.uid;
      Firestore.instance
          .collection('BidData')
          .document('$authid')
          .get()
          .then((ds) {
        if (ds.exists) {
          setState(() {
            totalBids = ds.data['TotalBids'];
            //  _tb = TextEditingController(text: '$totalBids');
            _totalBids = int.parse(totalBids);
            // print(totalBids);
          });
        }
      });
      Firestore.instance
          .collection('UserData')
          .document('$authid')
          .get()
          .then((ds) {
        if (ds.exists) {
          setState(() {
            email = ds.data['Email'];
            phone = ds.data['MobileNum'];
            print(totalBids);
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> _updateUserBidsData(int totalNumBid) async {
    try {
      FirebaseUser _currentUser = await FirebaseAuth.instance.currentUser();
      String authid = _currentUser.uid;
      final DocumentReference databaseReference =
          Firestore.instance.document("BidData/$authid");

      Map<String, String> userData = <String, String>{
        'TotalBids': '$totalNumBid',
      };

      databaseReference.updateData(userData).whenComplete(() {
        Fluttertoast.showToast(msg: 'Bid Updated ');
        print("");
      }).catchError((e) {
        print("Error -> $e");
      });
      // ds.setData(tas)
    } catch (e) {
      print("Error -> " + e);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchUserAndBidData();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout(int amount) async {
    var options = {
      'key': 'rzp_live_rzFuIgzaQZDQPn',
      'amount': amount * 100,
      'name': 'BidAnd2Win',
      'description': 'Buying Bid to play game',
      'prefill': {'contact': phone, 'email': email},
      'external': {
        'wallets': ['paytm'],
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void saveSucessPaymentDetails(String paymentId, String orderId) async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    String userId = user.uid;
    String email = user.email;
    Firestore.instance
        .collection('UserData')
        .document('$userId')
        .get()
        .then((ds) {
      String fullName = ds.data['FullName'];
      String mobileNum = ds.data['MobileNum'];

      final DocumentReference dbr =
          Firestore.instance.document("PaymentSucess/$userId");

      Map<String, String> sucessData = {
        "User Id": userId,
        "Email": email,
        "Name": fullName,
        "MobileNumber": mobileNum,
        "PaymentId": paymentId,
        "OrderId": orderId,
      };
      dbr.setData(sucessData).then((ds) {
        print("Payment Complete");
      }).catchError((e) {
        print("e");
      });
    });
  }

  void saveFailPaymentDetails(String message, String code) async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    String userId = user.uid;
    String email = user.email;
    Firestore.instance
        .collection('UserData')
        .document('$userId')
        .get()
        .then((ds) {
      String fullName = ds.data['FullName'];
      String mobileNum = ds.data['MobileNum'];

      final DocumentReference dbr =
          Firestore.instance.document("PaymenFailure/$userId");

      Map<String, String> sucessData = {
        "User Id": userId,
        "Email": email,
        "Name": fullName,
        "MobileNumber": mobileNum,
        "Message": message,
        "Code": code
      };
      dbr.setData(sucessData).then((ds) {
        print("Payment Complete");
      }).catchError((e) {
        print("e");
      });
    });
  }


  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    String paymentId = response.paymentId;
    String orderId = response.orderId;
    int overAll = myBid + _totalBids;
    _updateUserBidsData(overAll);
    saveSucessPaymentDetails(paymentId, orderId);
    Fluttertoast.showToast(msg: 'Success  ' + response.paymentId);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    saveFailPaymentDetails(response.message, response.code.toString());
    Fluttertoast.showToast(
        msg: 'Failure  ' + response.code.toString() + " - " + response.message);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: 'Currently we are not accepting wallet payment' +
            response.walletName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy Bids'),
        backgroundColor: Color.fromRGBO(91, 74, 127,10),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 30,
              color: Colors.greenAccent,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(2),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Currently we are not accepting Wallet Payments, Please use other payment methods.",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            getBidsData(1, 3 , 10),
            getBidsData(2, 7, 20),
            getBidsData(3, 13, 35),
            getBidsData(4, 30, 70),
            getBidsData(5, 50, 130),
            getBidsData(6, 100, 240),
            getBidsData(7, 200, 430),
            getBidsData(8, 500, 820),
            getBidsData(8, 1000, 1600),
          ],
        ),
      ),
    );
  }

  Widget getBidsData(int num, int bids, int price) {
    String bid = "$bids bids";
    // String pric = "₹ $price";
    String prices = price.toString();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 65,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Color.fromRGBO(91, 74, 127, 10),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.black,
              width: 3.5,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              bid,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Container(
              width: 80,
              // child: Text(

              child: RaisedButton(
                color: Color.fromRGBO(91, 74, 127,10),
                onPressed: () async {
                  if (num == 1) {
                    totalAmount = price;
                    openCheckout(totalAmount);
                    myBid = bids;
                  }
                  if (num == 2) {
                    totalAmount = price;
                    openCheckout(totalAmount);
                    myBid = bids;
                  }
                  if (num == 3) {
                    totalAmount = price;
                    openCheckout(totalAmount);
                    myBid = bids;
                  }
                  if (num == 4) {
                    totalAmount = price;
                    openCheckout(totalAmount);
                    myBid = bids;
                  }
                  if (num == 5) {
                    totalAmount = price;
                    openCheckout(totalAmount);
                    myBid = bids;
                  }
                  if (num == 6) {
                    totalAmount = price;
                    openCheckout(totalAmount);
                    myBid = bids;
                  }
                  if (num == 7) {
                    totalAmount = price;
                    openCheckout(totalAmount);
                    myBid = bids;
                  }
                  if (num == 8) {
                    totalAmount = price;
                    openCheckout(totalAmount);
                    myBid = bids;
                  }
                },
                child: Text(
                  '₹ $prices',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.white,
                width: 2.5,
              )),
            ),
          ],
        ),
      ),
    );
  }
}
