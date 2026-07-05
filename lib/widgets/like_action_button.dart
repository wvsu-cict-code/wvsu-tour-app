import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LikeActionButton extends StatefulWidget {
  LikeActionButton({Key? key, this.id}) : super(key: key);
  final String? id;
  @override
  _LikeActionButtonState createState() => _LikeActionButtonState();
}

class _LikeActionButtonState extends State<LikeActionButton> {
  IconData _likeIcon = Icons.favorite_outline;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return IconButton(
        icon: Icon(
          _likeIcon,
          color: Color(0xFF666666),
        ),
        onPressed: null,
      );
    }

    final CollectionReference<Map<String, dynamic>> collection =
        FirebaseFirestore.instance
            .collection('likes_bucket')
            .doc(widget.id)
            .collection('likes');

    final Future<DocumentSnapshot<Map<String, dynamic>>> doc =
        collection.doc(user.uid).get();

    Future<void> addLike() async {
      await collection.doc(user.uid).set({'liked': true});
    }

    Future<void> removeLike() async {
      await collection.doc(user.uid).delete();
    }

    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: collection.snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasError) {
            print("Error");
          }

          if (snapshot.hasData) {
            doc.then((value) {
              if (value.exists) {
                if (this.mounted) {
                  this.setState(() {
                    _likeIcon = Icons.favorite;
                  });
                }
              } else {
                if (this.mounted) {
                  this.setState(() {
                    _likeIcon = Icons.favorite_outline;
                  });
                }
              }
            });
          }
          return new IconButton(
              icon: Icon(
                _likeIcon,
                color: Color(0xFF666666),
              ),
              onPressed: () {
                if (_likeIcon == Icons.favorite) {
                  removeLike();
                } else {
                  addLike();
                }
              });
        });
  }
}
