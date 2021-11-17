import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:jackrose/page_liste.dart';
import 'package:jackrose/page_rallyes.dart';
import 'package:jackrose/page_agenda.dart';
import 'package:jackrose/page_sponsors.dart';
import 'package:jackrose/startpage.dart';

var pixelRatio = window.devicePixelRatio;
var logicalScreenSize = window.physicalSize / pixelRatio;
var logicalWidth = logicalScreenSize.width;
var logicalHeight = logicalScreenSize.height;
//Couleurs thème
Color marron = const Color(0xFF3B2F1D);
Color marronClair = const Color(0xFF4E4333);
Color rose1 = const Color(0xFFF8CBC6);
Color rose2 = const Color(0xFFDB9DC9);
Color dore = const Color(0xFFDFB625);

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyNavigationBar(),
    );
  }
}

class MyNavigationBar extends StatefulWidget {
  //const MyNavigationBar ({Key key}) : super(key: key);
  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  // void initState() {
  //   super.initState();
  // }

  int _selectedIndex = 0;
  static final List<Widget> _options = <Widget>[
    pageListe,
    pageAgenda,
    pageRallyes,
    pageSponsors,
    StartPage(),
  ];
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Jackrose',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: "ParkLane", fontSize: 60, color: Color(0xFFDFB625)),
          ),
          backgroundColor: marron),
      body: _options.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.groups),
              label: 'Liste',
              backgroundColor: Color(0xFF3B2F1D)),
          BottomNavigationBarItem(
              icon: Icon(Icons.date_range),
              label: 'La semaine',
              backgroundColor: Color(0xFF3B2F1D)),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Rallyes',
              backgroundColor: Color(0xFF3B2F1D)),
          BottomNavigationBarItem(
              icon: Icon(Icons.attach_money),
              label: 'Sponsors',
              backgroundColor: Color(0xFF3B2F1D)),
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_esports),
              label: 'Jeu',
              backgroundColor: Color(0xFF3B2F1D)),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        selectedItemColor: dore,
        unselectedItemColor: Colors.grey,
        iconSize: 40,
        onTap: _onItemTap,
        elevation: 5,
      ),
      backgroundColor: marronClair,
    );
  }
}
