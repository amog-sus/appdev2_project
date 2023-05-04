import 'package:flutter/material.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import './user.dart';
import './passport.dart';
import './dbhelper.dart';

void main() => runApp(ExploreEurope());

class ExploreEurope extends StatelessWidget {
  const ExploreEurope({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explore Europle',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      theme: new ThemeData(
          primarySwatch: Colors.blueGrey,
          scaffoldBackgroundColor: const Color(0xFF887CA3)
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/yelan.png'),
                    radius: 80,
                  ),
                  Expanded(child:
                    Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 25.0),
                          child: Center(
                            child: Text(
                              'Sonia',
                              style: TextStyle(fontSize: 22, color: Colors.white),
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.white,
                          thickness: 1,
                          indent: 10,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 20.0),
                          child: Center(
                            child: Text(
                              'norway_lover31',
                              style: TextStyle(fontSize: 22, color: Colors.white),
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.white,
                          thickness: 1,
                          indent: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.white,
              thickness: 1,
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text('You visited 3 countries since joining.', style: TextStyle(color: Colors.white, fontSize: 18)),
                    Text('Your favorite country is currently Norway.', style: TextStyle(color: Colors.white, fontSize: 18)),
                    Text('Your next destination will be Spain!', style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.white,
              thickness: 1,
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text('Your Bank: Scotia Bank', style: TextStyle(color: Colors.white, fontSize: 18)),
                    Text('Account Number: **** **** **** 1820', style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.white,
              thickness: 1,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 10.0),
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Edit Information'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
