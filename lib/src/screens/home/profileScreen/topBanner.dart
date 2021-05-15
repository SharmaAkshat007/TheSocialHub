import 'package:flutter/material.dart';
import 'package:petStore/models/userModel.dart';
import 'package:provider/provider.dart';

class TopBanner extends StatefulWidget {
  @override
  _TopBannerState createState() => _TopBannerState();
}

class _TopBannerState extends State<TopBanner> {
  @override
  Widget build(BuildContext context) {
    UserModel userInfo = Provider.of<UserModel>(context);

    return userInfo == null
        ? Text('')
        : Column(
            children: [
              Container(
                margin:
                    EdgeInsets.only(top: 50, right: 30, left: 30, bottom: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello,',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.normal),
                        ),
                        SizedBox(height: 8),
                        Text(
                          userInfo.name,
                          style: TextStyle(
                              fontSize: 33,
                              fontWeight: FontWeight.w600,
                              color: Colors.purple),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: userInfo.profileImage != ''
                          ? NetworkImage(userInfo.profileImage)
                          : AssetImage('assets/images/whitescreen.jpg'),
                      backgroundColor: Colors.transparent,
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
