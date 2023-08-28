import 'package:bloc_test/bloc_test.dart';
import 'package:crypto_owl/src/feature/crypto_currency/model/crypto_currency.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:crypto_owl/src/feature/crypto_currency/bloc/crypto_bloc.dart';
import 'package:crypto_owl/src/feature/crypto_currency/repository/crypto_repository.dart';
import 'package:mockito/mockito.dart';

class MockCryptoRepository extends Mock implements CryptoRepository {
  @override
  Future<List<Data>> getCryptoCurrencies() {
    // TODO: implement getCryptoCurrencies
    throw UnimplementedError();
  }
}

void main() {
  group('CryptoBloc', () {
    late CryptoRepository cryptoRepository;

    setUp(() {
      cryptoRepository = MockCryptoRepository();
    });

    blocTest<CryptoBloc, CryptoState>(
      'emits [CryptoInitial, CryptoLoaded] when FetchCryptoCurrencies is added',
      build: () => CryptoBloc(cryptoRepository),
      act: (bloc) => bloc.add(FetchCryptoCurrencies()),
      expect: () => [CryptoInitial(), CryptoLoaded(const [])],
    );
  });
}
