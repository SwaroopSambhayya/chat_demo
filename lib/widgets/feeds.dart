import 'package:flutter/material.dart';
import './post.dart';

class Feeds extends StatefulWidget {
  @override
  _FeedsState createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Feeds"),
        centerTitle: true,
        backgroundColor: Color(0xff2B4B64),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return (Posts(index: index));
        },
        itemCount: 2,
      ),
    );
  }
}
