import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EventsPage extends StatefulWidget {
  String description, title, time, urlToEvent, urlToImg;
  EventsPage(
      {this.description,
      this.time,
      this.title,
      this.urlToEvent,
      this.urlToImg});

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
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
        title: Text("Event Details"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(fontSize: 50),
            ),
                        SizedBox(
              height: 20,
            ),
            Text(
              widget.time,
              style: TextStyle(fontSize: 20),
            ),

            SizedBox(
              height: 20,
            ),
            Image.network(
              widget.urlToImg,
              height: 200,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.description,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Join Event Now"),
        onPressed: () {
          launchURL(widget.urlToEvent);
        },
      ),
    );
  }
}
