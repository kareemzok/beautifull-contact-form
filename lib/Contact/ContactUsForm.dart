import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';

import 'Thankyou.dart';

void initState() {
  SystemChannels.textInput.invokeMethod('TextInput.hide');
  initState();
}

// Create a Form widget.
class ContactUsForm extends StatefulWidget {
  const ContactUsForm({Key? key}) : super(key: key);

  @override
  ContactUsFormState createState() {
    return ContactUsFormState();
  }
}

class _ContactUsFormData {
  String email = '';
  String name = '';
  String message = '';
}

// Create a corresponding State class.
// This class holds data related to the form.
class ContactUsFormState extends State<ContactUsForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final _ContactUsFormData _data = _ContactUsFormData();

  bool _validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    // Null check
    if (value.isEmpty) {
      return false;
    }
    // Valid email formatting check
    else if (!regex.hasMatch(value)) {
      return false;
    } else {
      _data.email = value;
      return true;
    }
  }

  void send() {
    // First validate form.
    if (this._formKey.currentState!.validate()) {
      _formKey.currentState?.save(); // Send form on button click

    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(392, 690),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);
    return  OKToast(child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // Here we take the value from the Tab Page object that was created by
          backgroundColor: Color(0xFF342d50),
          title: Text("Contact us"),
          centerTitle: true, // placing the title in the middle of the appbar
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 7.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Contact us',
                              style: TextStyle(
                                color: Color(0xff342d50),
                                fontSize: 25.sp,
                                letterSpacing: 0.15,
                              )),
                          SizedBox(height: 20),
                          Text("Happy to hear from you",
                              style: TextStyle(
                                color: Color(0xff342d50),
                                fontSize: 19.sp,
                                letterSpacing: 0.1,
                              )),
                          SizedBox(height: 30),
                          Text("Name", style: TextStyle(
                            color: Color(0xff895575),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          )),
                          SizedBox(height: 10),
                          TextFormField(
                            onSaved: (value) => _data.name = value!,
                            style: TextStyle(height: 0.2),
                            maxLines: 1,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffd9d9d9), width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffd9d9d9), width: 1.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.0))),
                              hintText: "",
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your full name';
                              }
                            },
                          ),
                          SizedBox(height: 30),
                          Text("Email", style: TextStyle(
                            color: Color(0xff895575),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          )),
                          SizedBox(height: 10),
                          TextFormField(
                              onSaved: (value) => _data.email = value!,
                              style: TextStyle(height: 0.2),
                              maxLines: 1,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffd9d9d9), width: 1.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.0)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffd9d9d9), width: 1.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.0))),
                                hintText: "",
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your email';
                                } else if (!_validateEmail(value))
                                  return 'Invalid email';
                              }),
                          SizedBox(height: 30),
                          Text("Message", style: TextStyle(
                            color: Color(0xff895575),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          )),
                          SizedBox(height: 10),
                          TextFormField(
                            onSaved: (value) => _data.message = value!,
                            keyboardType: TextInputType.multiline,
                            minLines: 5,
                            //Normal textInputField will be displayed
                            maxLines: 10,
                            // when user presses enter it will adapt to it
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffd9d9d9), width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffd9d9d9), width: 1.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6.0))),
                              hintText: '',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter you message';
                              }
                            },
                          ),
                          SizedBox(height: 30),
                          Card(
                              color: Color(0xffe33e6f),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                                side: BorderSide(
                                  color: Color(0xffe33e6f),
                                ),
                              ),
                              child: ListTile(
                                title: new Row(children: <Widget>[
                                  Text("send",
                                      style: TextStyle(
                                        color: Color(0xffffffff),
                                        fontSize: 25.sp,
                                        letterSpacing: 0.1,
                                      ))
                                ], mainAxisAlignment: MainAxisAlignment.center),
                                onTap: () async {
                                  // First validate form.
                                  _formKey.currentState!.save();
                                  if (_formKey.currentState!.validate()) {

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ThankYouPage(
                                                title: 'Thank you'),
                                      ),
                                    );
                                    // u can use the below toast instead of the thank you page
                                    showToast(
                                      "Message sent",
                                      duration: Duration(seconds: 2),
                                      position: ToastPosition.bottom,
                                      backgroundColor: Colors.green,
                                      // Colors.black.withOpacity(0.8)
                                      textPadding: EdgeInsets.all(10),
                                      textStyle: TextStyle(
                                          fontSize: 14.0, color: Colors.white),
                                    );
                                  }
                                },
                              )),
                        ],
                      ),
                    )
                  ])),
        )
    ));
  }
}
