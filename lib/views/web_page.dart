
import 'package:flutter_web/material.dart';
import 'package:resume/utils/default-colors.dart';
import 'package:resume/app_icons.dart'; 
import 'package:resume/utils/constants.dart';
import 'package:resume/views/content_frame.dart';
import 'package:resume/views/drawer/drawer_item.dart';


import 'package:resume/views/drawer/drawer_top.dart';

class WebPage extends StatefulWidget {
  WebPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => WebPageState();
}

class WebPageState extends State<WebPage> {

  int selectedItem = 0;
  
  _setStateItemId(int id) {
    setState(() {
      selectedItem = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // ListView
          Container(
            width: DrawerWidth,
            height: MediaQuery.of(context).size.height,
            color: WebColors.darkVanilla,
            child: ListView(
              children: <Widget>[
                  // Top Bar
                  DrawerTop(),
                  DrawerItem(AppIcons.cogs, "kimi", selectedItem == 0, onPressed: () { _setStateItemId(0); },),
                  DrawerItem(AppIcons.cogs, "no", selectedItem == 1, onPressed: () { _setStateItemId(1); },),
                  DrawerItem(AppIcons.cogs, "yawa", selectedItem == 2, onPressed: () { _setStateItemId(2); },),
              ],
            ),
          ),
          // Content
          Expanded(
            child: ContentFrame(selectedItem),
          )
        ],
      ),
    );
  }
}