// import 'package:flutter/material.dart';
//
// class AdminPanel extends StatefulWidget {
//   @override
//   _AdminPanelState createState() => _AdminPanelState();
// }
//
// class _AdminPanelState extends State<AdminPanel> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Admin Panel"),
//       ),
//       body: Container(),
//     );
//   }
// }

// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;

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

class PersonData {
  String name = '';
  String phoneNumber = '';
  String email = '';
  String password = '';
}

// class PasswordField extends StatefulWidget {
//   const PasswordField({
//     this.fieldKey,
//     this.hintText,
//     this.labelText,
//     this.helperText,
//     this.onSaved,
//     this.validator,
//     this.onFieldSubmitted,
//   });
//
//   final Key fieldKey;
//   final String hintText;
//   final String labelText;
//   final String helperText;
//   final FormFieldSetter<String> onSaved;
//   final FormFieldValidator<String> validator;
//   final ValueChanged<String> onFieldSubmitted;
//
//   @override
//   _PasswordFieldState createState() => _PasswordFieldState();
// }

// class _PasswordFieldState extends State<PasswordField> {
//   bool _obscureText = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       key: widget.fieldKey,
//       obscureText: _obscureText,
//       maxLength: 8,
//       onSaved: widget.onSaved,
//       validator: widget.validator,
//       onFieldSubmitted: widget.onFieldSubmitted,
//       decoration: InputDecoration(
//         filled: true,
//         hintText: widget.hintText,
//         labelText: widget.labelText,
//         helperText: widget.helperText,
//         suffixIcon: GestureDetector(
//           dragStartBehavior: DragStartBehavior.down,
//           onTap: () {
//             setState(() {
//               _obscureText = !_obscureText;
//             });
//           },
//           child: Icon(
//             _obscureText ? Icons.visibility : Icons.visibility_off,
//             semanticLabel: _obscureText
//                 ? "Yes"
//                 : "no",
//           ),
//         ),
//       ),
//     );
//   }
// }

Map jobs = {};
List<String> _descriptionList = [];
List<String> _requirementsList = [];
String _description = "";
String _requirements = "";

class AddJobFormState extends State<AddJobForm> {
  PersonData person = PersonData();

  List _descriptionWidgetList = [
    TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: "description",
      ),
      maxLines: 2,
      onFieldSubmitted: (value) {
        _descriptionList.add(value);
      },
    ),
    SizedBox(
      height: 6,
    ),
  ];

  List _requirementsWidgetList = [
    TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: "requirements",
      ),
      maxLines: 2,
      onFieldSubmitted: (value) {
        _requirementsList.add(value);
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

  // final GlobalKey<FormFieldState<String>> _passwordFieldKey =
  //     GlobalKey<FormFieldState<String>>();
  // final _UsNumberTextInputFormatter _phoneNumberFormatter =
  //     _UsNumberTextInputFormatter();

  // String _validateName(String value) {
  //   if (value.isEmpty) {
  //     return GalleryLocalizations.of(context).demoTextFieldNameRequired;
  //   }
  //   final nameExp = RegExp(r'^[A-Za-z ]+$');
  //   if (!nameExp.hasMatch(value)) {
  //     return GalleryLocalizations.of(context)
  //         .demoTextFieldOnlyAlphabeticalChars;
  //   }
  //   return null;
  // }

  // String _validatePhoneNumber(String value) {
  //   final phoneExp = RegExp(r'^\(\d\d\d\) \d\d\d\-\d\d\d\d$');
  //   if (!phoneExp.hasMatch(value)) {
  //     return GalleryLocalizations.of(context).demoTextFieldEnterUSPhoneNumber;
  //   }
  //   return null;
  // }

  // String _validatePassword(String value) {
  //   final passwordField = _passwordFieldKey.currentState;
  //   if (passwordField.value == null || passwordField.value.isEmpty) {
  //     return GalleryLocalizations.of(context).demoTextFieldEnterPassword;
  //   }
  //   if (passwordField.value != value) {
  //     return GalleryLocalizations.of(context).demoTextFieldPasswordsDoNotMatch;
  //   }
  //   return null;
  // }

  void _handleSubmitted() {
    final form = _formKey.currentState;
    if (!form.validate()) {
      _autoValidateMode =
          AutovalidateMode.always; // Start validating on every change.
      // showInSnackBar(
      //   GalleryLocalizations.of(context).demoTextFieldFormErrors,
      // );
    } else {
      // form.save();
      jobs.addAll({'description': _description, 'requirements' : _requirements});
      print(jobs);

      // showInSnackBar(GalleryLocalizations.of(context)
      //     .demoTextFieldNameHasPhoneNumber(person.name, person.phoneNumber));
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
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "apply link",
                  ),
                  maxLines: 1,
                  onFieldSubmitted: (value) {
                    jobs.addAll({'apply': value});
                  },
                  onSaved: (value) {
                    // jobs[0].addAll({'apply link': value});
                  },
                ),
                sizedBoxSpace,
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "batch",
                        ),
                        maxLines: 1,
                        onFieldSubmitted: (value) {
                          jobs.addAll({'batch': value});
                        },
                        onSaved: (value) {
                          // jobs[0].addAll({'batch': value});
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "company",
                        ),
                        maxLines: 1,
                        onFieldSubmitted: (value) {
                          jobs.addAll({'company': value});
                        },
                        onSaved: (value) {},
                      ),
                    ),
                  ],
                ),
                sizedBoxSpace,
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "date",
                        ),
                        maxLines: 1,
                        onFieldSubmitted: (value) {
                          jobs.addAll({'date': value});
                        },
                        onSaved: (value) {},
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "sort",
                        ),
                        maxLines: 1,
                        onFieldSubmitted: (value) {
                          jobs.addAll({'sort': value});
                        },
                        onSaved: (value) {},
                      ),
                    ),
                  ],
                ),
                sizedBoxSpace,
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "education",
                  ),
                  maxLines: 1,
                  onFieldSubmitted: (value) {
                    jobs.addAll({'education': value});
                  },
                  onSaved: (value) {},
                ),
                sizedBoxSpace,
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "height",
                        ),
                        maxLines: 1,
                        onFieldSubmitted: (value) {
                          jobs.addAll({'height': value});
                        },
                        onSaved: (value) {},
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "width",
                        ),
                        maxLines: 1,
                        onFieldSubmitted: (value) {
                          jobs.addAll({'width': value});
                        },
                        onSaved: (value) {},
                      ),
                    ),
                  ],
                ),
                sizedBoxSpace,
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "imgURL",
                  ),
                  maxLines: 1,
                  onFieldSubmitted: (value) {
                    jobs.addAll({'imgURL': value});
                  },
                  onSaved: (value) {},
                ),
                sizedBoxSpace,
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "label",
                        ),
                        maxLines: 1,
                        onFieldSubmitted: (value) {
                          jobs.addAll({'label': value});
                        },
                        onSaved: (value) {},
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "title",
                        ),
                        maxLines: 1,
                        onFieldSubmitted: (value) {
                          jobs.addAll({'title': value});
                        },
                        onSaved: (value) {},
                      ),
                    ),
                  ],
                ),
                sizedBoxSpace,
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "location",
                  ),
                  maxLines: 1,
                  onFieldSubmitted: (value) {
                    jobs.addAll({'location': value});
                  },
                  onSaved: (value) {},
                ),
                sizedBoxSpace,
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "experience",
                        ),
                        maxLines: 1,
                        onFieldSubmitted: (value) {
                          jobs.addAll({'experience': value});
                        },
                        onSaved: (value) {},
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: "salary",
                        ),
                        maxLines: 1,
                        onFieldSubmitted: (value) {
                          jobs.addAll({'salary': value});
                        },
                        onSaved: (value) {},
                      ),
                    ),
                  ],
                ),
                sizedBoxSpace,
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "skills",
                  ),
                  maxLines: 1,
                  onFieldSubmitted: (value) {
                    jobs.addAll({'skills': value});
                  },
                  onSaved: (value) {},
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
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: "description",
                              ),
                              maxLines: 2,
                              onFieldSubmitted: (value) {
                                _descriptionList.add(value);
                              },
                              onSaved: (value) {},
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
                            _descriptionWidgetList.removeRange(
                                _descriptionWidgetList.length - 2,
                                _descriptionWidgetList.length);
                            _descriptionList.removeLast();
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
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: "requirements",
                              ),
                              maxLines: 2,
                              onFieldSubmitted: (value) {
                                _requirementsList.add(value);
                              },
                              onSaved: (value) {},
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
                            _requirementsWidgetList.removeRange(
                                _requirementsWidgetList.length - 2,
                                _requirementsWidgetList.length);
                            _requirementsList.removeLast();
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
                      _descriptionList.forEach((element) {_description == "" ?  _description += element : _description += "x-x" + element;});
                      _requirementsList.forEach((element) {_requirements  == ""? _requirements += element : _requirements += "x-x" + element;});
                      _handleSubmitted();
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

/// Format incoming numeric text to fit the format of (###) ###-#### ##
// class _UsNumberTextInputFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//     TextEditingValue oldValue,
//     TextEditingValue newValue,
//   ) {
//     final newTextLength = newValue.text.length;
//     final newText = StringBuffer();
//     var selectionIndex = newValue.selection.end;
//     var usedSubstringIndex = 0;
//     if (newTextLength >= 1) {
//       newText.write('(');
//       if (newValue.selection.end >= 1) selectionIndex++;
//     }
//     if (newTextLength >= 4) {
//       newText.write(newValue.text.substring(0, usedSubstringIndex = 3) + ') ');
//       if (newValue.selection.end >= 3) selectionIndex += 2;
//     }
//     if (newTextLength >= 7) {
//       newText.write(newValue.text.substring(3, usedSubstringIndex = 6) + '-');
//       if (newValue.selection.end >= 6) selectionIndex++;
//     }
//     if (newTextLength >= 11) {
//       newText.write(newValue.text.substring(6, usedSubstringIndex = 10) + ' ');
//       if (newValue.selection.end >= 10) selectionIndex++;
//     }
//     // Dump the rest.
//     if (newTextLength >= usedSubstringIndex) {
//       newText.write(newValue.text.substring(usedSubstringIndex));
//     }
//     return TextEditingValue(
//       text: newText.toString(),
//       selection: TextSelection.collapsed(offset: selectionIndex),
//     );
//   }
// }
