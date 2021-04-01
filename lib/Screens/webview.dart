import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webview extends StatelessWidget {

  String url;
  Webview(this.url);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Webview"),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
