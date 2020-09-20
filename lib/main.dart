import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:brewit/screens/my_brews.dart';
import 'package:brewit/screens/new_brew.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart' as luncher;

import 'components/bottom_navigation_bar_configured.dart';
import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: primaryBrown,
        backgroundColor: backgroundLight,
        scaffoldBackgroundColor: backgroundLight,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Brewit',
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipPath(
              clipper: HomeClipper(),
              child: GestureDetector(
                onTap: () async {
                  const url = 'https://brewit.online';
                  await _launchInBrowser(url);
                },
                child: Container(
                  height: 175,
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
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: TypewriterAnimatedTextKit(
                            onTap: () {
                              print("Tap Event");
                            },
                            text: [
                              'Today your coffee is.',
                              "Arabica.",
                              'Click here for more!'
                            ],
                            textStyle: coffeeOfTheDayStyle,
                            textAlign: TextAlign.start,
                            alignment: AlignmentDirectional.topStart,
                            // or Alignment.topLeft
                            speed: Duration(
                              milliseconds: 120,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(15),
                          child: SvgPicture.asset('svgs/cup-of-coffee.svg'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyBrews()),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomRight,
                              colors: [
                                primaryBrown,
                                secondaryBrown,
                              ],
                            ),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            'My brews',
                            style: kButtonLatoStyle,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NewBrew()),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomRight,
                              colors: [
                                primaryBrown,
                                secondaryBrown,
                              ],
                            ),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            'Start Brewing!',
                            style: kButtonLatoStyle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Card(
                margin: EdgeInsets.all(20.0),
                elevation: 6.0,
                color: primaryBrown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Container(
                  margin: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Last Brew.',
                        style: kButtonLatoStyle,
                      ),
                      Divider(
                        color: backgroundLight,
                        height: 15.0,
                        thickness: 3,
                        endIndent: 120,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Type: Indica',
                              style: kLastBrewLatoStyle,
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              children: <Widget>[
                                Icon(FontAwesomeIcons.hourglassHalf),
                                Text(
                                  '  3 min 40 sec',
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
                                  '  300 ml',
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
                                  '  18 gram',
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
                                  '  90 °C',
                                  style: kLastBrewLatoStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
//                    Image.asset(
//                      'images/brewing1st.jpg',
//                    )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar:
            BottomNavigationBarConfigured(selectedIndex: _selectedIndex),
      ),
    );
  }

  Future<void> _launchInBrowser(String url) async {
    if (await luncher.canLaunch(url)) {
      await luncher.launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}

class HomeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
