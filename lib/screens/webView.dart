import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WebViewMccab extends StatefulWidget {
  @override
  _WebViewMccabState createState() => _WebViewMccabState();
}

class _WebViewMccabState extends State<WebViewMccab> {
  bool _isLoadingPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.01,
        ),
        child: Stack(
          children: <Widget>[
            WebView(
              initialUrl: 'https://boompark.com.bo/app',
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (_) {
                setState(() {
                  _isLoadingPage = false;
                });
              },
              navigationDelegate: (NavigationRequest request) {
                if (!request.url.startsWith('http')) {
                  return NavigationDecision.prevent;
                }
                return NavigationDecision.navigate;
              },
              onPageStarted: (String url) {
                setState(() {
                  _isLoadingPage = true;
                });
              },
              onWebViewCreated: (WebViewController controller) {
                // Eliminar el guardado en caché
                controller.clearCache();
                // No establecer la configuración de caché en JavaScript
                // (Se ha eliminado la línea que lo hacía)
              },
            ),
            if (_isLoadingPage)
              Stack(
                children: [
                  Opacity(
                    opacity: 0.7,
                    child: Container(
                      color: Colors.black,
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: SpinKitFadingCube(
                            color: Colors.white,
                            size: 27.0,
                          ),
                        ),
                        SizedBox(height: 17),
                        Text(
                          'Cargando...',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
