import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:students/Screens/EventPage.dart';
import 'package:students/Screens/requestEvent.dart';
import 'package:students/Screens/webview.dart';
import 'package:students/UI%20models/event-tile.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ref = FirebaseFirestore.instance
      .collection("events")
      .orderBy("priority", descending: false);

  launchURL(String link) async {
    var url = link;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("VIT Bhopal", style: TextStyle(color: Color(0xFF303D6B)),),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: StreamBuilder(
          stream: ref.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return ListView.builder(
              itemCount: snapshot.hasData ? snapshot.data.docs.length : 0,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EventsPage(
                                    title: snapshot.data.docs[index]
                                        .data()['title']
                                        .toString(),
                                    description: snapshot.data.docs[index]
                                        .data()['description']
                                        .toString(),
                                    time: snapshot.data.docs[index]
                                        .data()['time']
                                        .toString(),
                                    urlToEvent: snapshot.data.docs[index]
                                        .data()['urlToEvent']
                                        .toString(),
                                    urlToImg: snapshot.data.docs[index]
                                        .data()['imageUrl']
                                        .toString(),
                                  )));
                    },
                    child: EventTile(
                      image: snapshot.data.docs[index]
                          .data()['imageUrl']
                          .toString(),
                      shortDes: snapshot.data.docs[index]
                          .data()['short description']
                          .toString(),
                      time: snapshot.data.docs[index].data()['time'].toString(),
                      title:
                          snapshot.data.docs[index].data()['title'].toString(),
                    ));
              },
            );
          },
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Text(
                  'Vellore Institute of Technology, Bhopal',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.normal),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Request Event'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RequestEventForm()));
                },
              ),
              ListTile(
                title: Text('About VIT Bhopal'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Webview("https://vitbhopal.ac.in/")));
                },
              ),
              ListTile(
                title: Text('Faculties'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Webview("https://vitbhopal.ac.in/faculty/")));
                },
              ),
              ListTile(
                title: Text('Clubs Information'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Webview(
                              "https://vitbhopal.ac.in/campus-life/#club_chapter")));
                },
              ),
            ],
          ),
        ));
  }
}
