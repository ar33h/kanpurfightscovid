import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kanpurfightscovid/home.dart';

class Splash extends StatefulWidget {

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() { 
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: initScreen(context),
    );
  }

  startTime() async {
    var duration = new Duration(seconds: 4);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => Home()
      )
    ); 
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0F5FC),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 105),
            // Padding(padding: EdgeInsets.only(top: 30.0)),
            Text(
              "KANPUR",
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 46,
                  fontWeight: FontWeight.w500,
                )
               
              )
            ),
            Text(
              "fights",
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 50,
                  fontWeight: FontWeight.w400,
                )
               
              )
            ),


            Text(
              "COVID",
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.black,
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                )
               
              )
            ),
            SizedBox(height: 80,),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
      
           ),

           FittedBox(
              child: Image.asset("assets/splash_illus.png", height: 420, width: 400,
              fit: BoxFit.fill,),
              
            ),
           
         ],
         
       ),
      ),
    );
  }
}
