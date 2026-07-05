import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:wvsu_tour_app/config/app.dart';
import 'package:wvsu_tour_app/widgets/facilities_amenities_card.dart';

class FacilitiesAmenitiesList extends StatefulWidget {
  FacilitiesAmenitiesList({Key? key}) : super(key: key);

  @override
  _FacilitiesAmenitiesListState createState() =>
      _FacilitiesAmenitiesListState();
}

class _FacilitiesAmenitiesListState extends State<FacilitiesAmenitiesList> {
  GlobalKey<ScrollSnapListState> sslKeyFacilitiesAmenities = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size appScreenSize = MediaQuery.of(context).size;

    final CollectionReference<Map<String, dynamic>> collection =
        FirebaseFirestore.instance.collection('facilities_amenities');
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
                              .map((e) => FaciltlitiesAmenitiesCard(
                                    height: 200,
                                    width: 300,
                                    shortDescription:
                                        e.data()['ShortDescription'],
                                    name: e.data()['Name'],
                                    fullImage: apiUrl +
                                        e.data()['FeaturedImage']['url'],
                                    featureImage: apiUrl +
                                        e.data()['FeaturedImage']['formats']
                                            ['thumbnail']['url'],
                                  ))
                              .toList(),
                        )
                      ],
                    ),
                  );
                })));
  }
}
