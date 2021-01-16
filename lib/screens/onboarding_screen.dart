import 'package:flutter/material.dart';
import 'package:meetcampus_mobil/screens/main_screen.dart';
import 'package:meetcampus_mobil/utilities/styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final dynamicHeight = MediaQuery.of(context).size.height * 0.4;
    return Scaffold(
      backgroundColor: backColorBlue,
      body: Column(
        children: [
          buildSkipButton(dynamicHeight),
          Expanded(
            flex: 5,
            child: PageView(
              controller: _controller,
              children: [
                pageOne(dynamicHeight),
                pageTwo(dynamicHeight),
                pageThree(dynamicHeight),
              ],
            ),
          ),
          buildIndicatior(),
        ],
      ),
    );
  }

  Expanded buildNextButton() {
    return Expanded(
        flex: 1,
        child: IconButton(
          onPressed: () {
            print(_controller.page);
            _controller.animateToPage(_controller.page.toInt() + 1, duration: Duration(milliseconds: 400), curve: Curves.easeIn);
          },
          tooltip: 'next page ',
          padding: EdgeInsets.only(right: 35),
          icon: Icon(
            Icons.play_arrow,
            color: textColorTwo,
            size: 60,
          ),
        ));
  }

  Padding pageOne(double dynamicHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: dynamicHeight * 0.1),
      child: Column(
        children: [
          Image.asset(
            'assets/o2.png',
            height: dynamicHeight,
          ),
          Row(
            children: [
              Text(
                'Meet ',
                style: TextStyle(fontFamily: 'Eras', color: textColorTwo, fontSize: 30),
              ),
              Text(
                'new friends',
                style: TextStyle(fontFamily: 'Eras', color: textColorOne, fontSize: 30),
              )
            ],
          ),
          Row(
            children: [
              Text(
                dummyString,
                style: TextStyle(fontFamily: 'Gothic', color: textColorOne, fontSize: 20),
              ),
            ],
          ),
          buildNextButton(),
        ],
      ),
    );
  }

  Padding pageTwo(double dynamicHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: dynamicHeight * 0.1),
      child: Column(
        children: [
          Image.asset(
            'assets/o1.png',
            height: dynamicHeight,
          ),
          Row(
            children: [
              Text(
                'Graduation ',
                style: TextStyle(fontFamily: 'Eras', color: textColorTwo, fontSize: 27),
              ),
              Text(
                'learning',
                style: TextStyle(fontFamily: 'Eras', color: textColorOne, fontSize: 27),
              )
            ],
          ),
          Row(
            children: [
              Text(
                dummyString,
                style: TextStyle(fontFamily: 'Gothic', color: textColorOne, fontSize: 20),
              ),
            ],
          ),
          buildNextButton(),
        ],
      ),
    );
  }

  Padding pageThree(double dynamicHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: dynamicHeight * 0.1),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/o3.png',
              height: dynamicHeight,
            ),
            Row(
              children: [
                Text(
                  'Share ',
                  style: TextStyle(fontFamily: 'Eras', color: textColorTwo, fontSize: 30),
                ),
                Text(
                  'information',
                  style: TextStyle(fontFamily: 'Eras', color: textColorOne, fontSize: 30),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  dummyString,
                  style: TextStyle(fontFamily: 'Gothic', color: textColorOne, fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen()));
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(color: textColorTwo, borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    'START',
                    style: TextStyle(color: backColorBlue, fontFamily: 'Eras', fontSize: 30),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded buildSkipButton(double dynamicHeight) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.all(dynamicHeight * 0.06),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Material(
              color: Colors.white.withOpacity(0.0),
              child: InkWell(
                onTap: () {
                  _controller.animateToPage(_controller.page.toInt() + 3, duration: Duration(milliseconds: 1000), curve: Curves.easeIn);
                },
                child: Text(
                  'SKIP',
                  style: TextStyle(fontFamily: 'Eras', color: textColorOne),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded buildIndicatior() {
    return Expanded(
      flex: 1,
      child: SmoothPageIndicator(
        count: 3,
        controller: _controller,
        effect: ExpandingDotsEffect(activeDotColor: textColorTwo, dotColor: textColorOne, expansionFactor: 2, dotHeight: 5),
      ),
    );
  }
}
