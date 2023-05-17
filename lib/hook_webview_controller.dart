import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:webview_flutter/webview_flutter.dart';

WebViewController useWebViewController() {
  return use(const _WebViewControllerHook());
}

class _WebViewControllerHook extends Hook<WebViewController> {
  const _WebViewControllerHook();

  @override
  HookState<WebViewController, Hook<WebViewController>> createState() =>
      _WebViewControllerState();
}

class _WebViewControllerState
    extends HookState<WebViewController, _WebViewControllerHook> {
  final _controller = WebViewController();

  @override
  void initHook() {
    super.initHook();
  }

  @override
  WebViewController build(_) {
    return _controller;
  }
}
