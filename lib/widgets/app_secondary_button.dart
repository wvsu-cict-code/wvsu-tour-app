import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wvsu_tour_app/config/app.dart';

class AppSecondaryButton extends StatefulWidget {
  AppSecondaryButton({Key? key, this.text, this.onPressed, this.icon})
      : super(key: key);
  final String? text;
  final VoidCallback? onPressed;
  final IconData? icon;
  @override
  _AppSecondaryButtonState createState() => _AppSecondaryButtonState();
}

class _AppSecondaryButtonState extends State<AppSecondaryButton> {
  TextStyle buttonStyle =
      GoogleFonts.lato(color: appSecondaryColor, fontSize: 15);
  EdgeInsetsGeometry buttonPadding = EdgeInsets.fromLTRB(0, 15, 0, 15);
  OutlinedBorder buttonShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(23),
      side: BorderSide(color: appSecondaryColor));
  Color buttonTextColor = appSecondaryColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: buttonTextColor,
                backgroundColor: Colors.white,
                padding: buttonPadding,
                shape: buttonShape,
                side: BorderSide(color: appSecondaryColor),
              ),
              onPressed: widget.onPressed,
              icon: Icon(widget.icon),
              label: Text(widget.text ?? '', style: buttonStyle))),
    );
  }
}
