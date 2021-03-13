import 'dart:ui';
import 'package:demo_troopedin/screens/chatdetails.dart';
import 'package:flutter/material.dart';
import '../modal/chat.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool hasNewMessage = false;
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkForNewMessage();
  }

  checkForNewMessage() {
    if (currentIndex == 0) {
      hasNewMessage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        centerTitle: true,
        backgroundColor: Color(0xff2B4B64),
      ),
      body: Container(
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: Colors.grey[200],
            thickness: 3.5,
          ),
          itemBuilder: (context, index) {
            return Column(
              children: [
                currentIndex == index
                    ? Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RaisedButton(
                              onPressed: () {},
                              color: Color(0xff2971A2),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 15, left: 35, right: 35, bottom: 15),
                                child: Text(
                                  "New Chat",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            Flexible(
                              child: RaisedButton(
                                onPressed: () {},
                                color: Color(0xff2971A2),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 15, left: 35, right: 35, bottom: 15),
                                  child: Text(
                                    "Create Group",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    : SizedBox(),
                (ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChatDetails(
                                  name: results[index].name,
                                )));
                  },
                  leading: Container(
                    width: 60.0,
                    height: 60.0,
                    padding: const EdgeInsets.all(2.0),
                    // borde width
                    decoration: new BoxDecoration(
                        color: Color(0xff2971A2), // border color
                        shape: BoxShape.circle),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://cdn.now.howstuffworks.com/media-content/0b7f4e9b-f59c-4024-9f06-b3dc12850ab7-1920-1080.jpg"),
                      radius: 50,
                    ),
                  ),
                  title: Text(
                    results[index].name,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  subtitle: results[index].chatType == "s"
                      ? Text(
                          results[index].message,
                          style: TextStyle(
                              color: index == currentIndex
                                  ? Colors.black
                                  : Colors.grey[600],
                              fontSize: 15,
                              fontWeight: index == currentIndex
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        )
                      : RichText(
                          text: TextSpan(
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            text: results[index].firstPerson + ": ",
                            children: <TextSpan>[
                              TextSpan(
                                text: results[index].message,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "16/11/2020",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: index == currentIndex
                                ? FontWeight.bold
                                : FontWeight.normal),
                      ),
                      currentIndex == index
                          ? Stack(
                              children: [
                                Icon(Icons.brightness_1,
                                    color: Color(0xff2971A2)),
                                Positioned(
                                  top: 5,
                                  left: 8.5,
                                  child: Text(
                                    "2",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                )
                              ],
                            )
                          : SizedBox()
                    ],
                  ),
                )),
              ],
            );
          },
          itemCount: results.length,
        ),
      ),
    );
  }
}
