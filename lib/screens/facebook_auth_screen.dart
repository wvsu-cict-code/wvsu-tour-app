import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FacebookAuthWeb extends StatefulWidget {
  const FacebookAuthWeb({super.key, required this.selectedUrl});

  final String selectedUrl;

  @override
  State<FacebookAuthWeb> createState() => _FacebookAuthWebState();
}

class _FacebookAuthWebState extends State<FacebookAuthWeb> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) {
            final String url = request.url;
            if (url.contains('#access_token')) {
              _succeed(url);
              return NavigationDecision.prevent;
            }

            if (url.contains(
                'https://www.facebook.com/connect/login_success.html?error=access_denied')) {
              _denied();
              return NavigationDecision.prevent;
            }

            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.selectedUrl));
  }

  void _denied() {
    Navigator.pop(context);
  }

  void _succeed(String url) {
    final List<String> params = url.split('access_token=');
    final String token = params.length > 1 ? params[1].split('&').first : '';
    Navigator.pop(context, token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(66, 103, 178, 1),
        title: const Text('Facebook login'),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
