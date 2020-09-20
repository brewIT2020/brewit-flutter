import 'package:brewit/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../main.dart';
import '../screens/my_brews.dart';
import '../ranking.dart';

class BottomNavigationBarConfigured extends StatelessWidget {
  const BottomNavigationBarConfigured({
    Key key,
    @required int selectedIndex,
  })  : _selectedIndex = selectedIndex,
        super(key: key);

  final int _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
          colors: [
            primaryBrown,
            secondaryBrown,
          ],
          stops: [0.0, 0.6]
        ),
      ),
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.home,
            ),
            title: Text('HOME'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.user,
            ),
            title: Text('PROFILE'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.cogs,
            ),
            title: Text('SETTINGS'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFe5dad0),
        onTap: (int index) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              if (index == 1) {
                return MyBrewsPage();
              }
              if (index == 2) {
                return RankingPage();
              }
              return MyHomePage();
            }),
          );
        },
        backgroundColor: Colors.transparent,
        selectedIconTheme: IconThemeData().copyWith(
          color: Color(0xFFe5dad0),
        ),
        unselectedIconTheme: IconThemeData().copyWith(
          color: Colors.black54,
        ),
        unselectedItemColor: Colors.black54,
      ),
    );
  }
}
