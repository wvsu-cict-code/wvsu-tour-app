import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markdown_widget/widget/markdown_block.dart';
import 'package:wvsu_tour_app/config/app.dart';

class AdministrativeBuildingDetailsScreen extends StatelessWidget {
  const AdministrativeBuildingDetailsScreen(
      {Key? key, this.name, this.featuredImage, this.longDescription})
      : super(key: key);
  final String? name;
  final dynamic featuredImage;
  final String? longDescription;

  @override
  Widget build(BuildContext context) {
    Size appScreenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Administrative Building",
            style: GoogleFonts.lato(color: Colors.black),
          ),
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
                padding: EdgeInsets.all(appDefaultPadding),
                width: appScreenSize.width,
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
