import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:wvsu_tour_app/config/app.dart';

class LegalScreen extends StatefulWidget {
  LegalScreen({Key? key}) : super(key: key);

  @override
  _LegalScreenState createState() => _LegalScreenState();
}

class _LegalScreenState extends State<LegalScreen> {
  String _markdownPrivacy = "";
  String _markdownTerms = "";
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    getDocData();
  }

  Future<void> getDocData() async {
    setState(() {
      _loading = true;
    });
    final Uri privacyUri = Uri.parse(
        "https://raw.githubusercontent.com/wvsu-cict-code/wvsu-tour-app/master/privacy.md");
    final Uri termsUri = Uri.parse(
        "https://raw.githubusercontent.com/wvsu-cict-code/wvsu-tour-app/master/terms_and_conditions.md");
    final http.Response privacyResponse = await http.get(privacyUri);
    if (privacyResponse.statusCode == 200) {
      setState(() {
        _markdownPrivacy = privacyResponse.body;
      });
    } else {
      print('Request failed with status: ${privacyResponse.statusCode}.');
    }

    final http.Response termsResponse = await http.get(termsUri);
    if (termsResponse.statusCode == 200) {
      setState(() {
        _markdownTerms = termsResponse.body;
        _loading = false;
      });
    } else {
      print('Request failed with status: ${termsResponse.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              "Legal",
              style: GoogleFonts.lato(color: Colors.black),
            ),
            leading: IconButton(
                icon: Icon(
                  Feather.chevron_left,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            backgroundColor: Colors.white,
          ),
          body: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: appDefaultPadding),
                child: Markdown(data: "$_markdownPrivacy \n$_markdownTerms"),
              ),
              _loading == true
                  ? Center(child: CircularProgressIndicator())
                  : Container()
            ],
          )),
    );
  }
}
