import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';

class OrganizationsLogo extends StatelessWidget {
  const OrganizationsLogo(
      {Key? key,
      this.name,
      this.logo,
      this.description,
      this.height,
      this.width})
      : super(key: key);

  final double? height;
  final double? width;
  final String? logo;
  final String? description;
  final String? name;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: (this.height ?? 0) + 30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProfileAvatar(
            this.logo ?? '',
            radius: 60,
            backgroundColor: Colors.grey[200] ?? Colors.grey,
            borderWidth: 10,
            borderColor: Colors.grey[200] ?? Colors.grey,
            cacheImage: true,
            onTap: () {
              print(this.logo);
            }, // sets on tap
            showInitialTextAbovePicture:
                true, // setting it true will show initials text above profile picture, default false
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            width: (this.width ?? 0) - 20,
            child: Column(
              children: [
                Text(
                  this.name ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: true,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
