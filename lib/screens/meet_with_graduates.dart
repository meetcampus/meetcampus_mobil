import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:meetcampus_mobil/utilities/component.dart';
import 'package:meetcampus_mobil/utilities/styles.dart';
//import 'package:easy_localization/easy_localization.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

// ignore: must_be_immutable
class MeetWithGraduates extends KFDrawerContent {
  @override
  _MeetWithGraduatesState createState() => _MeetWithGraduatesState();
}

class _MeetWithGraduatesState extends State<MeetWithGraduates> {
  @override
  Widget build(BuildContext context) {
    final dynamicH = MediaQuery.of(context).size.height;
    final dynamicW = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: buildTitle(),
            )
          ],
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: textColorOne,
            ),
            onPressed: widget.onMenuPressed,
          ),
          backgroundColor: backColorBlue,
          shadowColor: Colors.transparent,
          title: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              'Meet Graduates',
              style: textStyleLogoAppBar2,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: CircleAvatar(
                              maxRadius: ResponsiveFlutter.of(context)
                                  .verticalScale(40),
                              backgroundColor: Colors.transparent,
                              backgroundImage: NetworkImage(
                                  'https://scontent.fada1-8.fna.fbcdn.net/v/t1.0-9/71074570_2395748953793582_5236197842636242944_o.jpg?_nc_cat=109&ccb=2&_nc_sid=09cbfe&_nc_ohc=qVnHAaYWiwwAX-jsF9L&_nc_ht=scontent.fada1-8.fna&oh=ed0403e164d4c084830d004ad19d6d10&oe=60319237'),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Cihat Karaboğa',
                                    style: TextStyle(
                                        fontSize: ResponsiveFlutter.of(context)
                                            .fontSize(3),
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                Spacer(
                                  flex: 1,
                                ),
                                Material(
                                  clipBehavior: Clip.antiAlias,
                                  borderRadius: BorderRadius.circular(50.0),
                                  color: Colors.white.withOpacity(0.0),
                                  child: IconButton(
                                      icon: Image.asset(
                                          'assets/icons8_twitter_60px_2.png'),
                                      onPressed: () {}),
                                ),
                                Material(
                                  clipBehavior: Clip.antiAlias,
                                  borderRadius: BorderRadius.circular(50.0),
                                  color: Colors.white.withOpacity(0.0),
                                  child: IconButton(
                                      icon: Image.asset(
                                          'assets/icons8_linkedin_52px_1.png'),
                                      onPressed: () {}),
                                ),
                              ],
                            ),
                            Text('Mobile Developer',
                                style: TextStyle(
                                    fontSize: ResponsiveFlutter.of(context)
                                        .fontSize(2),
                                    color: Colors.white)),
                            Text('Çalıştığı Kurum: Hesty Company',
                                style: TextStyle(
                                    fontSize: ResponsiveFlutter.of(context)
                                        .fontSize(2),
                                    color: Colors.white)),
                          ],
                        )
                      ],
                    ),
                  ),
                  width: dynamicW * 0.9,
                  height: dynamicH * 0.3,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment(1, 0.0),
                      colors: [
                        Color(0xff14698E),
                        Color(0xff35A9DB),
                      ],
                    ),
                    color: backColorBlue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }
}
