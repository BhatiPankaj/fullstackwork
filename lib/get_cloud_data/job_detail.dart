import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fullstackwork/homepage_jobDetail.dart';

class GetJobs{

  Future addJobs() async {
    try {
      await FirebaseFirestore.instance
          .collection('jobs')
          .get()
          .then((QuerySnapshot querySnapshot) => {
        querySnapshot.docs.forEach((doc) {
          // print(doc["company"]);
          detailList.add({
            'company': doc["company"],
            'salary': doc["salary"],
            'label': doc["label"],
            'skills': doc["skills"],
            'date': doc["date"],
            'imgURL': doc["imgURL"],
            'title': doc["title"],
            'width': doc["width"],
            'height': doc["height"],
            'batch': doc["batch"],
            'description': doc["description"],
            'education': doc["education"],
            'experience': doc['experience'],
            'requirements': doc['requirements'],
            'location': doc['location']
          });
        })
      });
    } catch(e) {
      print(e + " Pankaj Bhati");
      return e;
    }
  }

}