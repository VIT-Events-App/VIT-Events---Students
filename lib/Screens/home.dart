import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:students/Screens/EventPage.dart';
import 'package:students/Screens/requestEvent.dart';
import 'package:students/Screens/webview.dart';
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
          title: Text("Home"),
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
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      elevation: 2,
                      child: Container(
                        margin: EdgeInsets.all(15),
                        height: 150,
                        child: Column(
                          children: [
                            Text(snapshot.data.docs[index]
                                .data()['title']
                                .toString()),
                            Text(snapshot.data.docs[index]
                                .data()['short description']
                                .toString()),
                            Text(snapshot.data.docs[index]
                                .data()['time']
                                .toString()),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  snapshot.data.docs[index]
                                      .data()['imageUrl']
                                      .toString(),
                                  height: 80,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
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
                          builder: (context) =>
                              RequestEventForm()));
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
