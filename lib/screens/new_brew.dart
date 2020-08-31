import 'package:brewit/components/bottom_navigation_bar_configured.dart';
import 'package:brewit/components/round_icon_button.dart';
import 'package:brewit/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewBrew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NewBrewPage();
  }
}

class NewBrewPage extends StatefulWidget {
  @override
  _NewBrewPageState createState() => _NewBrewPageState();
}

class _NewBrewPageState extends State<NewBrewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New brew"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          Expanded(
            flex: 2,
            child: ClipPath(
              clipper: PhotoClipper(),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      primaryBrown,
                      secondaryBrown,
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.camera,
                    ),
                    Text("Add photo")
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(5),
              child: Timer(),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: PropertyCard(
                      propertyName: "Weight",
                      propertyValue: 10,
                      unit: "g",
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: PropertyCard(
                      propertyName: "Temperature",
                      propertyValue: 100,
                      unit: "°C",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(5),
              child: SliderPropertyCard(),
            ),
          ),
          Expanded(
            child: GestureDetector(
              child: Container(
                child: Center(
                  child: Text(
                    "CREATE BREW!",
                  ),
                ),
                color: primaryBrown,
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBarConfigured(
        selectedIndex: 0,
      ),
    );
  }
}

class SliderPropertyCard extends StatelessWidget {
  static const int fluidVolume = 300;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 5),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomRight,
          colors: [
            primaryBrown,
            secondaryBrown,
          ],
        ),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: kElevationToShadow[1],
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            child: Text(
              "Fluid volume"
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Text(
              fluidVolume.toString() + "ml"
            ),
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              inactiveTrackColor: secondaryBrown,
              activeTrackColor: Colors.white,
              thumbColor: primaryBrown,
              overlayColor: Color(0x29EB1555),
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
            ),
            child: Slider(
              label: "Fluid Volume",
              value: fluidVolume.toDouble(),
              min: 50.0,
              max: 650.0,
              onChanged: (double newValue) {
                setState() {}
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PropertyCard extends StatelessWidget {
  final String propertyName;
  final int propertyValue;
  final String unit;

  static const double width = 56.0;
  static const double height = 56.0;

  //We need to add property on pressed function

  PropertyCard({this.propertyName, this.propertyValue, this.unit});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomRight,
          colors: [
            primaryBrown,
            secondaryBrown,
          ],
        ),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: kElevationToShadow[1],
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Text(propertyName),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              propertyValue.toString() + ' $unit',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RoundIconButton(
                width: width,
                height: height,
                color: primaryBrown,
                onPressed: () {},
                icon: FontAwesomeIcons.minus,
              ),
              RoundIconButton(
                width: width,
                height: height,
                color: primaryBrown,
                onPressed: () {},
                icon: FontAwesomeIcons.plus,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Timer extends StatelessWidget {
  const Timer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomRight,
          colors: [
            primaryBrown,
            secondaryBrown,
          ],
        ),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: kElevationToShadow[1],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: CupertinoTimerPicker(
              mode: CupertinoTimerPickerMode.ms,
              onTimerDurationChanged: (value) {},
            ),
          ),
          Expanded(
            flex: 1,
            child: RoundIconButton(
              color: primaryBrown,
              width: 60.0,
              height: 60.0,
              icon: FontAwesomeIcons.play,
            ),
          ),
        ],
      ),
    );
  }
}

class PhotoClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 35);
    path.quadraticBezierTo(
        size.width / 2, size.height + 30, size.width, size.height - 35);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
