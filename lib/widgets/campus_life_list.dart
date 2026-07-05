import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:wvsu_tour_app/config/app.dart';
import 'package:wvsu_tour_app/widgets/campus_life_photo_card.dart';

class CampusLifeList extends StatefulWidget {
  CampusLifeList({Key? key}) : super(key: key);

  @override
  _CampusLifeListState createState() => _CampusLifeListState();
}

class _CampusLifeListState extends State<CampusLifeList> {
  GlobalKey<ScrollSnapListState> sslKeyCampusLife = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size appScreenSize = MediaQuery.of(context).size;

    final CollectionReference<Map<String, dynamic>> collection =
        FirebaseFirestore.instance.collection('campus_life');

    return Container(
        child: SizedBox(
            height: 250,
            width: double.infinity,
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: collection.snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.hasError) {
                    return Text("An error occured.");
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      width: double.infinity,
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [CircularProgressIndicator()],
                      ),
                    );
                  }

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Row(
                            children: snapshot.data!.docs
                                .map((e) => CampusLifePhotoCard(
                                    height: 200,
                                    width: 300,
                                    shortDescription:
                                        e.data()['ShortDescription'],
                                    image: apiUrl +
                                        e.data()['Image']['formats']
                                            ['thumbnail']['url'],
                                    fullImage:
                                        apiUrl + e.data()['Image']['url']))
                                .toList())
                      ],
                    ),
                  );
                })));
  }
}
