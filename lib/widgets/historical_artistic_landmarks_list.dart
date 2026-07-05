import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:wvsu_tour_app/config/app.dart';
import 'package:wvsu_tour_app/widgets/historical_artistic_landmarks_card.dart';

class HistoricalArtisticLandmarksList extends StatefulWidget {
  HistoricalArtisticLandmarksList({Key? key}) : super(key: key);

  @override
  _HistoricalArtisticLandmarksListState createState() =>
      _HistoricalArtisticLandmarksListState();
}

class _HistoricalArtisticLandmarksListState
    extends State<HistoricalArtisticLandmarksList> {
  GlobalKey<ScrollSnapListState> sslKeyHistoricalArtisticLandmarks =
      GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size appScreenSize = MediaQuery.of(context).size;

    final CollectionReference<Map<String, dynamic>> collection =
        FirebaseFirestore.instance.collection('landmarks');

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
                                .map((e) => HistoricalArtisticLandmarksCard(
                                      height: 200,
                                      width: 300,
                                      name: e.data()['Name'],
                                      featureImage: apiUrl +
                                          e.data()['FeaturedImage']['url'],
                                    ))
                                .toList())
                      ],
                    ),
                  );
                })));
  }
}
