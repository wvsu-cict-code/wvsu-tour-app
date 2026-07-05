import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wvsu_tour_app/config/app.dart';
import 'package:wvsu_tour_app/screens/college_details.dart';
import 'package:wvsu_tour_app/widgets/like_counter.dart';

class CollegeCard extends StatelessWidget {
  const CollegeCard(
      {Key? key,
      this.shortDescription,
      this.longDescription,
      this.name,
      this.logo,
      this.id,
      this.campus,
      this.featuredImage,
      this.fullImage,
      this.height,
      this.photos,
      this.width})
      : super(key: key);

  final double? height;
  final double? width;
  final String? logo;
  final String? fullImage;
  final String? name;
  final List<dynamic>? photos;
  final String? campus;
  final String? id;
  final String? longDescription;
  final String? shortDescription;
  final String? featuredImage;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: appDefaultBorderRadius,
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            width: this.width,
            height: this.height,
            decoration: BoxDecoration(
              boxShadow: appDefaultShadow,
              color: Colors.white,
              borderRadius: appDefaultBorderRadius,
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CollegeDetailsScreen(
                        id: this.id,
                        longDescription: this.longDescription,
                        name: this.name,
                        logo: this.logo,
                        featuredImage: this.fullImage ?? this.featuredImage,
                      ),
                    ));
              },
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: appDefaultBorderRadius,
                    child: Container(
                      decoration: BoxDecoration(color: appPrimaryColor),
                      height: (this.height ?? 0) + 10,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Center(
                            child: ExtendedImage.network(
                          this.featuredImage ?? '',
                          fit: BoxFit.fill,
                          cache: true,
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: (this.height ?? 0) + 10,
                    width: this.width,
                    child: Opacity(
                      opacity: 0.3,
                      child: Container(
                          decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: appDefaultBorderRadius,
                      )),
                    ),
                  ),
                  Container(
                    width: this.width,
                    height: this.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProfileAvatar(
                          this.logo ?? '',
                          radius: 60,
                          backgroundColor: Colors.grey[200] ?? Colors.grey,
                          borderWidth: 10,
                          borderColor: Colors.transparent,
                          cacheImage: true,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CollegeDetailsScreen(
                                    longDescription: this.longDescription,
                                    name: this.name,
                                    logo: this.logo,
                                    featuredImage: featuredImage,
                                  ),
                                ));
                          }, // sets on tap
                          showInitialTextAbovePicture:
                              true, // setting it true will show initials text above profile picture, default false
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 20,
                      left: 20,
                      child: Row(children: [
                        Icon(SimpleLineIcons.doc,
                            color: Colors.white, size: 15),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: Text(this.name ?? '',
                              style: GoogleFonts.lato(color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              softWrap: true),
                        )
                      ])),
                  Positioned(
                      top: 20,
                      right: 20,
                      child: Opacity(
                        opacity: 0.9,
                        child: Row(
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(width: 5),
                            LikeCounter(
                              id: this.id,
                              color: Colors.white,
                              fontSize: 18,
                            )
                          ],
                        ),
                      ))
                ],
              ),
            )));
  }
}
