import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wvsu_tour_app/config/app.dart';
import 'package:wvsu_tour_app/screens/academic_building_details_screen.dart';

class AcademicBuildingCard extends StatelessWidget {
  const AcademicBuildingCard(
      {Key? key,
      this.featureImage,
      this.fullImage,
      this.height,
      this.name,
      this.width,
      this.longDescription})
      : super(key: key);
  final String? longDescription;
  final String? name;
  final double? height;
  final double? width;
  final String? featureImage;
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
                      builder: (context) => AcademicBuildingDetailsScreen(
                        longDescription: this.longDescription,
                        name: this.name,
                        featuredImage: this.fullImage ?? this.featureImage,
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
                          this.featureImage ?? '',
                          fit: BoxFit.fill,
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
                      ]))
                ],
              ),
            )));
  }
}
