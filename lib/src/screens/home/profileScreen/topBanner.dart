import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TopBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<QuerySnapshot>(context);
    for (var u in user.documents) {
      print(u.data);
    }
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
                    'Elon Musk!',
                    style: TextStyle(
                        fontSize: 33,
                        fontWeight: FontWeight.w600,
                        color: Colors.purple),
                  ),
                ],
              ),
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/elon.jpg'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
