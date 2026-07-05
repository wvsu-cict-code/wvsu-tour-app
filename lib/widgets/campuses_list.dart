import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:wvsu_tour_app/config/app.dart';
import 'package:wvsu_tour_app/widgets/campus_card.dart';

class CampusesList extends StatefulWidget {
  CampusesList({Key? key}) : super(key: key);

  @override
  _CampusesListState createState() => _CampusesListState();
}

class _CampusesListState extends State<CampusesList> {
  GlobalKey<ScrollSnapListState> sslKeyCampuses = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size appScreenSize = MediaQuery.of(context).size;

    final CollectionReference<Map<String, dynamic>> collection =
        FirebaseFirestore.instance.collection('campuses');

    ScrollController _view = ScrollController();
    double _cardHeight = appScreenSize.height * 0.5;

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
                      height: _cardHeight - 20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [CircularProgressIndicator()],
                      ),
                    );
                  }

                  return new SingleChildScrollView(
                    controller: _view,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Row(
                          children: snapshot.data!.docs
                              .map((e) => CampusCard(
                                    id: e.id,
                                    height: 200,
                                    width: 300,
                                    name: e.data()['Name'],
                                    fullDescription:
                                        e.data()['FullDescription'],
                                    shortDescription:
                                        e.data()['ShortDescription'],
                                    fullImage: apiUrl +
                                        e.data()['FeaturedImage']['url'],
                                    featuredImage: apiUrl +
                                        e.data()['FeaturedImage']['formats']
                                            ['thumbnail']['url'],
                                    logo: apiUrl +
                                        e.data()['Logo']['formats']['thumbnail']
                                            ['url'],
                                  ))
                              .toList(),
                        )
                      ],
                    ),
                  );
                })));
  }
}
