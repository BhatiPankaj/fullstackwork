// import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:fullstackwork/get_cloud_data/addJob.dart';

// import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';

class AdminPanel extends StatelessWidget {
  const AdminPanel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: GestureDetector(
            onTap: () {
              // _urLs.techJobURL();
              // setState(() {
              //   addJobsToList("Both");
              // });
            },
            child: Image.asset(
              "assets/images/fullstackwork.jpg",
              width: 90,
              height: 47,
            )),
        backgroundColor: HexColor("#252D40"),
      ),
      body: const AddJobForm(),
    );
  }
}

class AddJobForm extends StatefulWidget {
  const AddJobForm({Key key}) : super(key: key);

  @override
  AddJobFormState createState() => AddJobFormState();
}

Map jobs = {};
List<String> _descriptionList = [];
List<String> _requirementsList = [];
String _description = "";
String _requirements = "";
GlobalKey<FormFieldState> _applyKey = GlobalKey<FormFieldState>();
GlobalKey<FormFieldState> _batchKey = GlobalKey<FormFieldState>();
GlobalKey<FormFieldState> _companyKey = GlobalKey<FormFieldState>();
GlobalKey<FormFieldState> _dateKey = GlobalKey<FormFieldState>();
// GlobalKey<FormFieldState> _descriptionKey = GlobalKey<FormFieldState>();
GlobalKey<FormFieldState> _educationKey = GlobalKey<FormFieldState>();
GlobalKey<FormFieldState> _experienceKey = GlobalKey<FormFieldState>();
GlobalKey<FormFieldState> _heightKey = GlobalKey<FormFieldState>();
GlobalKey<FormFieldState> _imgURLKey = GlobalKey<FormFieldState>();
GlobalKey<FormFieldState> _labelKey = GlobalKey<FormFieldState>();
GlobalKey<FormFieldState> _locationKey = GlobalKey<FormFieldState>();
// GlobalKey<FormFieldState> _requirementsKey = GlobalKey<FormFieldState>();
GlobalKey<FormFieldState> _salaryKey = GlobalKey<FormFieldState>();
GlobalKey<FormFieldState> _skillsKey = GlobalKey<FormFieldState>();
GlobalKey<FormFieldState> _sortKey = GlobalKey<FormFieldState>();
GlobalKey<FormFieldState> _titleKey = GlobalKey<FormFieldState>();
GlobalKey<FormFieldState> _widthKey = GlobalKey<FormFieldState>();



// String _validate(String value) {
//   if (value.isEmpty) {
//     return "Should not be empty";
//   }
//   return null;
// }

class AddJobFormState extends State<AddJobForm> {
  List _descriptionWidgetList = [
    TextFormField(
      // key: _descriptionKey,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: "description",
      ),
      maxLines: 2,
      onFieldSubmitted: (value) {
        _descriptionList.add(value);
        // _descriptionKey.currentState.validate();
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value.isEmpty) return "should not be empty";
        if (_description == "") return "not saved";
        return null;
      },
    ),
    SizedBox(
      height: 6,
    ),
  ];

  List _requirementsWidgetList = [
    TextFormField(
      // key: _requirementsKey,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: "requirements",
      ),
      maxLines: 2,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onFieldSubmitted: (value) {
        _requirementsList.add(value);
        // _requirementsKey.currentState.validate();
      },
      validator: (value) {
        if (value.isEmpty) return "should not be empty";
        if (_requirements == "") return "not saved";
        return null;
      },
    ),
    SizedBox(
      height: 6,
    ),
  ];

  void showInSnackBar(String value) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(value),
    ));
  }

  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void showDialogForJobUpdate(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Job Data"),
            content: Container(
              height: 500,
              width: 500,
              child: ListView(
                children: [
                  Text(
                      "{\n  apply : ${jobs['apply']}\n\n  batch : ${jobs['batch']}\n\n  company : ${jobs['company']}\n\n  date : ${jobs['date']}\n\n  description : ${jobs['description']}\n\n  education : ${jobs['education']}\n\n  experience : ${jobs['experience']}\n\n  height : ${jobs['height']}\n\n  imgURL : ${jobs['imgURL']}\n\n  label : ${jobs['label']}\n\n  location : ${jobs['location']}\n\n  requirements : ${jobs['requirements']}\n\n  salary : ${jobs['salary']}\n\n  skills : ${jobs['skills']}\n\n  sort : ${jobs['sort']}\n\n  title : ${jobs['title']}\n\n  width : ${jobs['width']}\n}")
                ],
              ),
            ),
            actions: [
              RaisedButton(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: Colors.green,
              ),
              RaisedButton(
                child: Text("Update"),
                color: Colors.green,
                onPressed: () {
                  // print(jobs);
                  // print(jobs['height'].runtimeType);
                  AddJob(jobs['apply'], jobs['batch'], jobs['company'], jobs['date'], jobs['description'], jobs['education'], jobs['experience'], jobs['height'], jobs['imgURL'], jobs['label'], jobs['location'], jobs['requirements'], jobs['salary'], jobs['skills'], jobs['sort'], jobs['title'], jobs['width']).printt();
                  _formKey.currentState.reset();
                  Navigator.of(context).pop();
                  jobs.clear();
                  _descriptionList.clear();
                  _requirementsList.clear();
                  _description = "";
                  _requirements = "";
                },
              )
            ],
          );
        });
  }

  void _handleSubmitted(BuildContext context) {
    final form = _formKey.currentState;
    if (!form.validate()) {
      _autoValidateMode =
          AutovalidateMode.always; // Start validating on every change.
      showInSnackBar(
        "Any field should not be empty",
      );
    } else {
      // form.save();
      jobs.addAll({'description': _description, 'requirements': _requirements});
      showDialogForJobUpdate(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    const sizedBoxSpace = SizedBox(height: 24);

    return Scaffold(
      body: Form(
        key: _formKey,
        autovalidateMode: _autoValidateMode,
        child: Scrollbar(
          child: SingleChildScrollView(
            dragStartBehavior: DragStartBehavior.down,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                sizedBoxSpace,
                TextFormField(
                  key: _applyKey,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "apply link",
                  ),
                  maxLines: 1,
                  onFieldSubmitted: (value) {
                    jobs.addAll({'apply': value});
                    _applyKey.currentState.validate();
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // onSaved: (value) {
                  //   print(value);
                  // },
                  validator: (value) {
                    if (value.isEmpty) return "should not be empty";
                    if (jobs['apply'] != value) return "not saved";
                    return null;
                  },
                ),
                sizedBoxSpace,
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        key: _batchKey,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "batch",
                        ),
                        maxLines: 1,
                        onFieldSubmitted: (value) {
                          jobs.addAll({'batch': value});
                          _batchKey.currentState.validate();
                        },
                        onSaved: (value) {
                          // jobs[0].addAll({'batch': value});
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value.isEmpty) return "should not be empty";
                          if (jobs['batch'] != value) return "not saved";
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        key: _companyKey,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "company",
                        ),
                        maxLines: 1,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onFieldSubmitted: (value) {
                          jobs.addAll({'company': value});
                          _companyKey.currentState.validate();
                        },
                        onSaved: (value) {},
                        validator: (value) {
                          if (value.isEmpty) return "should not be empty";
                          if (jobs['company'] != value) return "not saved";
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                sizedBoxSpace,
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        key: _dateKey,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "date",
                        ),
                        maxLines: 1,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onFieldSubmitted: (value) {
                          jobs.addAll({'date': value});
                          _dateKey.currentState.validate();
                        },
                        onSaved: (value) {},
                        validator: (value) {
                          if (value.isEmpty) return "should not be empty";
                          if (jobs['date'] != value) return "not saved";
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        key: _sortKey,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "sort",
                        ),
                        maxLines: 1,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onFieldSubmitted: (value) {
                          jobs.addAll({'sort': int.parse(value)});
                          _sortKey.currentState.validate();
                        },
                        onSaved: (value) {},
                        validator: (value) {
                          if (value.isEmpty) return "should not be empty";
                          if (jobs['sort'] != int.parse(value)) return "not saved";
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                sizedBoxSpace,
                TextFormField(
                  key: _educationKey,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "education",
                  ),
                  maxLines: 1,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onFieldSubmitted: (value) {
                    jobs.addAll({'education': value});
                    _educationKey.currentState.validate();
                  },
                  onSaved: (value) {},
                  validator: (value) {
                    if (value.isEmpty) return "should not be empty";
                    if (jobs['education'] != value) return "not saved";
                    return null;
                  },
                ),
                sizedBoxSpace,
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        key: _heightKey,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "height",
                        ),
                        maxLines: 1,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onFieldSubmitted: (value) {
                          jobs.addAll({'height': int.parse(value)});
                          _heightKey.currentState.validate();
                        },
                        onSaved: (value) {},
                        validator: (value) {
                          if (value.isEmpty) return "should not be empty";
                          if (jobs['height'] != int.parse(value)) return "not saved";
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        key: _widthKey,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "width",
                        ),
                        maxLines: 1,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onFieldSubmitted: (value) {
                          jobs.addAll({'width': int.parse(value)});
                          _widthKey.currentState.validate();
                        },
                        onSaved: (value) {},
                        validator: (value) {
                          if (value.isEmpty) return "should not be empty";
                          if (jobs['width'] != int.parse(value)) return "not saved";
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                sizedBoxSpace,
                TextFormField(
                  key: _imgURLKey,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "imgURL",
                  ),
                  maxLines: 1,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onFieldSubmitted: (value) {
                    jobs.addAll({'imgURL': value});
                    _imgURLKey.currentState.validate();
                  },
                  onSaved: (value) {},
                  validator: (value) {
                    if (value.isEmpty) return "should not be empty";
                    if (jobs['imgURL'] != value) return "not saved";
                    return null;
                  },
                ),
                sizedBoxSpace,
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        key: _labelKey,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "label",
                        ),
                        maxLines: 1,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onFieldSubmitted: (value) {
                          jobs.addAll({'label': value});
                          _labelKey.currentState.validate();
                        },
                        onSaved: (value) {},
                        validator: (value) {
                          if (value.isEmpty) return "should not be empty";
                          if (jobs['label'] != value) return "not saved";
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        key: _titleKey,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "title",
                        ),
                        maxLines: 1,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onFieldSubmitted: (value) {
                          jobs.addAll({'title': value});
                          _titleKey.currentState.validate();
                        },
                        onSaved: (value) {},
                        validator: (value) {
                          if (value.isEmpty) return "should not be empty";
                          if (jobs['title'] != value) return "not saved";
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                sizedBoxSpace,
                TextFormField(
                  key: _locationKey,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "location",
                  ),
                  maxLines: 1,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onFieldSubmitted: (value) {
                    jobs.addAll({'location': value});
                    _locationKey.currentState.validate();
                  },
                  onSaved: (value) {},
                  validator: (value) {
                    if (value.isEmpty) return "should not be empty";
                    if (jobs['location'] != value) return "not saved";
                    return null;
                  },
                ),
                sizedBoxSpace,
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        key: _experienceKey,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "experience",
                        ),
                        maxLines: 1,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onFieldSubmitted: (value) {
                          jobs.addAll({'experience': value});
                          _experienceKey.currentState.validate();
                        },
                        onSaved: (value) {},
                        validator: (value) {
                          if (value.isEmpty) return "should not be empty";
                          if (jobs['experience'] != value)
                            return "not saved";
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        key: _salaryKey,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "salary",
                        ),
                        maxLines: 1,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onFieldSubmitted: (value) {
                          jobs.addAll({'salary': value});
                          _salaryKey.currentState.validate();
                        },
                        onSaved: (value) {},
                        validator: (value) {
                          if (value.isEmpty) return "should not be empty";
                          if (jobs['salary'] != value) return "not saved";
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                sizedBoxSpace,
                TextFormField(
                  key: _skillsKey,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "skills",
                  ),
                  maxLines: 1,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onFieldSubmitted: (value) {
                    jobs.addAll({'skills': value});
                    _skillsKey.currentState.validate();
                  },
                  onSaved: (value) {},
                  validator: (value) {
                    if (value.isEmpty) return "should not be empty";
                    if (jobs['skills'] != value) return "not saved";
                    return null;
                  },
                ),
                sizedBoxSpace,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children:
                      List.generate(_descriptionWidgetList.length, (index) {
                    return _descriptionWidgetList[index];
                  }),
                ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                        color: Colors.green,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 17,
                        ),
                        onPressed: () {
                          _descriptionWidgetList.addAll([
                            TextFormField(
                              // key: _descriptionKey,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: "description",
                              ),
                              maxLines: 2,
                              onFieldSubmitted: (value) {
                                _descriptionList.add(value);
                                // _descriptionKey.currentState.validate();
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              onSaved: (value) {},
                              validator: (value) {
                                if (value.isEmpty) return "should not be empty";
                                if (_description == "") return "not saved";
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 6,
                            ),
                          ]);
                          setState(() {});
                        },
                        shape: CircleBorder()),
                    if (_descriptionWidgetList.length > 2)
                      FlatButton(
                          color: Colors.red,
                          child: Icon(
                            Icons.clear,
                            color: Colors.white,
                            size: 17,
                          ),
                          onPressed: () {
                            // if (_descriptionWidgetList.length / 2 ==
                            //     _descriptionList.length)
                            //   _descriptionList.removeLast();
                            _descriptionWidgetList.removeRange(
                                _descriptionWidgetList.length - 2,
                                _descriptionWidgetList.length);
                            print(
                                "${_descriptionList.length}  ${_descriptionWidgetList.length}");
                            int descriptionListLength = _descriptionList.length;
                            for (int i = 0;
                                i <
                                    (descriptionListLength -
                                        (_descriptionWidgetList.length / 2));
                                i++) _descriptionList.removeLast();
                            print(_descriptionList.toString());
                            setState(() {});
                          },
                          shape: CircleBorder()),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children:
                      List.generate(_requirementsWidgetList.length, (index) {
                    return _requirementsWidgetList[index];
                  }),
                ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                        color: Colors.green,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 17,
                        ),
                        onPressed: () {
                          _requirementsWidgetList.addAll([
                            TextFormField(
                              // key: _applyKey,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: "requirements",
                              ),
                              maxLines: 2,
                              onFieldSubmitted: (value) {
                                _requirementsList.add(value);
                                // _applyKey.currentState.validate();
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              onSaved: (value) {},
                              validator: (value) {
                                if (value.isEmpty) return "should not be empty";
                                if (_requirements == "") return "not saved";
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 6,
                            ),
                          ]);
                          setState(() {});
                        },
                        shape: CircleBorder()),
                    if (_requirementsWidgetList.length > 2)
                      FlatButton(
                          color: Colors.red,
                          child: Icon(
                            Icons.clear,
                            color: Colors.white,
                            size: 17,
                          ),
                          onPressed: () {
                            // if (_requirementsWidgetList.length / 2 ==
                            //     _requirementsList.length)
                            //   _requirementsList.removeLast();
                            _requirementsWidgetList.removeRange(
                                _requirementsWidgetList.length - 2,
                                _requirementsWidgetList.length);
                            print(
                                "${_requirementsList.length}  ${_requirementsWidgetList.length}");
                            int requirementsListLength =
                                _requirementsList.length;
                            for (int i = 0;
                                i <
                                    requirementsListLength -
                                        (_requirementsWidgetList.length / 2);
                                i++) _requirementsList.removeLast();
                            print(_requirementsList.toString());
                            setState(() {});
                          },
                          shape: CircleBorder()),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: RaisedButton(
                    color: Colors.green,
                    child: Text(
                      "Add",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      // if (_description == "")
                      _description = "";
                      _descriptionList.forEach((element) {
                        _description == ""
                            ? _description += element
                            : _description += "x-x" + element;
                      });
                      // if (_requirements == "")
                      _requirements = "";
                      _requirementsList.forEach((element) {
                        _requirements == ""
                            ? _requirements += element
                            : _requirements += "x-x" + element;
                      });
                      _handleSubmitted(context);
                    },
                  ),
                ),
                sizedBoxSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
