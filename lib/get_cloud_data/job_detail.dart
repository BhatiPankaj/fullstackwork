import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fullstackwork/homepage_jobDetail.dart';
import 'package:fullstackwork/main.dart';

class GetJobs{

  Future addJobs() async {
    try {
      await FirebaseFirestore.instance
          .collection('jobs')
          .orderBy("sort", descending: true)
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
            'location': doc['location'],
            'apply': doc['apply'],
            'id': doc.id
          });
        })
      });
    } catch(e) {
      print(e);
      return e;
    }
  }

  Future<Map> getJobByID() async {

    Map data;
    try {
      await FirebaseFirestore.instance
          .collection('jobs').doc(id.toString()).get().then((DocumentSnapshot documentSnapshot) => {data = documentSnapshot.data()});
      return data;
    } catch(e) {
      print(e + " Pankaj Bhati");
      return e;
    }
  }



  Future<void> updateID( dynamic id) async{
     try {
       await FirebaseFirestore.instance.collection('id')
           .doc('id')
           .update({'id': id})
           .then((value) => print("id Updated"));
     } catch(e) {
       print("Failed to update user: $e");
     }
  }

}