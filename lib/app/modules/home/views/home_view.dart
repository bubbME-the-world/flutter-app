import 'dart:collection';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;
  InAppWebViewSettings settings = InAppWebViewSettings(
      isInspectable: kDebugMode,
      mediaPlaybackRequiresUserGesture: false,
      allowsInlineMediaPlayback: true,
      iframeAllow: "camera; microphone",
      iframeAllowFullscreen: true);

  PullToRefreshController? pullToRefreshController;

  late ContextMenu contextMenu;
  String url = "";
  double progress = 0;
  final urlController = TextEditingController();

  @override
  void initState() {
    super.initState();

    contextMenu = ContextMenu(
        menuItems: [
          ContextMenuItem(
              id: 1,
              title: "Special",
              action: () async {
                print("Menu item Special clicked!");
                print(await webViewController?.getSelectedText());
                await webViewController?.clearFocus();
              })
        ],
        settings: ContextMenuSettings(hideDefaultSystemContextMenuItems: false),
        onCreateContextMenu: (hitTestResult) async {
          print("onCreateContextMenu");
          print(hitTestResult.extra);
          print(await webViewController?.getSelectedText());
        },
        onHideContextMenu: () {
          print("onHideContextMenu");
        },
        onContextMenuActionItemClicked: (contextMenuItemClicked) async {
          var id = contextMenuItemClicked.id;
          print(
              "onContextMenuActionItemClicked: $id ${contextMenuItemClicked.title}");
        });

    pullToRefreshController = kIsWeb ||
            ![TargetPlatform.iOS, TargetPlatform.android]
                .contains(defaultTargetPlatform)
        ? null
        : PullToRefreshController(
            settings: PullToRefreshSettings(
              color: Colors.blue,
            ),
            onRefresh: () async {
              if (defaultTargetPlatform == TargetPlatform.android) {
                webViewController?.reload();
              } else if (defaultTargetPlatform == TargetPlatform.iOS) {
                webViewController?.loadUrl(
                    urlRequest:
                        URLRequest(url: await webViewController?.getUrl()));
              }
            },
          );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              InAppWebView(
                key: webViewKey,
                initialUrlRequest:
                    URLRequest(url: WebUri('https://bubbserver.com/game/home')),
                /*initialUrlRequest: URLRequest(
                    url: WebUri(
                        'https://4b0a-2404-8000-1024-2c4c-78be-c1f9-14b5-5.ngrok-free.app')),*/
                initialUserScripts: UnmodifiableListView<UserScript>([]),
                initialSettings: settings,
                contextMenu: contextMenu,
                pullToRefreshController: pullToRefreshController,
                onWebViewCreated: (webViewController) async {
                  this.webViewController = webViewController;
                  String initUserJsonData = jsonEncode({
                    "key": "INIT_USER",
                    "value":
                        '{"user_id": "user001","user_name": "test","token": "token"}'
                  });

                  String initChatJsonData = jsonEncode({
                    "key": "INIT_CHAT",
                    "value": '{"chat": "false","mood": "mood_name"}'
                  });

                  this.webViewController?.addJavaScriptHandler(
                        handlerName: "handlerReceivedUser",
                        callback: (args) {
                          // Return the JSON data
                          return initUserJsonData;
                        },
                      );

                  this.webViewController?.addJavaScriptHandler(
                        handlerName: "handlerReceivedChat",
                        callback: (args) {
                          // Return the JSON data
                          return initChatJsonData;
                        },
                      );
                },
                onLoadStart: (webViewController, url) {
                  setState(() {
                    this.url = url.toString();
                    urlController.text = this.url;
                  });
                  // _sendDataToWebView();
                },
                shouldOverrideUrlLoading:
                    (webViewController, navigationAction) async {
                  var uri = navigationAction.request.url!;

                  if (![
                    "http",
                    "https",
                    "file",
                    "chrome",
                    "data",
                    "javascript",
                    "about"
                  ].contains(uri.scheme)) {
                    if (await canLaunchUrl(uri)) {
                      // Launch the App
                      await launchUrl(
                        uri,
                      );
                      // and cancel the request
                      return NavigationActionPolicy.CANCEL;
                    }
                  }

                  return NavigationActionPolicy.ALLOW;
                },
                onLoadStop: (webViewController, url) async {
                  pullToRefreshController?.endRefreshing();
                  setState(() {
                    this.url = url.toString();
                    urlController.text = this.url;
                  });
                },
                onReceivedError: (webViewController, request, error) {
                  pullToRefreshController?.endRefreshing();
                },
                onProgressChanged: (webViewController, progress) {
                  if (progress == 100) {
                    pullToRefreshController?.endRefreshing();
                  }
                  setState(() {
                    this.progress = progress / 100;
                    urlController.text = this.url;
                  });
                },
                onUpdateVisitedHistory: (webViewController, url, isReload) {
                  setState(() {
                    this.url = url.toString();
                    urlController.text = this.url;
                  });
                },
                onConsoleMessage: (webViewController, consoleMessage) {
                  print('console message: $consoleMessage');
                  String message = consoleMessage.message;
                  Map<String, dynamic> data = jsonDecode(message);

                  String key = data['key'];
                  String value = data['value'];
                  controller.navigateTo(key, value);

                  if (key == 'UNITY_LOADED') {
                    _sendDataUserToWebView();
                  } else if (key == 'INIT_USER') {
                    Future.delayed(
                      const Duration(seconds: 1),
                      () {
                        _sendDataChatToWebView();
                      },
                    );
                  }
                },
              ),
              progress < 1.0
                  ? LinearProgressIndicator(value: progress)
                  : Container(),
            ],
          ),
        ),
      );
    });
  }

  Future<void> _sendDataUserToWebView() async {
    webViewController?.evaluateJavascript(source: """
    window.flutter_inappwebview.callHandler('handlerReceivedUser')
      .then(function(result) {
        console.log(result);
        sendMessageToUnity(result);
      });
  """);
  }

  Future<void> _sendDataChatToWebView() async {
    webViewController?.evaluateJavascript(source: """
    window.flutter_inappwebview.callHandler('handlerReceivedChat')
      .then(function(result) {
        console.log(result);
        sendMessageToUnity(result);
      });
  """);
  }
}
