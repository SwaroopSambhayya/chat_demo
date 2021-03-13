import 'package:flutter/material.dart';

class DisplayImage extends StatelessWidget {
  final String imageUrl;
  DisplayImage({this.imageUrl});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Center(
          child: Hero(
              tag: "imgPath", child: Image.network(imageUrl, width: width))),
    );
  }
}
