import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopBanner extends StatefulWidget {
  @override
  _TopBannerState createState() => _TopBannerState();
}

class _TopBannerState extends State<TopBanner> {
  @override
  Widget build(BuildContext context) {
    DocumentSnapshot userInfo = Provider.of<DocumentSnapshot>(context);

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
                    userInfo.data['name'],
                    style: TextStyle(
                        fontSize: 33,
                        fontWeight: FontWeight.w600,
                        color: Colors.purple),
                  ),
                ],
              ),
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(userInfo.data['profileImage']),
                backgroundColor: Colors.transparent,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
