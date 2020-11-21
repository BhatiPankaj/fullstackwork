import 'dart:html';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'job_description.dart';

class JobDetail extends StatefulWidget {
  JobDetail({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _JobDetailState createState() => _JobDetailState();
}

class _JobDetailState extends State<JobDetail> {
  JobDescription _jobDescription = JobDescription();

  // @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
  //   super.initState();
  // }
  // _afterLayout(_) {
  //   getSize();
  // }
  //
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
            LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth > 1200) {
                return _jobDescription.jobDetailWidget(
                    250.0, 250.0);
              } else if (constraints.maxWidth > 1000) {
                return _jobDescription.jobDetailWidget(
                    150, 260);
              } else if (constraints.maxWidth > 800) {
                return _jobDescription.jobDetailWidget(
                    100, 260);
              }
              else if (constraints.maxWidth > 550) {
                return _jobDescription.jobDetailWidget(
                    50, 400);
              }
              else {
                return _jobDescription.jobDetailWidget(
                    30, 510);
              }
            }),
          ]),
        ],
      ),
    );
  }
}
