import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markdown_widget/widget/markdown_block.dart';
import 'package:wvsu_tour_app/config/app.dart';
import 'package:wvsu_tour_app/widgets/like_action_button.dart';

class CollegeDetailsScreen extends StatelessWidget {
  const CollegeDetailsScreen(
      {Key? key,
      this.name,
      this.id,
      this.featuredImage,
      this.longDescription,
      this.logo})
      : super(key: key);
  final String? name;
  final dynamic featuredImage;
  final String? longDescription;
  final String? logo;
  final String? id;

  @override
  Widget build(BuildContext context) {
    Size appScreenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "College",
            style: GoogleFonts.lato(color: Colors.black),
          ),
          actions: [LikeActionButton(id: this.id ?? '')],
          elevation: 1,
          leading: IconButton(
              icon: Icon(
                Feather.chevron_left,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: appScreenSize.width,
                height: appScreenSize.height * 0.33,
                decoration: BoxDecoration(
                    color: appPrimaryColor,
                    image: DecorationImage(
                        image: NetworkImage(this.featuredImage ?? ''),
                        fit: BoxFit.cover)),
              ),
              Container(
                width: appScreenSize.width,
                height: appScreenSize.height * 0.33,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProfileAvatar(
                      this.logo ?? "",
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
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(appDefaultPadding),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: appDefaultBorderRadius,
                ),
                margin: EdgeInsets.only(top: appScreenSize.height * 0.3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      this.name ?? '',
                      style: appSecondaryTitleTextStyle,
                    ),
                    SizedBox(height: 10),
                    MarkdownBlock(data: this.longDescription ?? '')
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
