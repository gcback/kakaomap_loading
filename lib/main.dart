import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kakaomap/hook_webview_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'kakaomap_script.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomeView(),
    );
  }
}

void useEffectOnce(Dispose? Function() effect) => useEffect(effect, []);

class HomeView extends HookWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useWebViewController();
    useEffectOnce(() {
      controller.setJavaScriptMode(JavaScriptMode.unrestricted);
      controller.setBackgroundColor(Colors.orange);
      controller.addJavaScriptChannel(
        'sample',
        onMessageReceived: (p0) {},
      );
      controller.setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {}, // Update loading bar.
          onPageStarted: (url) => print('onPageStarted : $url'),
          onPageFinished: (url) => print('onPageFinished : $url'),
          onWebResourceError: (e) => print('onWebResourceError : $e'),
        ),
      );

      return null;
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('home', style: TextStyle(fontSize: 16.0)),
      ),
      body: WebViewWidget(controller: controller),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.loadHtmlString(loadMap);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}