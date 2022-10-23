import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WhatNewsWebViewWidget extends StatefulWidget {
  final String url;

  const WhatNewsWebViewWidget({Key? key, required this.url}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WhatNewsWebViewWidgetState();
  }
}

class _WhatNewsWebViewWidgetState extends State<WhatNewsWebViewWidget> {
  final Completer<WebViewController> controller =
      Completer<WebViewController>();
  final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers = {
    Factory(() => EagerGestureRecognizer())
  };
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      if (Platform.isAndroid) WebView.platform = AndroidWebView();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WebView(
      gestureRecognizers: gestureRecognizers,
      initialUrl: widget.url,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        setState(() {
          controller.complete(webViewController);
        });
      },
    );
  }
}
