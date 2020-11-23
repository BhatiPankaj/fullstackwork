import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class URLs{
  instagramURL() async {
    const url = 'https://www.instagram.com/pankaj.bhati412/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  linkedinURL() async {
    const url = 'https://www.linkedin.com/in/pankaj-bhati-90021a166/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

