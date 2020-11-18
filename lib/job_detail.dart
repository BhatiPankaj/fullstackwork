import 'dart:html';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobDetail extends StatefulWidget {
  JobDetail({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _JobDetailState createState() => _JobDetailState();
}

class _JobDetailState extends State<JobDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: RichText(
          text: TextSpan(children: <TextSpan>[
            TextSpan(
                text: "${widget.title.substring(0, 4)}",
                style: TextStyle(color: Colors.green, fontSize: 27)),
            TextSpan(
                text: "${widget.title.substring(4, 7)}",
                style: TextStyle(color: Colors.black, fontSize: 27))
          ]),
        ),
        backgroundColor: Colors.white,
        elevation: 2.0,
      ),
      body: ListView(
        children: [
          Stack(children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(50, 50, 30, 0),
              width: 1800,
              height: 300,
              color: Color(0x1F000000).withOpacity(0.03),
              child: Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                    child: Card(
                      shadowColor: Colors.black26,
                      elevation: 4.0,
                      child: Image(
                        image: AssetImage("assets/images/google.jpg"),
                        width: 140,
                        height: 140,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 17, 20, 6),
                        child: Text(
                          "Front End Developer",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 26),
                        ),
                      ),
                      Text("Google",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16)),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 16, 40, 4),
                            child: Text("\$50k - \$70k", style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16, color: Colors.green),),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 16, 3, 2),
                            child: Icon(Icons.location_on_outlined, size: 16, color: Colors.blue),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 16, 0, 4),
                            child: Text("Surat", style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 16, color: Colors.blue),),
                          ),
                        ],
                      )
                    ],
                  ),
                  VerticalDivider(color: Colors.black,width: 10,),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(250.0),
              child: Card(
                elevation: 2.0,
                child: Container(
                  color: Colors.white,
                  height: 2000,
                ),
              ),
            )
          ]),
        ],
      ),
      // ListView.builder(
      //   // Let the ListView know how many items it needs to build.
      //   itemCount: 2,
      //   // Provide a builder function. This is where the magic happens.
      //   // Convert each item into a widget based on the type of item it is.
      //   itemBuilder: (context, index) {
      //
      //   },
      // );
    );
  }
}
