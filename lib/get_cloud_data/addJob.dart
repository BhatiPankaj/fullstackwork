import 'package:cloud_firestore/cloud_firestore.dart';

class AddJob {
  final String apply;
  final String batch;
  final String company;
  final String date;
  final String description;
  final String education;
  final String experience;
  final int height;
  final String imgURL;
  final String label;
  final String location;
  final String requirements;
  final String salary;
  final String skills;
  final int sort;
  final String title;
  final int width;

  AddJob(
      this.apply,
      this.batch,
      this.company,
      this.date,
      this.description,
      this.education,
      this.experience,
      this.height,
      this.imgURL,
      this.label,
      this.location,
      this.requirements,
      this.salary,
      this.skills,
      this.sort,
      this.title,
      this.width);

  // Create a CollectionReference called users that references the firestore collection
  CollectionReference jobs = FirebaseFirestore.instance.collection('jobs');

  void printt() {
    print(
        "$apply $batch $company $date $description $education $experience $height  $imgURL  $label  $location  $requirements  $salary  $skills  $sort  $title  $width");
  }

// Future<void> addUser() {
//   // Call the user's CollectionReference to add a new user
//   return jobs
//       .add({
//     'company': company,
//     'salary': salary,
//     'label': label,
//     'skills': skills,
//     'date': date,
//     'imgURL': imgURL,
//     'title': title,
//     'width': width,
//     'height': height,
//     'batch': batch,
//     'description': description,
//     'education': education,
//     'experience': experience,
//     'requirements': requirements,
//     'location': location,
//     'apply': apply,
//       })
//       .then((value) => print("User Added"))
//       .catchError((error) => print("Failed to add user: $error"));
// }
}
