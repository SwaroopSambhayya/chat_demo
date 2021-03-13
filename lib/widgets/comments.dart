import 'package:flutter/material.dart';
import './messagebubble.dart';
import '../constants.dart';

class Comments extends StatefulWidget {
  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  ScrollController scroll = ScrollController();
  String mycomment;
  List<MessageBubble> comments = [];
  TextEditingController txtController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    comments = [
      MessageBubble(
          sender: "Ashok Kumar",
          text: "Hi, how are you?",
          isMe: false,
          timestamp: DateTime.now()),
      MessageBubble(
          sender: "Ashok Kumar",
          text: "What are you doing",
          isMe: false,
          timestamp: DateTime.now())
    ];
    comments = comments.reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height / 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Scrollbar(
              isAlwaysShown: true,
              controller: scroll,
              child: ListView(
                controller: scroll,
                reverse: true,
                children: comments,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 6, right: 6, bottom: 2),
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 5),
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 30)
                ]),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: txtController,
                    style: TextStyle(color: Colors.black),
                    onChanged: (value) {
                      //Do something with the user input.
                      setState(() {
                        mycomment = value;
                      });
                    },
                    decoration: kMessageTextFieldDecoration,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    color: Color(0xff2B4B64),
                    onPressed: () {
                      setState(() {
                        print(mycomment);
                        comments.add(MessageBubble(
                            sender: "You",
                            isMe: false,
                            text: mycomment,
                            timestamp: DateTime.now(),
                            bubbleColor: Colors.grey[300]));
                        comments = comments.reversed.toList();
                        print(comments[0].sender);
                      });
                      txtController.clear();
                      print(comments.reversed.toList());

                      print(comments);
                      scroll.animateTo(0.0,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ),
                Icon(
                  Icons.attach_file,
                  size: 30,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
