import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:wvsu_tour_app/config/app.dart';
import 'package:wvsu_tour_app/widgets/organizations_logo.dart';

class OrganizationsList extends StatefulWidget {
  OrganizationsList({Key? key}) : super(key: key);

  @override
  _OrganizationsListState createState() => _OrganizationsListState();
}

class _OrganizationsListState extends State<OrganizationsList> {
  GlobalKey<ScrollSnapListState> sslKeyOrganizations = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size appScreenSize = MediaQuery.of(context).size;

    final CollectionReference<Map<String, dynamic>> collection =
        FirebaseFirestore.instance.collection('school_organization');
    ScrollController _view = ScrollController();
    return Container(
        child: SizedBox(
            height: 250,
            width: double.infinity,
            child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                future: collection.get(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.hasError) {
                    return Text("An error occured.");
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      final List<QueryDocumentSnapshot<Map<String, dynamic>>>
                          data = snapshot.data!.docs;
                      return new SingleChildScrollView(
                        controller: _view,
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(width: 20),
                            Row(
                                children: data.map((e) {
                              return OrganizationsLogo(
                                description: e.data()['Description'],
                                height: 150,
                                width: 150,
                                logo: apiUrl +
                                    e.data()['Logo']['formats']['thumbnail']
                                        ['url'],
                                name: e.data()['Name'],
                              );
                            }).toList()),
                          ],
                        ),
                      );
                    }
                  }
                  return Container(
                    width: double.infinity,
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [CircularProgressIndicator()],
                    ),
                  );
                })));
  }
}
