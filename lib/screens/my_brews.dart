import 'package:brewit/services/brews_brain.dart';
import 'package:brewit/components/bottom_navigation_bar_configured.dart';
import 'package:brewit/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/brew.dart';

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
  List<Brew> brews;

  @override
  void initState() {
    super.initState();
    BrewsBrain().fetchBrews().then((value) {
      setState(() {
        brews = value;
      });
    }, onError: (e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My brews"),
      ),
      body: SafeArea(
        child: Container(
          child: brews == null ? Text('Loading...') : ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(10.0),
            children: createBrewsList(brews),
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
      bottomNavigationBar: BottomNavigationBarConfigured(
        selectedIndex: 1,
      ),
    );
  }
}

List<Widget> createBrewsList(List<Brew> brews) {
  final List<Widget> widgetsBrewList = List();

  for (Brew brew in brews) {
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
                      Icon(
                        FontAwesomeIcons.hourglassHalf,
                        size: 15.0,
                      ),
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
                      Icon(
                        FontAwesomeIcons.water,
                        size: 15.0,
                      ),
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
                      Icon(
                        FontAwesomeIcons.weight,
                        size: 15,
                      ),
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
                      Icon(
                        FontAwesomeIcons.thermometerEmpty,
                        size: 15,
                      ),
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
