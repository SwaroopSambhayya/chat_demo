import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/messagebubble.dart';

class ChatDetails extends StatefulWidget {
  final String name;
  ChatDetails({this.name});
  @override
  _ChatDetailsState createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  List<MessageBubble> textMessages = [];
  String mymessage;
  ScrollController scroll = ScrollController();
  TextEditingController txtController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textMessages = [
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
    textMessages = textMessages.reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
        backgroundColor: Color(0xff2B4B64),
        leadingWidth: width,
        toolbarHeight: 80,
        leading: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://cdn.now.howstuffworks.com/media-content/0b7f4e9b-f59c-4024-9f06-b3dc12850ab7-1920-1080.jpg"),
              radius: 30,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: ListView(
                controller: scroll,
                reverse: true,
                children: textMessages,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Container(
                decoration: kMessageContainerDecoration,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: txtController,
                        style: TextStyle(color: Colors.black),
                        onChanged: (value) {
                          //Do something with the user input.
                          setState(() {
                            mymessage = value;
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
                            print(mymessage);
                            textMessages.add(MessageBubble(
                                sender: "Me",
                                isMe: true,
                                text: mymessage,
                                timestamp: DateTime.now()));
                            textMessages = textMessages.reversed.toList();
                            print(textMessages[0].sender);
                          });
                          txtController.clear();
                          print(textMessages.reversed.toList());

                          print(textMessages);
                          scroll.animateTo(0.0,
                              duration: Duration(seconds: 1),
                              curve: Curves.easeIn);
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
            ),
          ],
        ),
      ),
    );
  }
}
