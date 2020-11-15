import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: primaryBlack,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'TechJob'),
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
  final card = Card(
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
              Chip(shape: RoundedRectangleBorder(), label: Text("Internship", style: TextStyle(color: Colors.blue[700], fontWeight: FontWeight.w400), ), backgroundColor: Colors.blue[50],),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Image(image: AssetImage("assets/images/google.jpg"), width: 80, height: 80,),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,10.0, 0, 5.0),
              child: Text(
                'Web Designing',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 17),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40.0, 5.0, 40.0, 5.0),
              child: Text(
                'CSS3, HTML5, Javascript, Bootstrap, Jquery',
                style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 17),
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
              Text("\$6K - \$9K", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.w500),),
              Text("25/04/20", style: TextStyle(color: Colors.green, fontWeight: FontWeight.w500),),
            ],
          ),
        )
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollbarController = ScrollController();
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
                hoverColor: Colors.green,
                onPressed: () {},
                child: Text("INTERNSHIPS",
                    style: TextStyle(color: Colors.white, fontSize: 15))),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 16.0, 8.0),
            child: FlatButton(
                hoverColor: Colors.green,
                onPressed: () {},
                child: Text("JOBS",
                    style: TextStyle(color: Colors.white, fontSize: 15))),
          )
        ],
        title: RichText(
          text: TextSpan(children: <TextSpan>[
            TextSpan(
                text: "${widget.title.substring(0, 4)}",
                style: TextStyle(color: Colors.green, fontSize: 27)),
            TextSpan(
                text: "${widget.title.substring(4, 7)}",
                style: TextStyle(color: Colors.white, fontSize: 27))
          ]),
        ),
        backgroundColor: HexColor("#252D40"),
      ),
      body: GridView.extent(
        padding: EdgeInsets.all(50),
        maxCrossAxisExtent: 450.0,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(100, (index) {
          return InkWell(child: card, onTap: (){}, hoverColor: Colors.green[50],);
        }),
      ),
      // Center(child: Padding(
      //   padding: const EdgeInsets.fromLTRB(100, 5, 100, 10),
      //   child: Scrollbar(
      //     isAlwaysShown: true,
      //     controller: _scrollbarController,
      //     child: ListView.builder(
      //       controller: _scrollbarController,
      //         itemCount: 15,
      //         itemBuilder: (context, index) {
      //       return card;
      //     }),
      //   ),
      // )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
