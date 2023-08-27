import 'package:crypto_owl/src/feature/crypto_currency/bloc/crypto_event.dart';
import 'package:crypto_owl/src/feature/crypto_currency/bloc/crypto_state.dart';
import 'package:crypto_owl/src/feature/crypto_currency/repository/crypto_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  final CryptoRepository cryptoRepository;

  CryptoBloc(this.cryptoRepository) : super(CryptoInitial()) {
    on<FetchCryptoCurrencies>((event, emit) {
      _mapFetchCryptoCurrenciesToState();
    });
  }
  Stream<CryptoState> mapEventToState(CryptoEvent event) async* {
    if (event is FetchCryptoCurrencies) {
      yield* _mapFetchCryptoCurrenciesToState();
    }
  }

  Stream<CryptoState> _mapFetchCryptoCurrenciesToState() async* {
    yield CryptoInitial();
    try {
      final cryptoCurrencies = await cryptoRepository.getCryptoCurrencies();
      yield CryptoLoaded(cryptoCurrencies);
    } catch (e) {
      yield CryptoError('Error fetching crypto currencies');
    }
  }
}
