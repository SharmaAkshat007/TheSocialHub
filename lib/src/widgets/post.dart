import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  final caption;
  final date;
  final postImage;

  Post({this.caption, this.date, this.postImage}) : super();
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  bool liked;
  Color color;

  int index;

  @override
  void initState() {
    super.initState();
    liked = false;
    color = liked ? Colors.blue : Colors.purple;
  }

  dynamic dateFromatting(var timstamp) {
    var date = timstamp.toDate();

    var output = date.day.toString() +
        '/' +
        date.month.toString() +
        '/' +
        date.year.toString() +
        '  ' +
        date.hour.toString() +
        ':' +
        date.minute.toString();

    return output;
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage('assets/images/elon.jpg'),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Elon Musk',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(
                    height: 3.0,
                  ),
                  Text(
                    dateFromatting(widget.date),
                    style: TextStyle(fontSize: 14),
                  )
                ],
              )
            ],
          ),
        ),
        Image(
          image: NetworkImage(widget.postImage),
          height: deviceHeight,
          width: deviceWidth,
          fit: BoxFit.cover,
        ),
        Row(children: [
          IconButton(
            padding: const EdgeInsets.all(0.0),
            color: this.color,
            icon: Icon(Icons.thumb_up),
            onPressed: () {
              setState(() {
                this.liked = !this.liked;
                color = liked ? Colors.blue : Colors.purple;
              });
            },
            iconSize: 22,
          ),
          IconButton(
            padding: const EdgeInsets.all(0),
            color: Colors.purple,
            icon: Icon(Icons.comment),
            onPressed: () {},
            iconSize: 22,
          ),
        ]),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text(
                widget.caption,
                style: TextStyle(fontSize: 15),
                overflow: TextOverflow.visible,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
