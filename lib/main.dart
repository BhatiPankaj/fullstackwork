import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:techjob/job_detail.dart';
import 'urls.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const int _blackPrimaryValue = 0xFF000000;

  // This widget is the root of your application.
  static const MaterialColor primaryBlack = MaterialColor(
    _blackPrimaryValue,
    <int, Color>{
      50: Color(0xFF000000),
      100: Color(0xFF000000),
      200: Color(0xFF000000),
      300: Color(0xFF000000),
      400: Color(0xFF000000),
      500: Color(_blackPrimaryValue),
      600: Color(0xFF000000),
      700: Color(0xFF000000),
      800: Color(0xFF000000),
      900: Color(0xFF000000),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechJob',
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: 'TechJob'),
        '/jobDetail': (context) => JobDetail(
              title: 'TechJob',
            )
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: primaryBlack,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MyHomePage(title: 'TechJob'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  URLs _urLs = URLs();

  final card = Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Container(
          width: 350,
          height: 360,
          child: Card(
            elevation: 4.0,
            shadowColor: Colors.black12,
            clipBehavior: Clip.antiAlias,
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(4.0, 4.0, 8.0, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Chip(
                        shape: RoundedRectangleBorder(),
                        label: Text(
                          "Internship",
                          style: TextStyle(
                              color: Colors.blue[700],
                              fontWeight: FontWeight.w400),
                        ),
                        backgroundColor: Colors.blue[50],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Image(
                        image: AssetImage("assets/images/google.jpg"),
                        width: 80,
                        height: 80,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 5.0),
                      child: Text(
                        'Web Designing',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 17),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40.0, 5.0, 40.0, 5.0),
                      child: Text(
                        'CSS3, HTML5, Javascript, Bootstrap, Jquery',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6), fontSize: 17),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),

                // Spacer(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "\$6K - \$9K",
                        style: TextStyle(
                            color: Colors.orange, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "25/04/20",
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )));

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollbarController = ScrollController();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
                // hoverColor: Colors.green,
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80)),
                splashColor: Colors.green,
                child: Text("INTERNSHIPS",
                    style: TextStyle(color: Colors.white, fontSize: 15))),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 10.0, 8.0),
            child: FlatButton(
                // hoverColor: Colors.green,
                onPressed: () {},
                splashColor: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                child: Text("JOBS",
                    style: TextStyle(color: Colors.white, fontSize: 15))),
          ),
          InkWell(
            onTap: () {
              _urLs.instagramURL();
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
              child: Image(
                image: AssetImage("assets/images/instagram.png"),
                width: 50,
                height: 50,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              _urLs.linkedinURL();
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 15, 10),
              child: Image(
                image: AssetImage("assets/images/linkedin.webp"),
                width: 33,
                height: 33,
              ),
            ),
          ),
        ],
        automaticallyImplyLeading: false,
        title: InkWell(
            onTap: () {
              _urLs.linkedinURL();
            },
            child: RichText(
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: "${widget.title.substring(0, 4)}",
                    style: TextStyle(color: Colors.green, fontSize: 35)),
                TextSpan(
                    text: "${widget.title.substring(4, 7)}",
                    style: TextStyle(color: Colors.white, fontSize: 35))
              ]),
            )),
        backgroundColor: HexColor("#252D40"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              children: List.generate(20, (index) {
                return InkWell(
                  child: card,
                  onTap: () {
                    Navigator.pushNamed(context, '/jobDetail');
                    // _launchURL();
                  },
                  hoverColor: Colors.green[50],
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Container(
              height: 50,
              color: HexColor("#252D40"),
              child: Center(
                child: Text(
                  "© 2020 TechJob",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
      // )

      // GridView.extent(
      //   padding: EdgeInsets.all(50),
      //   maxCrossAxisExtent: 450.0,
      //   crossAxisSpacing: 16.0,
      //   mainAxisSpacing: 16.0,
      //   children: List.generate(20, (index) {
      //     return InkWell(
      //       child: card,
      //       onTap: () {
      //         Navigator.pushNamed(context, '/jobDetail');
      //         // _launchURL();
      //       },
      //       hoverColor: Colors.green[50],
      //     );
      //   }),
      // ),
    );
  }
}
