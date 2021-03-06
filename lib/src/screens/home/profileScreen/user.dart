import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:petStore/src/screens/home/profileScreen/grid.dart';
import 'package:petStore/src/screens/home/profileScreen/list.dart';
import 'package:petStore/src/screens/home/profileScreen/topBanner.dart';
import 'package:petStore/services/authService.dart';
import 'package:petStore/src/widgets/loading.dart';
import 'package:provider/provider.dart';

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

  void getCurrentUserPosts(QuerySnapshot allPosts, FirebaseUser currentUser,
      List<DocumentSnapshot> currentPosts) {
    for (DocumentSnapshot doc in allPosts.documents) {
      if (doc.data['user_uid'] == currentUser.uid) {
        currentPosts.add(doc);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    QuerySnapshot allPosts = Provider.of<QuerySnapshot>(context);
    FirebaseUser currentUser = Provider.of<FirebaseUser>(context);

    List<DocumentSnapshot> currentPosts = [];

    getCurrentUserPosts(allPosts, currentUser, currentPosts);

    return allPosts == null && currentUser == null
        ? Loading()
        : Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: TopBanner(),
                ),
                SliverAppBar(
                  elevation: 0.0,
                  backgroundColor: Colors.white,
                  snap: false,
                  floating: false,
                  pinned: true,
                  flexibleSpace: Row(
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
                        icon: Icon(Icons.edit),
                        color: Colors.black,
                        tooltip: 'Edit',
                        splashColor: Colors.purple[100],
                      ),
                      IconButton(
                        onPressed: () async {
                          await Auth().signOut();
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        icon: Icon(Icons.logout),
                        color: Colors.black,
                        tooltip: 'Logout',
                        splashColor: Colors.purple[100],
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    child: Column(
                      children: [
                        grid
                            ? Grid(
                                currentPosts: currentPosts,
                              )
                            : ScrollList(currentPosts: currentPosts)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
