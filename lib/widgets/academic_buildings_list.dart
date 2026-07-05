import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:wvsu_tour_app/config/app.dart';
import 'package:wvsu_tour_app/widgets/academic_buildings_card.dart';

class AcademicBuildingsList extends StatefulWidget {
  AcademicBuildingsList({Key? key}) : super(key: key);

  @override
  _AcademicBuildingsListState createState() => _AcademicBuildingsListState();
}

class _AcademicBuildingsListState extends State<AcademicBuildingsList> {
  GlobalKey<ScrollSnapListState> sslKeyAcademicBuildings = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size appScreenSize = MediaQuery.of(context).size;

    ScrollController _view = ScrollController();

    double _cardHeight = appScreenSize.height * 0.5;

    final CollectionReference<Map<String, dynamic>> collection =
        FirebaseFirestore.instance.collection('academic_buildings');
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
                                .map((e) => AcademicBuildingCard(
                                    height: 200,
                                    width: 300,
                                    longDescription:
                                        e.data()['LongDescription'],
                                    name: e.data()['Name'],
                                    fullImage: apiUrl +
                                        e.data()['FeaturedImage']['url'],
                                    featureImage: apiUrl +
                                        e.data()['FeaturedImage']['formats']
                                            ['thumbnail']['url']))
                                .toList(),
                          )
                        ],
                      ));
                })));
  }
}
