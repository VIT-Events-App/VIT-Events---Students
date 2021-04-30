import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RequestEventForm extends StatefulWidget {
  @override
  _RequestEventFormState createState() => _RequestEventFormState();
}

class _RequestEventFormState extends State<RequestEventForm> {
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController eventEditingController = TextEditingController();
  TextEditingController guestnameEditingController = TextEditingController();
  TextEditingController guestLinkEditingController = TextEditingController();

  addToFirestore() async {
    Map<String, dynamic> eventData = {
      "Person's name": nameEditingController.text,
      "Event name": eventEditingController.text,
      "Guest name": guestnameEditingController.text,
      "Guest url": guestLinkEditingController.text,
    };

    FirebaseFirestore.instance
        .collection("Event Requests")
        .add(eventData)
        .catchError((e) {
      print("Error encountered while uploading data : $e");
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Request an Event", style: TextStyle(color: Color(0XFF303D6B)),),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 6,
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      TextField(
                        controller: nameEditingController,
                        decoration:
                            InputDecoration(hintText: "Enter your Name"),
                        maxLines: 1,
                      ),
                      TextField(
                        controller: eventEditingController,
                        decoration: InputDecoration(
                            hintText: "On What Topic do you need an event??"),
                        maxLines: 2,
                      ),
                      TextField(
                        controller: guestnameEditingController,
                        decoration: InputDecoration(
                            hintText: "Any particular guest you want to call?"),
                        maxLines: 1,
                      ),
                      TextField(
                        controller: guestLinkEditingController,
                        decoration: InputDecoration(
                            hintText: "Enter url to guest's public profile"),
                        maxLines: 2,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          addToFirestore();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0XFF303D6B), // background
                          onPrimary: Colors.white, // foreground
                        ),
                        child: Text("submit"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
