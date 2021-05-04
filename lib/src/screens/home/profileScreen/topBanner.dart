import 'package:flutter/material.dart';

class TopBanner extends StatefulWidget {
  String name;
  String profileImageUrl;

  TopBanner({Key key, this.name, this.profileImageUrl});

  @override
  _TopBannerState createState() => _TopBannerState();
}

class _TopBannerState extends State<TopBanner> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 50, right: 30, left: 30, bottom: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello,',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.name,
                    style: TextStyle(
                        fontSize: 33,
                        fontWeight: FontWeight.w600,
                        color: Colors.purple),
                  ),
                ],
              ),
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(widget.profileImageUrl),
                backgroundColor: Colors.transparent,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
