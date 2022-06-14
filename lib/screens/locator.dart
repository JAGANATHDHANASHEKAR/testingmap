import 'package:flutter/material.dart';
import 'package:testing/commonstyle/commonstyles.dart';
import 'package:testing/commonstyle/constrants.dart';
import 'package:testing/screens/googlescreen/map.dart';
import 'package:testing/screens/logostyles/logostyle.dart';

class loginpage extends StatefulWidget {
  final Size size;
  const loginpage({Key? key, required this.size}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/images/whitee.png",
                  ),
                  fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                LogoStyle.LogoStyleSet("U Can Test the google Maps",
                    "Please Test the map by tap on Continue"),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: widget.size.height * 0.1 - 20,
          width: widget.size.width,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(15.0),
          child: longButtonFullColor(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Map()));
              },
              size: widget.size,
              color: blackColor,
              title: "Continue",
              style: CommonStyle.WhiteText14w500()),
        ),
      ),
    );
  }
}

class longButtonFullColor extends StatelessWidget {
  longButtonFullColor({
    Key? key,
    required this.size,
    required this.color,
    required this.title,
    required this.style,
    required this.onPressed,
  }) : super(key: key);
  final Size size;
  final Color color;
  String title;
  var style;
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
          child: Text(
            title,
            style: style,
          ),
        ),
        style: ElevatedButton.styleFrom(
            primary: blackColor,
            minimumSize: Size(size.width, 15),
            elevation: 3,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0))));
  }
}
