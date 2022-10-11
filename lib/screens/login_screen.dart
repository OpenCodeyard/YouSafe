import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 48.0,
              ),
              Flexible(
                child: Container(
                  height: 200.0,
                  child: Image.asset('assets/Logo.png'),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'YouSafe',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF5DB075)),
              ),
              SizedBox(
                height: 60.0,
              ),
              TextField(
                  keyboardType: TextInputType.phone,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Phone Number',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF323232), width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF121212), width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  )),
              SizedBox(
                height: 100.0,
              ),
              CustomButton(
                width: 100.0,
                height: 50.0,
                bgColor: Color(0xFF5DB075),
                title: 'Sign in',
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final Function onPress;
  final String title;
  final Color bgColor;
  final BorderRadiusGeometry borderRadius;
  final double height;
  final double width;

  const CustomButton(
      {Key? key,
      required this.onPress,
      required this.title,
      required this.bgColor,
      required this.borderRadius,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(color: bgColor, borderRadius: borderRadius),
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
