import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class NewsWebView extends StatefulWidget {
  const NewsWebView({super.key,required this.url});
final String url;
  @override
  State<NewsWebView> createState() => _NewsWebViewState();
}

class _NewsWebViewState extends State<NewsWebView> {
late WebViewController controller;
@override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..loadRequest(Uri.parse(widget.url));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(controller: controller),
    );
  }
}
