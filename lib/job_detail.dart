import 'dart:html';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fullstackwork/urls.dart';
import 'job_description.dart';
import 'package:hexcolor/hexcolor.dart';

class JobDetail extends StatefulWidget {
  JobDetail({Key key, this.title, this.jobDetailList}) : super(key: key);

  final String title;
  final Map jobDetailList;

  @override
  _JobDetailState createState() => _JobDetailState();
}

class _JobDetailState extends State<JobDetail> {
  JobDescription _jobDescription = JobDescription();
  URLs _urLs = URLs();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: GestureDetector(
            onTap: () {
              _urLs.fullStackWorkURL();
            },
            child: Image.asset(
              "assets/images/fullstackwork.jpg",
              width: 90,
              height: 47,
            )),

        // InkWell(
        //   onTap: () {
        //     _urLs.fullStackWorkURL();
        //   },
        //   child: RichText(
        //     text: TextSpan(children: <TextSpan>[
        //       TextSpan(
        //           text: "${widget.title.substring(0, 9)}",
        //           style: TextStyle(color: Colors.green, fontSize: 27)),
        //       TextSpan(
        //           text: "${widget.title.substring(9, 13)}",
        //           style: TextStyle(color: Colors.white, fontSize: 27))
        //     ]),
        //   ),
        // ),
        backgroundColor: HexColor("#252D40"),
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
                      child: Image.network(
                        widget.jobDetailList['imgURL'],
                        width: widget.jobDetailList['width'],
                        height: widget.jobDetailList['height'],
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
                          widget.jobDetailList['title'],
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 26),
                        ),
                      ),
                      Text(widget.jobDetailList['company'],
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16)),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 16, 35, 4),
                            child: Text(
                              widget.jobDetailList['salary'],
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
                              widget.jobDetailList['location'],
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
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
                                child: Text(widget.jobDetailList['label'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                        color: Colors.black54)),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                child: Text(widget.jobDetailList['experience'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                        color: Colors.black54)),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                child: Text(widget.jobDetailList['batch'],
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
                return _jobDescription.jobDetailWidget(250.0, 250.0, widget.jobDetailList);
              } else if (constraints.maxWidth > 1000) {
                return _jobDescription.jobDetailWidget(150, 260, widget.jobDetailList);
              } else if (constraints.maxWidth > 800) {
                return _jobDescription.jobDetailWidget(100, 260, widget.jobDetailList);
              } else if (constraints.maxWidth > 550) {
                return _jobDescription.jobDetailWidget(50, 400, widget.jobDetailList);
              } else {
                return _jobDescription.jobDetailWidget(30, 510, widget.jobDetailList);
              }
            }),
          ]),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 2, 20, 2),
            color: HexColor("#252D40"),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "© 2020 FullStackWork",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Row(
                  children: [
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
