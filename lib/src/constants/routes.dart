import 'package:crypto_owl/src/feature/crypto_currency/view/crypto_page.dart';
import 'package:crypto_owl/src/feature/splash/view/splash_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => const SplashPage(),
    '/crypto': (context) => const CryptoPage(),
  };
}
