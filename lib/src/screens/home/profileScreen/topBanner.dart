import 'package:flutter/material.dart';

class TopBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _deviceWidth = MediaQuery.of(context).size.width;
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
                  SizedBox(height: 15),
                  Container(
                    width: _deviceWidth * 0.6,
                    child: Text(
                      'I am an entrepreneur and my name is elon musk.',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 16),
                    ),
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
