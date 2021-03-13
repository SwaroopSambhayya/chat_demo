import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final sender;
  final text;
  final bool isMe;
  final DateTime timestamp;
  final Color bubbleColor;
  MessageBubble(
      {this.sender, this.text, this.isMe, this.timestamp, this.bubbleColor});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Material(
              elevation: 0,
              color: bubbleColor == null
                  ? (isMe ? Colors.grey[300] : Color(0xffBED5E4))
                  : bubbleColor,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: width / 2,
                      child: Row(
                        //mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(sender,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          Text(
                            "20:15",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(text,
                        style: TextStyle(color: Colors.black, fontSize: 16)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
