import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:crypto_owl/constants/app_string.dart';
import 'package:crypto_owl/src/feature/crypto_currency/repository/crypto_repository.dart';
import 'package:crypto_owl/src/feature/crypto_currency/model/crypto_currency.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  group('CryptoRepositoryImpl', () {
    late MockClient mockClient;
    late CryptoRepositoryImpl cryptoRepository;

    setUp(() {
      mockClient = MockClient();
      cryptoRepository = CryptoRepositoryImpl(httpClient: mockClient);
    });

    test('getCryptoCurrencies returns a list of Data', () async {
      final responseData = {
        'data': [
          {'name': 'Bitcoin', 'symbol': 'BTC'}
        ]
      };
      final response = http.Response(json.encode(responseData), 200);

      when(mockClient.get(Uri.parse(AppString.apiKey)))
          .thenAnswer((_) async => response);

      final cryptoCurrencies = await cryptoRepository.getCryptoCurrencies();

      expect(cryptoCurrencies, isA<List<Data>>());
      expect(cryptoCurrencies.length, 1);
      expect(cryptoCurrencies[0].name, 'Bitcoin');
      expect(cryptoCurrencies[0].symbol, 'BTC');
    });

    test('getCryptoCurrencies handles error', () async {
      when(mockClient.get(Uri.parse(AppString.apiKey)))
          .thenAnswer((_) async => http.Response('Error', 500));

      expect(() async => await cryptoRepository.getCryptoCurrencies(),
          throwsA(isA<Exception>()));
    });
  });
}
