import 'package:flutter/material.dart';
import 'package:petStore/src/screens/home/profileScreen/grid.dart';
import 'package:petStore/src/screens/home/profileScreen/list.dart';
import 'package:petStore/src/screens/home/profileScreen/topBanner.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  bool grid;

  Color onColor = Colors.purple;
  Color offColor = Colors.black;

  @override
  void initState() {
    super.initState();
    grid = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              TopBanner(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        grid = true;
                      });
                    },
                    icon: Icon(Icons.grid_on_sharp),
                    color: grid ? onColor : offColor,
                    tooltip: 'Grid View',
                    splashColor: Colors.purple[100],
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        grid = false;
                      });
                    },
                    icon: Icon(Icons.list_sharp),
                    color: !grid ? onColor : offColor,
                    tooltip: 'List View',
                    splashColor: Colors.purple[100],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.mode_outlined),
                    color: Colors.black,
                    tooltip: 'Edit',
                    splashColor: Colors.purple[100],
                  ),
                ],
              ),
              grid ? Grid() : ScrollList()
            ],
          ),
        ),
      ),
    );
  }
}
