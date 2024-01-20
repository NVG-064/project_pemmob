import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VirtualTour extends StatefulWidget {
  final String? uri;

  const VirtualTour({Key? key, required this.uri}) : super(key: key);

  @override
  State<VirtualTour> createState() => _VirtualTourState();
}

class _VirtualTourState extends State<VirtualTour> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    // Set to fullscreen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    controller = WebViewController()
      ..loadRequest(
        Uri.parse(widget.uri!),
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: WebViewWidget(controller: controller),
        onWillPop: () async {
          // Exit full screen
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

          // Set 'true' mean allows you to navigate pop
          return true;
        });
  }
}
