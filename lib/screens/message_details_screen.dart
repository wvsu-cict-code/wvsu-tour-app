import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wvsu_tour_app/config/app.dart';
import 'package:wvsu_tour_app/widgets/like_action_button.dart';

class MessageDetailsScreen extends StatelessWidget {
  const MessageDetailsScreen(
      {Key? key,
      this.id,
      this.name,
      this.featuredImage,
      this.messageBody,
      this.description})
      : super(key: key);
  final String? name;
  final String? id;
  final String? description;
  final dynamic featuredImage;
  final String? messageBody;
  @override
  Widget build(BuildContext context) {
    Size appScreenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Message",
            style: GoogleFonts.lato(color: Colors.black),
          ),
          elevation: 1,
          actions: [LikeActionButton(id: this.id ?? '')],
          leading: IconButton(
              icon: Icon(
                Feather.chevron_left,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Stack(
          children: [
            Container(
              width: appScreenSize.width,
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  CircularProfileAvatar(
                    this.featuredImage ?? '',
                    radius: 60,
                    backgroundColor: Colors.grey[200] ?? Colors.grey,
                    borderWidth: 10,
                    borderColor: Colors.transparent,
                    cacheImage: true,
                    onTap: () {
                      print('img');
                    }, // sets on tap
                    showInitialTextAbovePicture:
                        true, // setting it true will show initials text above profile picture, default false
                  ),
                  Text(
                    this.name ?? '',
                    style: appSecondaryTitleTextStyle,
                  ),
                  Text(this.description ?? ''),
                  Divider(height: 30),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: appScreenSize.height * 0.3),
              child: Markdown(
                data: this.messageBody ?? '',
                imageDirectory: apiUrl,
              ),
            )
          ],
        ));
  }
}
