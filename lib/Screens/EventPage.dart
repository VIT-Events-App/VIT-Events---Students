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
          title: Text("Event Details", style: TextStyle(color: Color(0xFF303D6B)),),
          backgroundColor: Colors.white,
          elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
                      child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 0, right: 0, bottom: 20),
                  child: Image.network(
                    widget.urlToImg,
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 50, color: Color(0xFF303D6B)),
                ),
                SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.access_time_sharp, size: 16),
                      ),
                      TextSpan(
                        text: " ${widget.time}",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.location_on, size: 16),
                      ),
                      TextSpan(
                        text: " VIT Bhopal University",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "About Event",
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.description,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Join Event Now"),
        backgroundColor: Color(0xFF303D6B),
        onPressed: () {
          launchURL(widget.urlToEvent);
        },
      ),
    );
  }
}
