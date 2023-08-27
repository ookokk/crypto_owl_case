import 'package:crypto_owl/src/feature/crypto_currency/view/crypto_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'feature/crypto_currency/bloc/crypto_bloc.dart';
import 'feature/crypto_currency/repository/crypto_repository.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) {
        final cryptoRepository =
            CryptoRepositoryImpl(httpClient: http.Client());
        return CryptoBloc(cryptoRepository);
      },
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CryptoPage(),
    );
  }
}
