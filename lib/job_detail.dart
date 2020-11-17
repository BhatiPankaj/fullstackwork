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
    );
  }
}
