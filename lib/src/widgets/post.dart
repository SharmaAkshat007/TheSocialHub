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
    final _deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      width: _deviceWidth * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('elon.jpg'),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Akshat Sharma',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
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
            Image(image: AssetImage('elon.jpg')),
            Row(children: [
              IconButton(
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
                color: Colors.purple,
                icon: Icon(Icons.comment),
                onPressed: () {},
                iconSize: 22,
              ),
            ]),
            Text(
              'A very happy man',
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
