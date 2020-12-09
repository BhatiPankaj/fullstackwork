import 'dart:async';

import 'package:flutter/material.dart';

class LoadingIndicator extends StatefulWidget {
  @override
  _LoadingIndicatorState createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator> {

  @override
  void initState() {
    startTimer();  //start the timer on loading
    super.initState();
  }

  bool isLoading = true;
  void startTimer() {
    Timer.periodic(const Duration(seconds: 2), (t) {
      setState(() {
        isLoading = false; //set loading to false
      });
      t.cancel(); //stops the timer
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == false ? Navigator.popAndPushNamed(context, '/jobDetail') : Center(child: CircularProgressIndicator());;
  }
}

