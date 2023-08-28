import 'package:crypto_owl/src/feature/crypto_currency/bloc/crypto_bloc.dart';
import 'package:crypto_owl/src/feature/crypto_currency/repository/crypto_repository.dart';
import 'package:crypto_owl/src/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

BlocProvider<CryptoBloc> buildCryptoProvider() {
  return BlocProvider(
    create: (context) {
      final cryptoRepository = CryptoRepositoryImpl(httpClient: http.Client());
      return CryptoBloc(cryptoRepository);
    },
    child: const MyApp(),
  );
}
