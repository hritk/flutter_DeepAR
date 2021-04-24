import 'package:flutter/material.dart';
import 'package:my_app/cameraWithMaskFiltersScreen.dart';
import 'package:splashscreen/splashscreen.dart';

class MySplashScreen extends StatefulWidget {
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen>
{


  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: cameraWithMaskFiltersScreen(),
      title: Text(
        "Hr Filter Flutter",
        style: TextStyle(
          fontSize: 55,
          fontFamily: "Signatra",
          color : Colors.deepPurpleAccent,

        ),
      ),
      image : Image.asset("images/icon.png"),
      backgroundColor: Colors.white,
      photoSize: 140,
      loaderColor: Colors.amber,
      loadingText: Text(
        "made with 💜 ",
         style: TextStyle(
           color: Colors.deepPurpleAccent,
           fontFamily: "Brand Bold",
           fontSize: 16.0,

         ),
      ),

    );
  }
}

