import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VolunteersAvatar extends StatelessWidget {
  const VolunteersAvatar(
      {Key? key,
      this.name,
      this.profileImage,
      this.description,
      this.height,
      this.width})
      : super(key: key);

  final double? height;
  final double? width;
  final String? profileImage;
  final String? description;
  final String? name;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProfileAvatar(
            this.profileImage ?? "",
            radius: 50,
            backgroundColor: Colors.grey[200] ?? Colors.grey,
            borderWidth: 10,
            borderColor: Colors.transparent,
            cacheImage: true,
            onTap: () {
              showDialog<void>(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("About"),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Column(
                              children: [
                                SizedBox(
                                  width: 200,
                                  height: 200,
                                  child: CircularProfileAvatar(
                                    this.profileImage ?? "",
                                    radius: 100,
                                    backgroundColor:
                                        Colors.grey[200] ?? Colors.grey,
                                    borderWidth: 10,
                                    borderColor: Colors.transparent,
                                    cacheImage: true,
                                    showInitialTextAbovePicture:
                                        true, // setting it true will show initials text above profile picture, default false
                                  ),
                                ),
                                Text(
                                  this.name ?? "",
                                  style: GoogleFonts.lato(fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                                Text(this.description ?? '',
                                    textAlign: TextAlign.center),
                              ],
                            )
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  });
            },
            showInitialTextAbovePicture:
                true, // setting it true will show initials text above profile picture, default false
          ),
        ],
      ),
    );
  }
}
