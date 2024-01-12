import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VirtualTour extends StatefulWidget {
  const VirtualTour({super.key});

  @override
  State<VirtualTour> createState() => _VirtualTourState();
}

class _VirtualTourState extends State<VirtualTour> {
  final uri =
      "https://indonesiavirtualtour.com/storage/destination/museum-sejarah-jakarta/src/index.htm";
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    // Set to fullscreen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    controller = WebViewController()
      ..loadRequest(
        Uri.parse(uri),
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}
