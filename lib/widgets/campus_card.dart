import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wvsu_tour_app/config/app.dart';
import 'package:wvsu_tour_app/screens/campus_details.dart';
import 'package:wvsu_tour_app/widgets/like_counter.dart';

class CampusCard extends StatelessWidget {
  const CampusCard(
      {Key? key,
      this.shortDescription,
      this.fullDescription,
      this.name,
      this.logo,
      this.id,
      this.fullImage,
      this.featuredImage,
      this.height,
      this.width})
      : super(key: key);

  final double? height;
  final double? width;
  final String? id;
  final String? logo;
  final String? name;
  final String? fullDescription;
  final String? shortDescription;
  final String? featuredImage;
  final String? fullImage;
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
                      builder: (context) => CampusDetailsScreen(
                        fullDescription: this.fullDescription,
                        name: this.name,
                        logo: this.logo,
                        id: this.id,
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
                          border: Border.all(color: Colors.red, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          //cancelToken: cancellationToken,
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
                                  builder: (context) => CampusDetailsScreen(
                                    fullDescription: this.fullDescription,
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
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Row(children: [
                            Icon(SimpleLineIcons.doc,
                                color: Colors.white, size: 15),
                            SizedBox(
                              width: 5,
                            ),
                            Text(this.name ?? '',
                                style: GoogleFonts.lato(color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                softWrap: true)
                          ]))),
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
