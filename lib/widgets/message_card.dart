import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wvsu_tour_app/config/app.dart';
import 'package:wvsu_tour_app/screens/message_details_screen.dart';
import 'package:wvsu_tour_app/widgets/like_counter.dart';

class MessageCard extends StatelessWidget {
  const MessageCard(
      {Key? key,
      this.id,
      this.name,
      this.featuredImage,
      this.description,
      this.messageBody,
      this.onPressed,
      this.height,
      this.width})
      : super(key: key);

  final String? name;
  final String? id;
  final String? featuredImage;
  final VoidCallback? onPressed;
  final double? height;
  final double? width;
  final String? messageBody;
  final String? description;
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
                      builder: (context) => MessageDetailsScreen(
                        id: this.id,
                        description: this.description,
                        messageBody: this.messageBody,
                        name: this.name,
                        featuredImage: featuredImage,
                      ),
                    ));
              },
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: appDefaultBorderRadius,
                    child: Container(
                      decoration: BoxDecoration(color: appPrimaryColor),
                      height: this.height,
                      width: this.width,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Center(
                            child: ExtendedImage.network(
                          this.featuredImage ?? '',
                          fit: BoxFit.cover,
                          cache: true,
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: this.height,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(this.name ?? '',
                              style: GoogleFonts.lato(
                                  color: Colors.white, fontSize: 20)),
                          Text(this.description ?? '',
                              style: GoogleFonts.lato(color: Colors.white)),
                        ],
                      )),
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
