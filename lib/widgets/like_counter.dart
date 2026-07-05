import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LikeCounter extends StatefulWidget {
  LikeCounter({Key? key, this.id, this.color, this.fontSize}) : super(key: key);
  final String? id;
  final Color? color;
  final double? fontSize;
  @override
  _LikeCounterState createState() => _LikeCounterState();
}

class _LikeCounterState extends State<LikeCounter> {
  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return Text(
        "0",
        style: GoogleFonts.lato(
            color: widget.color ?? Colors.black,
            fontSize: widget.fontSize ?? 10),
      );
    }

    final CollectionReference<Map<String, dynamic>> collection =
        FirebaseFirestore.instance
            .collection('likes_bucket')
            .doc(widget.id)
            .collection('likes');

    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: collection.snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasError) {
            print("Error");
          }

          if (snapshot.hasData) {
            return new Text(snapshot.data!.docs.length.toString(),
                style: GoogleFonts.lato(
                    color: widget.color ?? Colors.black,
                    fontSize: widget.fontSize ?? 10));
          }
          return new Text(
            "0",
            style: GoogleFonts.lato(
                color: widget.color ?? Colors.black,
                fontSize: widget.fontSize ?? 10),
          );
        });
  }
}
