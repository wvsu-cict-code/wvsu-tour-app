import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewer extends StatelessWidget {
  const PhotoViewer({Key? key, this.image, this.description}) : super(key: key);
  final String? description;
  final String? image;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.black));
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            PhotoView(
              imageProvider: ExtendedNetworkImageProvider(this.image ?? ''),
              loadingBuilder: (context, event) => Text("Loading...",
                  style: GoogleFonts.lato(color: Colors.white)),
            ),
            Positioned(
              top: 30,
              left: 20,
              child: Row(
                children: [
                  IconButton(
                      icon: Icon(
                        Feather.chevron_left,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  Text(
                    "Viewing Photo",
                    style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
            Positioned(
                bottom: 40,
                left: 20,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    this.description ?? "Loading...",
                    overflow: TextOverflow.visible,
                    softWrap: true,
                    style: GoogleFonts.lato(color: Colors.white, fontSize: 18),
                  ),
                ))
          ],
        ));
  }
}
