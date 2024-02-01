import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class AnxietydisorderScreen extends StatefulWidget {
  const AnxietydisorderScreen({super.key});

  @override
  State<AnxietydisorderScreen> createState() => _AnxietydisorderScreenState();
}

class _AnxietydisorderScreenState extends State<AnxietydisorderScreen> {
  WebViewController controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.disabled)
 ..loadRequest(Uri.parse('https://ar.wikipedia.org/wiki/%D8%A7%D8%B6%D8%B7%D8%B1%D8%A7%D8%A8_%D8%A7%D9%84%D9%82%D9%84%D9%82'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(controller: controller) ,
    );
  }
}
