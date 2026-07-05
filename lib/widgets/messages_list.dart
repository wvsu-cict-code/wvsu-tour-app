import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:wvsu_tour_app/config/app.dart';
import 'package:wvsu_tour_app/widgets/message_card.dart';

class MessagesList extends StatefulWidget {
  MessagesList({Key? key}) : super(key: key);

  @override
  _MessagesListState createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {
  GlobalKey<ScrollSnapListState> sslKeyMessages = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size appScreenSize = MediaQuery.of(context).size;
    ScrollController _view = ScrollController();
    double _cardHeight = appScreenSize.height * 0.5;
    final CollectionReference<Map<String, dynamic>> collection =
        FirebaseFirestore.instance.collection('messages');

    return Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: SizedBox(
            height: appScreenSize.height * 0.5,
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
                              .map((e) => MessageCard(
                                    id: e.id,
                                    height: _cardHeight - 20,
                                    width: 300,
                                    name: e.data()['Name'],
                                    description: e.data()['Description'],
                                    messageBody: e.data()['MessageBody'],
                                    featuredImage: apiUrl +
                                        e.data()['FeaturedImage']['url'],
                                  ))
                              .toList(),
                        )
                      ],
                    ),
                  );
                })));
  }
}
