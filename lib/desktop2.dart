import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewContainer extends StatefulWidget {
  final url;

  WebViewContainer(this.url);

  @override
  createState() => _WebViewContainerState(this.url);
}

class _WebViewContainerState extends State<WebViewContainer> {
  var _url="https://www.amazon.in/?&_encoding=UTF8&tag=bappasaikh-21&linkCode=ur2&linkId=e3b009b026920c3cfdd6185fadfb7e67&camp=3638&creative=24630";
  final _key = UniqueKey();

  _WebViewContainerState(this._url);


//to load desktop mode
  String js = "document.querySelector('meta[name=\"viewport\"]').setAttribute('content', 'width=1024px, initial-scale=' + (document.documentElement.clientWidth / 1024))";


  @override
  Widget build(BuildContext context) {
    final flutterWebViewPlugin = new FlutterWebviewPlugin();

    flutterWebViewPlugin.onProgressChanged.listen((event) {
      debugPrint("Progress $event");

      //this will make show in desktop mode
      flutterWebViewPlugin.evalJavascript(js);

    });



    return WebviewScaffold(
      appBar: AppBar(
        title: Text("Desktop Mode"),
      ),
      url: _url,
      withJavascript: true,
      useWideViewPort: true,
      displayZoomControls: false,
      scrollBar: true,
      withZoom: true,
      userAgent: js,
    );
  }

}