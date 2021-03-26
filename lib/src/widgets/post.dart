import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  bool liked;
  Color color;

  @override
  void initState() {
    super.initState();
    liked = false;
    color = liked ? Colors.blue : Colors.purple;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                    '12/12/2001 12:34 AM',
                    style: TextStyle(fontSize: 14),
                  )
                ],
              )
            ],
          ),
        ),
        Image(image: AssetImage('assets/images/elon.jpg')),
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
                'A very happy man.I am very good man and a very successful entreprenaur!',
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
