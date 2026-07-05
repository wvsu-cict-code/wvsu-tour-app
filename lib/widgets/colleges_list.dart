import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:wvsu_tour_app/config/app.dart';
import 'package:wvsu_tour_app/widgets/college_card.dart';

class CollegesList extends StatefulWidget {
  CollegesList({Key? key}) : super(key: key);

  @override
  _CollegesListState createState() => _CollegesListState();
}

class _CollegesListState extends State<CollegesList> {
  GlobalKey<ScrollSnapListState> sslKeyColleges = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size appScreenSize = MediaQuery.of(context).size;

    final CollectionReference<Map<String, dynamic>> collection =
        FirebaseFirestore.instance.collection('colleges');

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
                              .map((e) => CollegeCard(
                                    id: e.id,
                                    height: 200,
                                    width: 300,
                                    campus: e.data()['Campus'],
                                    photos: e.data()['Photos'],
                                    name: e.data()['Name'],
                                    longDescription:
                                        e.data()['LongDescription'],
                                    shortDescription:
                                        e.data()['ShortDescription'],
                                    fullImage: apiUrl +
                                        e.data()['FeaturedImage']['url'],
                                    featuredImage: apiUrl +
                                        e.data()['FeaturedImage']['formats']
                                            ['thumbnail']['url'],
                                    logo: apiUrl + e.data()['Logo']['url'],
                                  ))
                              .toList(),
                        )
                      ],
                    ),
                  );
                })));
  }
}
