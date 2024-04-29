import 'package:flutter/material.dart';
import 'screens/webView.dart'; // Importa la clase WebView creada

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MCCAB',
      home: WebViewMccab(),
    );
  }
}
