import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:meetcampus_mobil/model/graduate_model.dart';
import 'package:meetcampus_mobil/service/graduate_service.dart';
import 'package:meetcampus_mobil/utilities/component.dart';
import 'package:meetcampus_mobil/utilities/styles.dart';
import 'package:http/http.dart' as http;

//import 'package:easy_localization/easy_localization.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

// ignore: must_be_immutable
class MeetWithGraduates extends KFDrawerContent {
  @override
  _MeetWithGraduatesState createState() => _MeetWithGraduatesState();
}

class _MeetWithGraduatesState extends State<MeetWithGraduates> {
List<GraduateModel> allPersonelList;

  Future<GraduateModel> getGraduatesData() async {
    final response = await http.get('http://cihatkaraboga.com/graduates.json');
    final mapJson = json.decode(response.body);
    final graduatePost = GraduateModel.fromJson(mapJson);
    return graduatePost;
  }

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
                FutureBuilder(
                  future: readData(),
                  // ignore: missing_return
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      allPersonelList=snapshot.data;
                      return ListView.builder(physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: allPersonelList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(

                                child: Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Center(
                                          child:  CircleAvatar(

                                            child: FadeInImage.assetNetwork(placeholder: "assets/loading.gif", image: allPersonelList[index].avatarUrl.toString()),
                                            maxRadius:
                                                ResponsiveFlutter.of(context)
                                                    .verticalScale(40),
                                            backgroundColor: Colors.transparent,
                                            // backgroundImage: NetworkImage(
                                            //     allPersonelList[index].avatarUrl.toString()),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                  allPersonelList[index].name +
                                                      ' ' +
                                                      allPersonelList[index].surname,
                                                  style: TextStyle(
                                                      fontSize:
                                                          ResponsiveFlutter.of(
                                                                  context)
                                                              .fontSize(3),
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Spacer(
                                                flex: 1,
                                              ),
                                              Material(
                                                clipBehavior: Clip.antiAlias,
                                                borderRadius:
                                                    BorderRadius.circular(50.0),
                                                color:
                                                    Colors.white.withOpacity(0.0),
                                                child: IconButton(
                                                    icon: Image.asset(
                                                        'assets/icons8_twitter_60px_2.png'),
                                                    onPressed: () {}),
                                              ),
                                              Material(
                                                clipBehavior: Clip.antiAlias,
                                                borderRadius:
                                                    BorderRadius.circular(50.0),
                                                color:
                                                    Colors.white.withOpacity(0.0),
                                                child: IconButton(
                                                    icon: Image.asset(
                                                        'assets/icons8_linkedin_52px_1.png'),
                                                    onPressed: () {}),
                                              ),
                                            ],
                                          ),
                                          Text(allPersonelList[index].title,
                                              style: TextStyle(
                                                  fontSize: ResponsiveFlutter.of(
                                                          context)
                                                      .fontSize(2),
                                                  color: Colors.white)),
                                          Text(
                                              'Çalıştığı Kurum:' +
                                                  allPersonelList[index].placeOfWork,
                                              style: TextStyle(
                                                  fontSize: ResponsiveFlutter.of(
                                                          context)
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
                            );
                          });
                    } else if (snapshot.hasError) {
                    } else {
                      return Center(
                          child: CircularProgressIndicator(
                        backgroundColor: backColorBlue,
                      ));
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }


  Future<List> readData() async {

    var localJson = await DefaultAssetBundle.of(context)
        .loadString("assets/data/personelInformations.json");


    List<GraduateModel> personelList =  (json.decode(localJson) as List).map((mapJson) => GraduateModel.fromJson(mapJson)).toList();


    return personelList;
  }
}
