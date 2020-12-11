import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:fullstackwork/get_cloud_data/job_detail.dart';
import 'package:fullstackwork/job_detail.dart';
import 'urls.dart';
import 'homepage_jobDetail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:fullstackwork/circular_progress_indicator.dart';

Map jobDescription;
dynamic id;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const int _blackPrimaryValue = 0xFF000000;

  // CollectionReference users = FirebaseFirestore.instance.collection('sdfsdfg');

  // This widget is the root of your application.
  static const MaterialColor primaryBlack = MaterialColor(
    _blackPrimaryValue,
    <int, Color>{
      50: Color(0xFF000000),
      100: Color(0xFF000000),
      200: Color(0xFF000000),
      300: Color(0xFF000000),
      400: Color(0xFF000000),
      500: Color(_blackPrimaryValue),
      600: Color(0xFF000000),
      700: Color(0xFF000000),
      800: Color(0xFF000000),
      900: Color(0xFF000000),
    },
  );

  @override
  Widget build(BuildContext context) {
    CollectionReference jobs = FirebaseFirestore.instance.collection('jobs');
    return MaterialApp(
      title: 'FullStackWork',
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: 'FullStackWork'),
        '/jobDetail': (context) => JobDetail(
              title: "FullStackWork",
              // jobDetailList: jobDescription,
            ),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: primaryBlack,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MyHomePage(title: 'TechJob'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GetJobs jobs = GetJobs();
  URLs _urLs = URLs();
  List<Map> jobDetailList = [];

  void addJobsToList(String label) {
    if (label == "Both") {
      if (jobDetailList.isNotEmpty) jobDetailList.clear();
      detailList.forEach((element) => jobDetailList.add(element));
    } else if (label == "Internship") {
      if (jobDetailList.isNotEmpty) jobDetailList.clear();
      detailList.forEach((element) =>
          element['label'] == label ? jobDetailList.add(element) : null);
    } else {
      if (jobDetailList.isNotEmpty) jobDetailList.clear();
      detailList.forEach((element) =>
          element['label'] == label ? jobDetailList.add(element) : null);
    }
  }

  bool _initialized = false;
  bool _error = false;
  bool idUpdated = false;

  // Define an async function to initialize FlutterFire
  void checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      addJobsToListFromDatabase();
    }
  }

  void addJobsToListFromDatabase() async {
    try {
      await GetJobs().addJobs();
      setState(() {
        _initialized = true;
        addJobsToList("Both");
      });
    } catch (e) {
      print(e + " Pankaj Bhati");
      setState(() {
        _error = true;
      });
    }
  }

  bool hasData = false;

  @override
  void initState() {
    checkConnectivity();
    // addJobsToListFromDatabase();
    addJobsToList("Both");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return Center(
        child: Text("Something went wrong!"),
      );
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return Center(child: CircularProgressIndicator());
    }
    if(idUpdated == true){
      // return Center(child: CircularProgressIndicator());
      return Center(child: CircularProgressIndicator());
    }
    return LayoutBuilder(builder: (context, constraints) {

      return Scaffold(
        drawer: Drawer(
          child: Container(
            padding: const EdgeInsets.fromLTRB(8, 40, 8, 8),
            color: HexColor("#252D40"),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FlatButton(
                      // hoverColor: Colors.green,
                      onPressed: () {
                        setState(() {
                          addJobsToList("Internship");
                        });
                        Navigator.of(context).pop();
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80)),
                      splashColor: Colors.green,
                      child: Text("INTERNSHIPS",
                          style: TextStyle(color: Colors.white, fontSize: 14))),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 10.0, 8.0),
                  child: FlatButton(
                      // hoverColor: Colors.green,
                      onPressed: () {
                        setState(() {
                          addJobsToList("Full Time");
                        });
                        Navigator.of(context).pop();
                      },
                      splashColor: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      child: Text("JOBS",
                          style: TextStyle(color: Colors.white, fontSize: 14))),
                ),
                // GestureDetector(
                //   onTap: () {
                //     _urLs.instagramURL();
                //   },
                //   child: Padding(
                //     padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                //     child: Image(
                //       image: AssetImage("assets/images/instagram.png"),
                //       width: 50,
                //       height: 50,
                //     ),
                //   ),
                // ),
                GestureDetector(
                  onTap: () {
                    _urLs.linkedinURL();
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 15, 10),
                    child: Image(
                      image: AssetImage("assets/images/linkedin.webp"),
                      width: 33,
                      height: 33,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: constraints.maxWidth > 499.0
            ? AppBar(
                toolbarHeight: 80,
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                        // hoverColor: Colors.green,
                        onPressed: () {
                          setState(() {
                            addJobsToList("Internship");
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        splashColor: Colors.green,
                        child: Text("INTERNSHIPS",
                            style:
                                TextStyle(color: Colors.white, fontSize: 15))),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 10.0, 8.0),
                    child: FlatButton(
                        // hoverColor: Colors.green,
                        onPressed: () {
                          setState(() {
                            addJobsToList("Full Time");
                          });
                        },
                        splashColor: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        child: Text("JOBS",
                            style:
                                TextStyle(color: Colors.white, fontSize: 15))),
                  ),
                  // SizedBox(
                  //   height: 20,
                  //   width: 80,
                  //   child: FlatButton(
                  //     onPressed: () {
                  //       _urLs.instagramURL();
                  //     },
                  //     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  //     // shape: RoundedRectangleBorder(
                  //     //     borderRadius: BorderRadius.circular(20)),
                  //     // child: Padding(
                  //     //   padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                  //       child: Image(
                  //         image: AssetImage("assets/images/instagram.png"),
                  //         width: 50,
                  //         height: 50,
                  //       ),
                  //     // ),
                  //   ),
                  // ),
                  FlatButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {
                      _urLs.linkedinURL();
                    },
                    // child: Padding(
                      // padding: const EdgeInsets.fromLTRB(0, 10, 15, 10),
                      child: Image(
                        image: AssetImage("assets/images/linkedin.webp"),
                        width: 33,
                        height: 33,
                      ),
                    // ),
                  ),
                ],
                automaticallyImplyLeading: false,
                title: GestureDetector(
                    onTap: () {
                      setState(() {
                        addJobsToList("Both");
                      });
                    },
                    child: Image.asset(
                      "assets/images/fullstackwork.jpg",
                      width: 90,
                      height: 47,
                      fit: BoxFit.cover,
                    )),
                // InkWell(
                //     onTap: () {
                //       // _urLs.techJobURL();
                //       setState(() {
                //         addJobsToList("Both");
                //       });
                //     },
                //     child: RichText(
                //       text: TextSpan(children: <TextSpan>[
                //         TextSpan(
                //             text: "${widget.title.substring(0, 9)}",
                //             style:
                //                 TextStyle(color: Colors.green, fontSize: 30)),
                //         TextSpan(
                //             text: "${widget.title.substring(9, 13)}",
                //             style: TextStyle(color: Colors.white, fontSize: 30))
                //       ]),
                //     )),
                backgroundColor: HexColor("#252D40"),
              )
            : AppBar(
                toolbarHeight: 70,
                automaticallyImplyLeading: true,
                centerTitle: true,
                title: GestureDetector(
                    onTap: () {
                      // _urLs.techJobURL();
                      setState(() {
                        addJobsToList("Both");
                      });
                    },
                    child: Image.asset(
                      "assets/images/fullstackwork.jpg",
                      width: 90,
                      height: 47,
                    )),
                // InkWell(
                //     onTap: () {
                //       setState(() {
                //         addJobsToList("Both");
                //       });
                //     },
                //     child: RichText(
                //       text: TextSpan(children: <TextSpan>[
                //         TextSpan(
                //             text: "${widget.title.substring(0, 9)}",
                //             style:
                //                 TextStyle(color: Colors.green, fontSize: 26)),
                //         TextSpan(
                //             text: "${widget.title.substring(9, 13)}",
                //             style: TextStyle(color: Colors.white, fontSize: 26))
                //       ]),
                //     )),
                backgroundColor: HexColor("#252D40"),
              ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                children: List.generate(jobDetailList.length, (index) {
                  return InkWell(
                    child: jobCard(index),
                    onTap: () {
                      id = jobDetailList[index]['id'];
                      // jobDescription = jobDetailList[index];
                      updateID(index);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => LoadingIndicator()),
                      // );
                      // CircularProgressIndicator();
                      // GetJobs().getJobByID();
                      // if(idUpdated == false)
                      //   return CircularProgressIndicator();
                      // else
                      // return CircularProgressIndicator();
                      Navigator.pushNamed(context, '/jobDetail');
                      // setState(() {
                      //   idUpdated = true;
                      // });
                    },
                    hoverColor: Colors.green[50],
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Container(
                height: 50,
                color: HexColor("#252D40"),
                child: Center(
                  child: Text(
                    "© 2020 FullStackWork",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
        // )

        // GridView.extent(
        //   padding: EdgeInsets.all(50),
        //   maxCrossAxisExtent: 450.0,
        //   crossAxisSpacing: 16.0,
        //   mainAxisSpacing: 16.0,
        //   children: List.generate(20, (index) {
        //     return InkWell(
        //       child: card,
        //       onTap: () {
        //         Navigator.pushNamed(context, '/jobDetail');
        //         // _launchURL();
        //       },
        //       hoverColor: Colors.green[50],
        //     );
        //   }),
        // ),
      );
    });
  }

  Widget jobCard(int index) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Container(
            width: 350,
            height: 360,
            child: Card(
              elevation: 4.0,
              shadowColor: Colors.black12,
              clipBehavior: Clip.antiAlias,
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4.0, 4.0, 8.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        jobDetailList[index]['label'] == "Internship"
                            ? Chip(
                                shape: RoundedRectangleBorder(),
                                label: Text(
                                  "${jobDetailList[index]['label']}",
                                  style: TextStyle(
                                      color: Colors.blue[700],
                                      fontWeight: FontWeight.w400),
                                ),
                                backgroundColor: Colors.blue[50],
                              )
                            : Chip(
                                shape: RoundedRectangleBorder(),
                                label: Text(
                                  "${jobDetailList[index]['label']}",
                                  style: TextStyle(
                                      color: Colors.green[700],
                                      fontWeight: FontWeight.w400),
                                ),
                                backgroundColor: Colors.green[50],
                              ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Image.network(
                            "${jobDetailList[index]['imgURL']}",
                            width: jobDetailList[index]['width'],
                            height: jobDetailList[index]['height'],
                          )),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 5.0),
                        child: Text(
                          '${jobDetailList[index]['title']}',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(40.0, 5.0, 40.0, 5.0),
                        child: Text(
                          '${jobDetailList[index]['skills']}',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 17),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),

                  // Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "${jobDetailList[index]['salary']}",
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "${jobDetailList[index]['date']}",
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
  void updateID(index) async{
    await GetJobs().updateID(jobDetailList[index]['id']);
    // setState(() {
    //   idUpdated = true;
    // });
  }

}
