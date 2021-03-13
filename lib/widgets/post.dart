import 'comments.dart';
import 'package:flutter/material.dart';
import 'image_display.dart';

class Posts extends StatefulWidget {
  int index;
  Posts({this.index});

  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  bool showComment = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(top: 18),
      color: Color(0xffF9F8F8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.lightBlue[50],
              backgroundImage: NetworkImage(
                  "https://cdn.now.howstuffworks.com/media-content/0b7f4e9b-f59c-4024-9f06-b3dc12850ab7-1920-1080.jpg"),
              radius: 35,
            ),
            title: Text("Ashok Kumar"),
            subtitle: Text("18 Nov, 12:28"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 20),
            child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."),
          ),
          widget.index != 1
              ? Container(
                  padding: EdgeInsets.only(top: 20, bottom: 5),
                  width: width,
                  child: GestureDetector(
                    child: Hero(
                      tag: "imgPath",
                      child: Image.network(
                          "https://cdn.mos.cms.futurecdn.net/C2pjtmUhJK5zyUhhBeKfnm.jpg"),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                            builder: (context) => DisplayImage(
                                  imageUrl:
                                      "https://cdn.mos.cms.futurecdn.net/C2pjtmUhJK5zyUhhBeKfnm.jpg",
                                ),
                            fullscreenDialog: true),
                      );
                    },
                  ),
                )
              : Container(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                ),
          Row(
            children: [
              SizedBox(
                width: 8,
              ),
              IconButton(
                onPressed: () {},
                iconSize: 24,
                icon: Icon(Icons.favorite),
                color: Colors.red,
              ),
              SizedBox(
                width: 5,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    if (showComment == true)
                      showComment = false;
                    else
                      showComment = true;
                  });
                  print(showComment);
                },
                icon: Icon(
                  Icons.comment,
                ),
                color: showComment == false ? Colors.grey : Colors.blue,
              ),
              SizedBox(
                width: 5,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share),
                  color: Colors.grey),
            ],
          ),
          showComment == true ? Comments() : SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 20, bottom: 15),
                  child: Text("You,Rahul and 200 Others like this post"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 10, bottom: 15),
                child: Text("200 comments"),
              )
            ],
          )
        ],
      ),
    );
  }
}
