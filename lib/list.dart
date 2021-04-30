import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:kanpurfightscovid/model/user.dart';

class ListReq extends StatefulWidget {
  final User listReq;
  ListReq(this.listReq);

  @override
  _ListReqState createState() => _ListReqState();
}

final notesReference = FirebaseDatabase.instance.reference().child('listReq');

class _ListReqState extends State<ListReq> {
  TextEditingController _mobileController;
  TextEditingController _requirementController;
  TextEditingController _nameController;

  @override
  void initState() {
    super.initState();

    _nameController = new TextEditingController(text: widget.listReq.name);
    _mobileController = new TextEditingController(text: widget.listReq.mobile);
    _requirementController = new TextEditingController(text: widget.listReq.requirements);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post your Requirements'),),
      body: Container(
        
        margin: EdgeInsets.all(18.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Patient's Name"),
            ),
            Padding(padding: new EdgeInsets.all(5.0)),

            TextField(
              controller: _mobileController,
              decoration: InputDecoration(labelText: "Mobile Number"),
            ),
            Padding(padding: new EdgeInsets.all(5.0)),


            TextField(
              controller: _requirementController,
              decoration: InputDecoration(labelText: 'Requirements'),
            ),

            Padding(padding: new EdgeInsets.all(30.0)),
            ElevatedButton(
              child: (widget.listReq.name != null) ? Text('Update') : Text('Post', style: GoogleFonts.nunito(fontSize: 15.0, fontWeight: FontWeight.w700,)),
              style: ButtonStyle(
              
                padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(60, 10, 60, 10)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0),)
              ),
              ),
              onPressed: () {
                if (widget.listReq.name != null) {
                  notesReference.child(widget.listReq.name).set({
                    'name': _nameController.text,
                    'mobile': _mobileController.text,
                    'requirements': _requirementController.text
                  }).then((_) {
                    Navigator.pop(context);
                  });
                } else {
                  notesReference.push().set({
                    'name': _nameController.text,
                    'mobile': _mobileController.text,
                    'requirements': _requirementController.text
                  }).then((_) {
                    Navigator.pop(context);
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
