import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fullstackwork/homepage_jobDetail.dart';

class GetJobs{
  
  void addJobsToList() async{
    await FirebaseFirestore.instance
        .collection('jobs')
        .get()
        .then((QuerySnapshot querySnapshot) => {
    querySnapshot.docs.forEach((doc) {
      HomePageJobDetail().detailList.add({
        'company': doc['company'],
        'salary': doc['salary'],
        'label': doc['label'],
        'skills': doc['skills'],
        'date': doc['date'],
        'asset': doc['imgURL'],
        'title': doc['title'],
        'width': doc['width'],
        'height': doc['height']
      });
    })
    });
  }

}