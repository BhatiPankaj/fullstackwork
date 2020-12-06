import 'dart:html';

import 'package:flutter/material.dart';

class JobDescription {
  Widget jobDetailWidget(double width, double height, Map jobDescription) {
    final List skills = jobDescription['skills'].toString().split(',');
    final List description =
        jobDescription['description'].toString().split('x-x');
    final List requirements =
        jobDescription['requirements'].toString().split('x-x');
    return Padding(
      padding: EdgeInsets.fromLTRB(width, height, width, height / 3),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(description.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                        child: Text(description[index]),
                      );
                    }),
                  )),
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
                  )),
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
                    })),
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
