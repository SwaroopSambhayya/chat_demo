import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.white,
  //fontWeight: FontWeight.bold,
  fontSize: 16.0,
);
const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter your email',
  hintStyle: TextStyle(color: Colors.black54),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
    border: Border.symmetric(
      vertical: BorderSide(color: Colors.black, width: 1),
      horizontal: BorderSide(color: Colors.black, width: 1),
    ),
    borderRadius: BorderRadius.all(Radius.circular(11)));
