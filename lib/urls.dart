import 'package:url_launcher/url_launcher.dart';


class URLs{
  instagramURL() async {
    const url = 'https://www.instagram.com/fullstackwork/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  linkedinURL() async {
    const url = 'https://www.linkedin.com/company/fullstackwork-jobs-internships-for-freshers/posts/?feedView=all&viewAsMember=true';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  fullStackWorkURL() async {
    const url = 'https://fullstackwork.live/#/';
    if (await canLaunch(url)) {
      await launch(url, webOnlyWindowName: '_self');
    } else {
      throw 'Could not launch $url';
    }
  }
}


