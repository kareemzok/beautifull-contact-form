
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Contact/HomeButton.dart';
import 'Contact/ContactUsForm.dart';


// Create a Form widget.
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomeFormState createState() {
    return HomeFormState();
  }
}

class HomeFormState extends State<HomePage> {
  Widget build(BuildContext context) {

    ScreenUtil.init(
        context,
        designSize: Size(360, 690),
        minTextAdapt: true);
    return Center(
        child:  HomeButton(
          title: 'Welcome to the demo',
          onTap: () {


          },
        )
    );
  }
}