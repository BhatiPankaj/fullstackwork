import 'dart:html';

import 'package:flutter/material.dart';

final requirements = [
  "You must have a minimum of 0.6- 1 year of previous experience in Flutter development.",
  "Experience building and deploying a moderately complex Flutter app",
  "Translating UI/UX designs into code",
  "Firebase",
  "Advanced debugging / testing / optimization",
  "Knowledge of Location Services, Maps, and other common Android/IOS libraries",
  "Familiarity with 3rd party libraries, RESTful API s and its integration",
  "Should have strong experience with any of the state management solutions like Bloc, Provider.",
  "You should have worked on multiple Flutter projects.",
  "You should have very Good Logical and Analytical Skills",
];
final skills  = ["CSS", "HTML", "Flutter", "JAVA", "Dart", "Python"];

class JobDescription {
  Widget requirement(int index) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(16, 4, 4, 2),
        child: Text(
          ". " + "${requirements[index]}",
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),
        ));
  }

  Widget jobDetailWidget(double width, double height) {
    return Padding(
      padding: EdgeInsets.fromLTRB(width, height, width, height/3),
      child: Card(
        elevation: 2.0,
        child: Container(
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
                      fontSize: 26,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "As a Flutter Developer, you will create multi-platform apps for iOS and Android using Google's Flutter development framework. The primary focus will be on creating new experiences. You will additionally work on innovative new app projects. \n\nDeep experience contributing to and managing high-scale production mobile apps.",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
                child: Text("Responsibilities and Requirements",
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 0, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(requirements.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(6, 3, 0, 3),
                      child: Text(requirements[index]),
                    );
                  }),
                )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Skills",
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 17)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(17, 2, 0, 8),
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: List.generate(skills.length, (index) {
                    return Chip(
                      elevation: 1.0,
                      shadowColor: Colors.black87,
                      backgroundColor: Colors.white,
                      label: Text(skills[index]),
                    );
                  })
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Education",
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 17)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(17, 0, 0, 8),
                child: Text(
                  "Any Graduate in Any Specialization, Graduation Not Required",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 30, 0, 10),
                child: RaisedButton(
                  padding: const EdgeInsets.all(20.0),
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  onPressed: () {},
                  hoverElevation: 10.0,
                  child: Text(
                    "Apply for this job",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
