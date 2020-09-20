import 'package:brewit/components/bottom_navigation_bar_configured.dart';
import 'package:brewit/components/round_icon_button.dart';
import 'package:brewit/constants.dart';
import 'package:brewit/main.dart';
import 'package:brewit/models/brew.dart';
import 'package:brewit/services/brews_brain.dart';
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
  int _weight = 10;
  int _temperature = 100;
  int _volume = 300;
  int _time = 0;
  String _productName = "unknown";
  String _description = "unknown";
  String errorMsg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New Brew",
        ),
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
              child: Timer(
                onTimerDurationChanged: (value) =>
                    setState(() => _time = (value as Duration).inSeconds),
              ),
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
                      propertyValue: _weight,
                      unit: "g",
                      onPressMinus: () => setState(() => _weight--),
                      onPressPlus: () => setState(() => _weight++),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: PropertyCard(
                      propertyName: "Temperature",
                      propertyValue: _temperature,
                      unit: "°C",
                      onPressMinus: () => setState(() => _temperature--),
                      onPressPlus: () => setState(() => _temperature++),
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
              child: SliderPropertyCard(
                fluidVolume: _volume,
                onChange: (newValue) => setState(() => _volume = newValue),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    elevation: 15,
                    backgroundColor: secondaryBrown,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: StatefulBuilder(
                      builder: (context, setState) {
                        return Container(
                          margin: EdgeInsets.all(5),
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
                          height: 330,
                          child: Container(
                            margin: EdgeInsets.all(30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("What are you brewing today?"),
                                TextField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(FontAwesomeIcons.coffee),
                                    hoverColor: Colors.white60,
                                    focusColor: Colors.white60,
                                    fillColor: Colors.white60,
                                  ),
                                  autocorrect: true,
                                  showCursor: true,
                                  textAlign: TextAlign.center,
                                  onChanged: (value) => _productName = value,
                                  maxLength: 40,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text("Share your opinion about brew!"),
                                TextField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(FontAwesomeIcons.bookOpen),
                                    hoverColor: Colors.white60,
                                    focusColor: Colors.white60,
                                    fillColor: Colors.white60,
                                  ),
                                  onChanged: (value) => _description = value,
                                  maxLength: 199,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                RaisedButton(
                                  child: Text(
                                    "SUBMIT",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  elevation: 15,
                                  visualDensity: VisualDensity.comfortable,
                                  color: primaryBrown,
                                  disabledColor: primaryBrown,
                                  highlightColor: secondaryBrown,
                                  hoverElevation: 10,
                                  onPressed: () async {
                                    await BrewsBrain()
                                        .sendBrew(
                                          Brew(
                                            coffee: _productName,
                                            description: _description,
                                            weight: _weight,
                                            time: _time,
                                            volume: _volume,
                                            temperature: _temperature,
                                          ),
                                        )
                                        .catchError((onError) => {
                                              errorMsg =
                                                  "Ups, something goes wrong :(",
                                              setState(() {}),
                                            })
                                        .then((value) {
                                      errorMsg = null;
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MyHomePage()));
                                    });
                                  },
                                ),
                                if (errorMsg != null) Text(errorMsg),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              child: Container(
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
                child: Center(
                  child: Text(
                    "CREATE BREW!",
                  ),
                ),
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
  final int fluidVolume;
  final Function onChange;

  SliderPropertyCard({@required this.onChange, @required this.fluidVolume});

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
            child: Text("Fluid volume"),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Text(fluidVolume.toString() + "ml"),
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
                onChange(newValue.toInt());
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
  final Function onPressPlus;
  final Function onPressMinus;

  static const double width = 56.0;
  static const double height = 56.0;

  //We need to add property on pressed function

  PropertyCard(
      {this.propertyName,
      this.propertyValue,
      this.unit,
      @required this.onPressMinus,
      @required this.onPressPlus});

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
          GestureDetector(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RoundIconButton(
                  width: width,
                  height: height,
                  color: primaryBrown,
                  onPressed: onPressMinus,
                  icon: FontAwesomeIcons.minus,
                ),
                RoundIconButton(
                  width: width,
                  height: height,
                  color: primaryBrown,
                  onPressed: onPressPlus,
                  icon: FontAwesomeIcons.plus,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Timer extends StatelessWidget {
  final Duration duration;
  final Function onTimerDurationChanged;

  Timer({@required this.duration, @required this.onTimerDurationChanged});

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
              onTimerDurationChanged: (value) {
                onTimerDurationChanged(value);
              },
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
