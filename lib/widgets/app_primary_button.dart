import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wvsu_tour_app/config/app.dart';

class AppPrimaryButton extends StatefulWidget {
  AppPrimaryButton({Key? key, this.text, this.onPressed, this.icon})
      : super(key: key);
  final String? text;
  final VoidCallback? onPressed;
  final IconData? icon;
  @override
  _AppPrimaryButtonState createState() => _AppPrimaryButtonState();
}

class _AppPrimaryButtonState extends State<AppPrimaryButton> {
  TextStyle buttonStyle = GoogleFonts.lato(color: Colors.white, fontSize: 15);
  EdgeInsetsGeometry buttonPadding = EdgeInsets.fromLTRB(0, 15, 0, 15);
  OutlinedBorder buttonShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(23)));
  Color buttonTextColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: appSecondaryColor,
                foregroundColor: buttonTextColor,
                padding: buttonPadding,
                shape: buttonShape,
              ),
              onPressed: widget.onPressed,
              icon: Icon(widget.icon),
              label: Text(widget.text ?? '', style: buttonStyle))),
    );
  }
}
