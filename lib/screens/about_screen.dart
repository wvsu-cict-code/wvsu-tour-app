import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:wvsu_tour_app/config/app.dart';
import 'package:wvsu_tour_app/firebase/auth.dart';
import 'package:wvsu_tour_app/widgets/volunteers_list.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key, required this.auth});

  final BaseAuth auth;

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  String _userPhotoUrl =
      'https://icon-library.com/images/avatar-icon-images/avatar-icon-images-4.jpg';
  User? _user;
  String _projectVersion = '';
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ));
    _loadCurrentUser();
    _loadVersion();
  }

  Future<void> _loadCurrentUser() async {
    final User? user = await widget.auth.getCurrentUser();
    if (!mounted || user == null) {
      return;
    }

    setState(() {
      _user = user;
      _userPhotoUrl = user.photoURL ?? _userPhotoUrl;
    });
  }

  Future<void> _loadVersion() async {
    try {
      final PackageInfo packageInfo = await PackageInfo.fromPlatform();
      if (!mounted) {
        return;
      }
      setState(() {
        _projectVersion = packageInfo.version;
      });
    } on PlatformException {
      if (!mounted) {
        return;
      }
      setState(() {
        _projectVersion = 'Failed to get project version.';
      });
    }
  }

  Future<void> _launchUrlString(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size appScreenSize = MediaQuery.of(context).size;
    final String providerId = _user != null && _user!.providerData.isNotEmpty
        ? _user!.providerData.first.providerId
        : '...';

    return Scaffold(
      backgroundColor: appPrimaryColor,
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo is UserScrollNotification) {
            if (scrollInfo.direction == ScrollDirection.forward) {
              SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.dark,
                statusBarColor: Colors.transparent,
              ));
            } else if (scrollInfo.direction == ScrollDirection.reverse) {
              SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.dark,
                statusBarColor: Colors.white,
              ));
            }
          }
          return false;
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(color: appPrimaryColor),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        appDefaultPadding,
                        appScreenSize.height * 0.07,
                        appDefaultPadding,
                        0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('About', style: appTitleTextStyle),
                          Text(
                            'Information about this app',
                            style: appBodyTextStyle,
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: appScreenSize.height * 0.19),
                  child: Container(
                    width: appScreenSize.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: appDefaultShadow,
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(36)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
                          child: Text('App User',
                              style: appSecondaryTitleTextStyle),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: appDefaultPadding),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: SizedBox(
                                      height: 120,
                                      width: 50,
                                      child: CircularProfileAvatar(
                                        _userPhotoUrl,
                                        radius: 100,
                                        backgroundColor:
                                            Colors.grey[200] ?? Colors.grey,
                                        borderWidth: 10,
                                        borderColor: Colors.transparent,
                                        cacheImage: true,
                                        showInitialTextAbovePicture: true,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _user?.displayName ?? 'User Name',
                                          style: appBodyBoldTextStyle,
                                        ),
                                        Text(
                                          'Connected via $providerId',
                                          style: appBodyTextStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Expanded(
                                    flex: 1,
                                    child: SizedBox(width: 10),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: IconButton(
                                      tooltip: 'Logout',
                                      icon: const Icon(Feather.log_out),
                                      onPressed: () {
                                        widget.auth.signOut();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Divider(thickness: 2.0, height: 30),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(30, 10, 30, 10),
                              child: WebsafeSvg.asset(
                                'assets/icon/icon.svg',
                                height: 90,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(30, 10, 30, 10),
                              child: Text(
                                'WVSU Campus Tour',
                                style: appSecondaryTitleTextStyle,
                              ),
                            ),
                            Text(_projectVersion),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(30, 10, 30, 10),
                              child: Text(
                                'WVSU Campus Tour is a mobile app developed by the volunteers from the College of Information and Communications Technology, Main Campus. It aims to mitigate the effect of the pandemic for students who want to get more familiar with the University.',
                                style: appBodyTextStyle,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(30, 10, 30, 10),
                              child: SizedBox(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ElevatedButton.icon(
                                          onPressed: () {
                                            _launchUrlString(
                                                'https://www.facebook.com/wvsufb/');
                                          },
                                          icon: const Icon(
                                              FontAwesome.facebook_square),
                                          label: const Text('/wvsufb'),
                                        ),
                                        const SizedBox(width: 20),
                                        ElevatedButton.icon(
                                          onPressed: () {
                                            _launchUrlString(
                                                'https://www.facebook.com/cictwvsu');
                                          },
                                          icon: const Icon(
                                              FontAwesome.facebook_square),
                                          label: const Text('/cictwvsu'),
                                        ),
                                      ],
                                    ),
                                    ElevatedButton.icon(
                                      onPressed: () {
                                        _launchUrlString(
                                            'https://twitter.com/cictwvsu');
                                      },
                                      icon: const Icon(
                                          FontAwesome.twitter_square),
                                      label: const Text('@cictwvsu'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(thickness: 2, height: 30),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(30, 10, 30, 10),
                              child: Image.asset(
                                'assets/images/wvsu-big-logo.png',
                                height: 90,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(30, 10, 30, 10),
                              child: Text(
                                'West Visayas State University',
                                style: appSecondaryTitleTextStyle,
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        30, 10, 30, 10),
                                    child: Text(
                                      'Vision',
                                      style: appSecondaryTitleTextStyle,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        30, 10, 30, 10),
                                    child: Text(
                                      'WVSU as the center for educational excellence in the Visayas and the hub for Human Resource Development in the Asia-Pacific region.',
                                      style: appBodyTextStyle,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        30, 10, 30, 10),
                                    child: Text(
                                      'Mission',
                                      style: appSecondaryTitleTextStyle,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        30, 10, 30, 10),
                                    child: Text(
                                      'WVSU is committed to provide holistic education geared towards sustainable growth and development.',
                                      style: appBodyTextStyle,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        30, 10, 30, 10),
                                    child: Text(
                                      'Core Values',
                                      style: appSecondaryTitleTextStyle,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        30, 10, 30, 10),
                                    child: Text(
                                      'Scholarship, Harmony, Innovation, Nurturance, Excellence, Service',
                                      style: appBodyTextStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Divider(thickness: 2, height: 30),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Volunteers',
                                style: appSecondaryTitleTextStyle,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'This app is not possible without their help.',
                                style: appBodyTextStyle,
                              ),
                            ],
                          ),
                        ),
                        VolunteersList(),
                        const Divider(thickness: 2, height: 30),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                          child: Text(
                            'Open Source',
                            style: GoogleFonts.lato(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                          child: Column(
                            children: [
                              Text(
                                'WVSU Campus tour app is being developed publicly on GitHub. Anyone with or without the knowledge of programming can help with its development. Please report any suggestions or issues by pressing the button below.',
                                style: appBodyTextStyle,
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    _launchUrlString(
                                      'https://github.com/wvsu-cict-code/wvsu-tour-app/issues',
                                    );
                                  },
                                  icon: const Icon(FontAwesome.github),
                                  label: const Text('Contribute'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
