import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class EventTile extends StatelessWidget {
  String title, shortDes, longDes, time, image;
  EventTile({this.title, this.shortDes, this.longDes, this.time, this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Card(
          elevation: 2,
          child: Container(
            //margin: EdgeInsets.all(15),
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  image,
                ),
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.6), BlendMode.darken),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          color: Color(0xFF303D6B),
                          height: 50,
                          width: 200,
                          child: Center(
                            child: Text(
                              time,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Text(time),
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 18.0, right: 18.0, bottom: 15.0),
                      child: AutoSizeText(
                        title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400),
                        minFontSize: 18,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // Text(time),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
