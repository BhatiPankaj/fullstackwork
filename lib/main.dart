import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    elevation: 2.0,
    clipBehavior: Clip.antiAlias,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 8.0, 25, 2.0),
          child: Text(
            "Byju",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 2.0, 8.0, 5.0),
          child: Text(
            'Business Development Associates',
            style: TextStyle(color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 5.0, 8.0, 10.0),
          child: Text(
            'Greyhound divisively hello coldly wonderfully marginally far upon excluding Greyhound divisively hello coldly wonderfully marginally far upon excluding Greyhound divisively hello coldly wonderfully marginally far upon excluding Greyhound divisively hello coldly wonderfully marginally far upon excluding',
            style: TextStyle(color: Colors.black.withOpacity(0.6)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Posted on: 04/12/2020"),
              RaisedButton(
                textColor: Colors.white,
                color: Colors.black,
                onPressed: () {
                  // Perform some action
                },
                child: const Text('View & Apply'),
                elevation: 0.0,
              )
            ],
          ),
        )
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
                onPressed: () => print("Internship pressed"),
                child: Text("Internships",
                    style: TextStyle(color: Colors.black, fontSize: 15))),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 16.0, 8.0),
            child: FlatButton(
                focusColor: Colors.blue,
                onPressed: () => print("Freshers job"),
                child: Text("Freshers Job",
                    style: TextStyle(color: Colors.black, fontSize: 15))),
          )
        ],
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black, fontSize: 27),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(child: Padding(
        padding: const EdgeInsets.fromLTRB(100, 25, 100, 50),
        child: ListView.builder(
            // itemCount: cards.length,
            itemBuilder: (context, index) {
          return card;
        }),
      )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
