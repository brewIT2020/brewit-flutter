import 'package:brewit/brews_brain.dart';
import 'package:brewit/ranking.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'brew.dart';
import 'main.dart';

const Color primaryBrown = Color(0xFFa35638);
const Color secondaryBrown = Color(0xFFe08f62);
const Color backgroundLight = Color(0xFFd7c79e);
const Color green = Color(0xFF9dab86);

const labelFontSize = 30.0;
const infoFontSize = 30.0;
const buttonFontSize = 25.0;
const parametersFontSize = 20.0;

TextStyle klabelLatoStyle = GoogleFonts.lato(
  color: primaryBrown,
  fontSize: labelFontSize,
);

TextStyle coffeeOfTheDayStyle = GoogleFonts.lato(
  color: primaryBrown,
  fontSize: infoFontSize,
);

TextStyle kButtonLatoStyle = GoogleFonts.lato(
  color: backgroundLight,
  fontSize: buttonFontSize,
);

TextStyle kLastBrewLatoStyle = GoogleFonts.lato(
  color: backgroundLight,
  fontSize: parametersFontSize,
);

class MyBrewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyBrews();
  }
}

class MyBrews extends StatefulWidget {
  @override
  _MyBrewsState createState() => _MyBrewsState();
}

class _MyBrewsState extends State<MyBrews> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My brews"),
      ),
      body: SafeArea(
        child: Container(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(10.0),
            children: createBrewsList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: backgroundLight,
        child: Icon(
          FontAwesomeIcons.plus,
        ),
        onPressed: () {
          print("Hello!");
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.home,
            ),
            title: Text('HOME'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.userNinja),
            title: Text('PROFILE'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.award,
            ),
            title: Text('RANKING'),
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
        backgroundColor: Color(0xFF8b543c),
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

List<Widget> createBrewsList() {
  final List<Widget> widgetsBrewList = List();

  for (final Brew brew in BrewsBrain().brews) {
    final Widget brewCard = Container(
      child: Card(
        color: Color(0xFFa35638),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(FontAwesomeIcons.coffee),
              title: Text(brew.coffee),
              subtitle: Text(brew.description),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10, left: 5, right: 5, top: 5),
              alignment: Alignment.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.hourglassHalf),
                      Text(
                        brew.time.toString() + " min",
                        style: kLastBrewLatoStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.water),
                      Text(
                        '  500 ml',
                        style: kLastBrewLatoStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.weight),
                      Text(
                        brew.weight.toString() + ' gram',
                        style: kLastBrewLatoStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.thermometerEmpty),
                      Text(
                        brew.temperature.toString() + ' °C',
                        style: kLastBrewLatoStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    widgetsBrewList.add(brewCard);
  }
  return widgetsBrewList;
}
