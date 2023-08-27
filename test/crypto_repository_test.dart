import 'package:crypto_owl/src/feature/crypto_currency/model/crypto_currency.dart';
import 'package:crypto_owl/src/feature/crypto_currency/repository/crypto_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  group('CryptoRepositoryImpl', () {
    late CryptoRepositoryImpl cryptoRepository;
    late MockHttpClient mockHttpClient;

    final mockResponse = http.Response(
      '{"data":[{"id":"bitcoin","name":"Bitcoin"}]}', // Mock response body
      200, // Mock response status code
    );

    setUp(() {
      mockHttpClient = MockHttpClient();
      cryptoRepository = CryptoRepositoryImpl(httpClient: mockHttpClient);
    });

    test('getCryptoCurrencies returns a list of Data when successful',
        () async {
      // Arrange
      // Use the previously defined mockResponse
      when(mockHttpClient.get(Uri.parse('https://api.coincap.io/v2/assets')))
          .thenAnswer((_) async => mockResponse);

      // Act
      final result = await cryptoRepository.getCryptoCurrencies();

      // Assert
      expect(
          result, isA<List<Data>>()); // Verify that the result is a List<Data>
      expect(result.length, 1); // Verify that the list contains one element
      expect(result[0].id, 'bitcoin'); // Verify the content of the element
    });

    test('getCryptoCurrencies throws an exception on error', () {
      // Arrange
      // Second when statement
      when(mockHttpClient.get(Uri.parse('https://api.coincap.io/v2/assets')))
          .thenAnswer((_) async => http.Response('Error', 400));

      // Act & Assert
      expect(() => cryptoRepository.getCryptoCurrencies(), throwsException);
    });
  });
}
