import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ContactUsPage extends StatefulWidget {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  GlobalKey<FormState> _key = new GlobalKey<FormState>();
  String emailId;
  TextEditingController emailData;
  TextEditingController purpuseData = TextEditingController(text: "Purpose");
  TextEditingController meassageData = TextEditingController(text: "Enter Your Message");
  String purpose;
  String mmessage;
  void _fetchUserData() async {
    try {
      FirebaseUser _currentUser = await FirebaseAuth.instance.currentUser();
      String authid = _currentUser.uid;
      // Firestore.instance.collection('UserData');
      Firestore.instance
          .collection('UserData')
          .document('$authid')
          .get()
          .then((ds) {
        if (ds.exists) {
          setState(() {
            emailId = ds.data['Email'];
            emailData = TextEditingController(text: '$emailId');
          });
        }
      });

      // ds.setData(tas)
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        backgroundColor: Color.fromRGBO(91, 74, 127,10),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 10, left: 5, right: 5),
              child: Form(
                key: _key,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: TextFormField(
                        controller: emailData,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Color.fromRGBO(91, 74, 127,10),
                        decoration: InputDecoration(
                          hintText: 'Email Id',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(91, 74, 127,10),
                            ),
                          ),
                        ),
                        readOnly: true,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      child: TextFormField(
                        controller: purpuseData,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Color.fromRGBO(91, 74, 127,10),
                        decoration: InputDecoration(
                          hintText: 'Purpose',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(91, 74, 127,10),
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          purpose = value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 50, left: 5, right: 5),
              child: TextFormField(
                controller: meassageData,
                maxLines: 8,
                keyboardType: TextInputType.emailAddress,
                cursorColor: Color.fromRGBO(91, 74, 127,10),
                decoration: InputDecoration(
                  hintText: 'Message',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(91, 74, 127,10),
                    ),
                  ),
                ),
                onChanged: (value) {
                  mmessage = value;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15, left: 5, right: 5),
              child: Container(
                color: Color.fromRGBO(91, 74, 127,10),
                height: 50,
                width: 200,
                child: RaisedButton(
                  onPressed: sendMessage,
                  color: Color.fromRGBO(91, 74, 127,10),
                  child: Text("Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: "Slabo27px",
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> sendMessage() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    String userId = user.uid;

    final DocumentReference dbr =
        Firestore.instance.document("HelpCenter/$userId");
    Map<String, String> message = {
      "Email": emailId,
      "Purpose": "$purpose",
      "Message": mmessage,
    };
    dbr.setData(message).whenComplete(() {
      print("Message Send");
    }).catchError((e) {
      print(e);
    });
    meassageData.clear();
    purpuseData.clear();
  }
}
