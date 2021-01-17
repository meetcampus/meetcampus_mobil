import 'package:flutter/material.dart';
import 'package:meetcampus_mobil/screens/signup_screen.dart';
import 'package:meetcampus_mobil/utilities/styles.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final dynamicHeight = MediaQuery.of(context).size.height * 0.4;
    final dynamicWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          buildUpPanel(dynamicHeight),
          buildBottomPanel(dynamicWidth, dynamicHeight),
        ],
      ),
    );
  }

  Expanded buildBottomPanel(double dynamicWidth, double dynamicHeight) {
    return Expanded(
      flex: 1,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: dynamicWidth / 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              buildEmailTexField(),
              buildPassTexField(),
              SizedBox(
                height: dynamicHeight * 0.10,
              ),
              buildButton(dynamicWidth, dynamicHeight)
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildUpPanel(double dynamicHeight) {
    return Expanded(
      flex: 1,
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SafeArea(child: buildTitle()),
              Image.asset(
                'assets/login.png',
                height: dynamicHeight * 0.8,
              )
            ],
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/mask1.png'),
          )),
        ),
      ),
    );
  }

  Column buildButton(double dynamicWidth, double dynamicHeight) {
    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Ink(
            width: dynamicWidth,
            height: dynamicHeight / 6,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: backColorBlue.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: backColorBlue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text('Log in', style: TextStyle(fontFamily: 'Eras', fontSize: 30, color: textColorOne)),
            ),
          ),
        ),
        SizedBox(
          height: dynamicHeight * 0.10,
        ),
        Row(
          children: [
            Container(
              color: Colors.grey,
              height: 2,
              width: (dynamicWidth / 2) - 50,
            ),
            Text(
              'or',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            Container(
              color: Colors.grey,
              height: 2,
              width: (dynamicWidth / 3),
            ),
          ],
        ),
        SizedBox(
          height: dynamicHeight * 0.10,
        ),
        InkWell(
          onTap: () {
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                  transitionDuration: Duration(seconds: 1),
                  transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget child) {
                    animation = CurvedAnimation(parent: animation, curve: Curves.bounceOut);
                    return ScaleTransition(
                      scale: animation,
                      alignment: Alignment.center,
                      child: child,
                    );
                  },
                  pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation) {
                    return SignupScreen();
                  }),
            );
          },
          child: Container(
            width: dynamicWidth,
            height: dynamicHeight / 6,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text('Sign up', style: TextStyle(fontFamily: 'Eras', fontSize: 30, color: Colors.grey)),
            ),
          ),
        ),
      ],
    );
  }

  TextFormField buildPassTexField() {
    return TextFormField(
      obscureText: isPasswordVisible,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock),
          labelText: 'Password',
          suffixIcon: IconButton(
            onPressed: () => setState(() => isPasswordVisible = !isPasswordVisible),
            icon: isPasswordVisible ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
          )),
    );
  }

  TextFormField buildEmailTexField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        prefixIcon: Icon(Icons.email),
        hoverColor: backColorBlue,
      ),
    );
  }

  Row buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('meet', style: textStyleLogo),
        Text('campus', style: textStyleLogo2),
      ],
    );
  }
}
