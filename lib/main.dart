import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:brewit/my_brews.dart';
import 'package:brewit/ranking.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'brewIT',
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: TypewriterAnimatedTextKit(
                      onTap: () {
                        print("Tap Event");
                      },
                      text: [
                        'Today your coffee is.',
                        "Arabica.",
                        'Click here for more information!'
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
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: primaryBrown,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        'Brew methods',
                        style: kButtonLatoStyle,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: primaryBrown,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        'Start Brewing!',
                        style: kButtonLatoStyle,
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
                              Icon(
                                FontAwesomeIcons.hourglassHalf
                              ),
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
                              Icon(
                                  FontAwesomeIcons.water
                              ),
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
                              Icon(
                                  FontAwesomeIcons.weight
                              ),
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
                              Icon(
                                  FontAwesomeIcons.thermometerEmpty
                              ),
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
