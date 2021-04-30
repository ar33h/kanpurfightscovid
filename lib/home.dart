import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kanpurfightscovid/list.dart';
import 'package:kanpurfightscovid/post.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future navigateToPostReq(context) async
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> PostReq()));
  }

  Future navigateToListReq(context) async
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> ListReq(null)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 100.0),
        child: Container(
         child: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           
           children: <Widget>[

            Container(
              child: Text("EVERYONE\nEVERYDAY", style: GoogleFonts.montserrat(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w600,
              )),
            ),

            Container(
              child: Text("HELP ONE", style: GoogleFonts.montserrat(
                  fontSize: 42.0,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFE75D5D)
              )),
            ),
            
            SizedBox(height: 20,),

            Container(
              padding: EdgeInsets.fromLTRB(55, 0, 55, 0),
              
              child: Text("Help people battling with COVID by arranging funds, food, med supplies, oxygen etc.", style: GoogleFonts.montserrat(
                  fontSize: 18.0,
                  height: 1.5,
                  fontWeight: FontWeight.w400),

                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: 40,),

            ElevatedButton(
              onPressed: (){navigateToPostReq(context);},
              child: Text("Requirements", style: GoogleFonts.nunito(fontSize: 20.0, fontWeight: FontWeight.w700,
                          color: Colors.black
              )),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF95DDF6)),
                padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(60, 10, 60, 10)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0),)
              ),
              )
              ),


              SizedBox(height: 250,),

              Container(
              padding: EdgeInsets.fromLTRB(55, 0, 55, 0),
              
              child: Text("For App related issues, contact", style: GoogleFonts.montserrat(
                  fontSize: 10.0,
                  height: 1.5,
                  fontWeight: FontWeight.w400),

                textAlign: TextAlign.center,
              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(55, 0, 55, 0),
              
              child: Text("Arshdeep Singh (+91 8565908370)", style: GoogleFonts.montserrat(
                  fontSize: 10.0,
                  height: 1.5,
                  fontWeight: FontWeight.w600),

                textAlign: TextAlign.center,
              ),
            ),

           ]
         )
        )
      )
    );
  }
}