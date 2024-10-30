
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


// Create a Form widget.
class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  SettingFormState createState() {
    return SettingFormState();
  }
}

class SettingFormState extends State<SettingPage> {
  Widget build(BuildContext context) {
    ScreenUtil.init(
        context,
        designSize: Size(360, 690),
        minTextAdapt: true);
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the Tab Page object that was created by
        backgroundColor: Color(0xFF342d50),
        title: Text("Contact us"),
        centerTitle: true, // placing the title in the middle of the appbar
        automaticallyImplyLeading: false,
      ),
      body:SingleChildScrollView(
        child :SettingsList(
          sections: [
            SettingsSection(
              title: Text('Common'),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: Icon(Icons.language),
                  title: Text('Language'),
                  value: Text('English'),
                ),
                SettingsTile.switchTile(
                  onToggle: (value) {},
                  initialValue: true,
                  leading: Icon(Icons.format_paint),
                  title: Text('Enable custom theme'),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}