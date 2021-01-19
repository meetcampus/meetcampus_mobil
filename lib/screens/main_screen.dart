import 'package:flutter/material.dart';
import 'package:meetcampus_mobil/utilities/styles.dart';
import 'package:easy_localization/easy_localization.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final dynamicHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backColorBlue,
        shadowColor: Colors.transparent,
        title: buildTitle(),
      ),
      drawer: buildDrawer(dynamicHeight),
    );
  }

  Drawer buildDrawer(double dynamicHeight) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Ink(
            height: dynamicHeight / 3,
            child: DrawerHeader(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: (dynamicHeight / 3) / 5),
                child: Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        maxRadius: 50,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage('assets/o1.png'),
                      ),
                      Text(
                        'Person Name and Photo',
                        style: drawerText,
                      )
                    ],
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: backColorBlue,
              ),
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'home'.tr(),
                  style: drawerText,
                ),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.emoji_people,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'meetgraduates'.tr(),
                  style: drawerText,
                ),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.more_horiz,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '',
                  style: drawerText,
                ),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.more_horiz,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '',
                  style: drawerText,
                ),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.more_horiz,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '',
                  style: drawerText,
                ),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.logout,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'logout'.tr(),
                  style: drawerText,
                ),
              ],
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Row buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('meet', style: textStyleLogo),
        Text('campus', style: textStyleLogo2),
      ],
    );
  }
}
