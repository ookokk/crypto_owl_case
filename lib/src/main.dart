import 'package:crypto_owl/src/constants/routes.dart';
import 'package:crypto_owl/src/feature/crypto_currency/view/crypto_page.dart';
import 'package:flutter/material.dart';
import 'feature/crypto_currency/widget/build_crypto_provider.dart';

void main() {
  runApp(
    buildCryptoProvider(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: Routes.routes,
      debugShowCheckedModeBanner: false,
      //home: CryptoPage(),
    );
  }
}
