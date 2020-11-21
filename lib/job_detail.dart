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
  final requirements = [
    "Pankaj",
    "Bhati",
    "Pankaj",
    "Bhati",
    "Pankaj",
    "Bhati",
    "Pankaj",
    "Bhati",
    "Pankaj",
    "Bhati",
    "Pankaj",
    "Bhati",
    "Pankaj",
    "Bhati",
    "Pankaj",
    "Bhati",
    "Pankaj",
    "Bhati",
    "Pankaj",
    "Bhati",
    "Pankaj",
    "Bhati",
    "Pankaj",
    "Bhati",
    "Pankaj",
    "Bhati",
    "Pankaj",
    "Bhati",
  ];

  Widget requirement(int index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 4, 2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(40))),
            ),
          ),
          Text("${requirements[index]}")
        ],
      ),
    );
  }
  // @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
  //   super.initState();
  // }
  // _afterLayout(_) {
  //   getSize();
  // }
  //
  double getSize(){


  }

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
              padding: const EdgeInsets.fromLTRB(50, 70, 30, 80),
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
                            padding: const EdgeInsets.fromLTRB(0, 16, 35, 4),
                            child: Text(
                              "\$50k - \$70k",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.green),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 16, 3, 2),
                            child: Icon(Icons.location_on_outlined,
                                size: 16, color: Colors.green),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 16, 0, 4),
                            child: Text(
                              "Surat",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.green),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 6, 7, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.black12,
                          height: 120,
                          width: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 2, 40, 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                child: Text("Availability",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                        color: Colors.black54)),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                child: Text("Experience",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                        color: Colors.black54)),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                child: Text("Batch",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                        color: Colors.black54)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 2, 14, 8),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                child: Text("Full Time",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                        color: Colors.black54)),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                child: Text("5 Years",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                        color: Colors.black54)),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                child: Text("2019, 2020",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                        color: Colors.black54)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(250.0),
              child: Card(
                elevation: 2.0,
                child: Container(
                  // height: 38.0 * requirements.length,
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(30.0),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Job Description",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "As a Flutter Developer, you will create multi-platform apps for iOS and Android using Google's Flutter development framework. The primary focus will be on creating new experiences. You will additionally work on innovative new app projects. \n\nDeep experience contributing to and managing high-scale production mobile apps."),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: Text("Responsibilities/Requirements",
                            style: TextStyle(fontWeight: FontWeight.w500)),
                      ),
                      Container(
                        height: 25.5 * requirements.length,
                        child: ListView.builder(
                          itemCount: requirements.length,
                          itemBuilder: (BuildContext context, int index) {
                            return requirement(index);
                          },
                        ),
                      ),
                      Text("Skills"),
                    ],
                  ),
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
