import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:crypto_owl/src/feature/crypto_currency/bloc/crypto_bloc.dart';
import 'package:crypto_owl/src/feature/crypto_currency/repository/crypto_repository.dart';
import 'mock_data.dart'; // Import your MockData class

class MockCryptoRepository extends Mock implements CryptoRepository {}

void main() {
  group('CryptoBloc', () {
    late MockCryptoRepository mockCryptoRepository;
    late CryptoBloc cryptoBloc;

    setUp(() {
      mockCryptoRepository = MockCryptoRepository();
      cryptoBloc = CryptoBloc(mockCryptoRepository);
    });

    test('initial state is correct', () {
      expect(cryptoBloc.state, CryptoInitial());
    });

    test('crytpo loaded testi return value=api datalari', () async {
      final cryptoCurrencies = [
        MockData.mockData1,
        MockData.mockData2,
      ];

      when(mockCryptoRepository.getCryptoCurrencies())
          .thenReturn(Future.value(cryptoCurrencies));

      cryptoBloc.add(FetchCryptoCurrencies());

      await expectLater(
        cryptoBloc.stream,
        emitsInOrder([
          CryptoInitial(),
          CryptoLoaded(cryptoCurrencies),
        ]),
      );
    });

    test('emits CryptoError when data fetching fails', () {
      when(mockCryptoRepository.getCryptoCurrencies())
          .thenThrow(Exception('Error fetching data'));

      final expectedStates = [
        CryptoInitial(),
        CryptoError('Error fetching crypto currencies'),
      ];

      expectLater(cryptoBloc.stream, emitsInOrder(expectedStates));

      cryptoBloc.add(FetchCryptoCurrencies());
    });
  });
}
