import 'package:crypto_owl/src/constants/app_string.dart';
import 'package:crypto_owl/src/feature/crypto_currency/model/crypto_currency.dart';
import 'package:crypto_owl/src/feature/crypto_currency/repository/crypto_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'mock_data.dart';

class MockHttpClient extends Mock implements http.Client {}

// ...

void main() {
  late CryptoRepositoryImpl cryptoRepository;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    cryptoRepository = CryptoRepositoryImpl(httpClient: mockHttpClient);
  });

  group('getCryptoCurrencies', () {
    test('data listesi don http requesti', () async {
      // Arrange
      when(mockHttpClient.get(Uri.parse(AppString.apiKey))).thenAnswer(
        (_) async => http.Response(
            '{"data": [${MockData.mockData1.toJson()}, ${MockData.mockData2.toJson()}]}',
            200),
      );

      // Act
      final result = await cryptoRepository.getCryptoCurrencies();

      // Assert
      expect(result, isA<List<Data>>());
      expect(result.length, 2);
      expect(result[0].name, 'Bitcoin');
      expect(result[1].name, 'Ethereum');
    });

    test('hata alirsan bunu dondur', () async {
      // Arrange
      when(mockHttpClient.get(Uri.parse(AppString.apiKey)))
          .thenThrow(Exception('fetch problem var'));

      // Act and Assert
      expect(() async => await cryptoRepository.getCryptoCurrencies(),
          throwsException);
    });
  });
}
