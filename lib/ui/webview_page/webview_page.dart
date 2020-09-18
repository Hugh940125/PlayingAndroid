import 'package:flutter/material.dart';
import 'package:playing/common/routes/webview_args.dart';
import 'package:playing/widget/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  // final String url;
  // final String title;

  //WebViewPage(this.url, this.title);

  @override
  State<StatefulWidget> createState() => WebViewPageState();
}

class WebViewPageState extends State<WebViewPage> {
  int loadState = 0;
  WebviewArgs webviewArgs;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    webviewArgs = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: CommonAppBar(webviewArgs.title, "web",canBack: true).build(context),
      body: Stack(
        children: [
          WebView(
            initialUrl: webviewArgs.url,
            javascriptMode: JavascriptMode.unrestricted,
            onPageStarted: (_) {
              setState(() {
                isLoading = true;
              });
            },
            onPageFinished: (_) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading
              ? Container(
                  height: 1,
                  alignment: Alignment.topCenter,
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
