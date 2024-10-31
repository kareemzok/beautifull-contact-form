
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
    return SettingsList(
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
            SettingsSection(
              title: Text('Notification'),
              tiles: [
                SettingsTile(
                  title: Text('Do Not Disturb'),
                  description: Text('Off / 1 schedule can turn on automatically'),
                ),
                SettingsTile(
                  title: Text('Wireless emergency alerts'),
                ),
                SettingsTile.switchTile(
                  initialValue: false,
                  onToggle: (_) {},
                  title: Text('Hide silent notifications in status bar'),
                ),
                SettingsTile.switchTile(
                  initialValue: false,
                  onToggle: (_) {},
                  title: Text('Allow notification snoozing'),
                ),

              ],
            ),

          ],
        );

  }
}