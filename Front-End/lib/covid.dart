import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'Utillity/libraries.dart';

class Covid extends StatefulWidget {
  static const route = '/covid';
  @override
  _CovidState createState() => _CovidState();
}

class _CovidState extends State<Covid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid-19 BD News'),
      ),
      body: WebView(
        initialUrl: "https://corona.gov.bd/",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
