import 'dart:convert';
import 'package:crypto_owl/constants/app_string.dart';
import 'package:crypto_owl/src/feature/crypto_currency/model/crypto_currency.dart';
import 'package:http/http.dart' as http;

abstract class CryptoRepository {
  Future<List<Data>> getCryptoCurrencies();
}

class CryptoRepositoryImpl implements CryptoRepository {
  final http.Client httpClient;
  CryptoRepositoryImpl({required this.httpClient});

  @override
  Future<List<Data>> getCryptoCurrencies() async {
    try {
      final response = await http.get(Uri.parse(AppString.apiKey));
      if (response.statusCode == 200) {
        final jsonBody = json.decode(response.body);
        final cryptoList = jsonBody['data'] as List;
        return cryptoList
            .map((cryptoJson) => Data.fromJson(cryptoJson))
            .toList();
      } else {
        throw Exception('fetch problem var');
      }
    } catch (e) {
      throw Exception('hata olustu $e');
    }
  }
}
