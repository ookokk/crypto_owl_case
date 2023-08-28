import 'package:crypto_owl/src/feature/crypto_currency/model/crypto_currency.dart';
import 'package:crypto_owl/src/feature/crypto_currency/repository/crypto_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  final CryptoRepository cryptoRepository;

  CryptoBloc(this.cryptoRepository) : super(CryptoInitial()) {
    on<FetchCryptoCurrencies>((event, emit) async {
      emit(CryptoInitial());

      try {
        final cryptoCurrencies = await cryptoRepository.getCryptoCurrencies();
        emit(CryptoLoaded(cryptoCurrencies));
      } catch (e) {
        emit(CryptoError('Error fetching crypto currencies'));
      }
    });
  }
}

abstract class CryptoEvent extends Equatable {}

class FetchCryptoCurrencies extends CryptoEvent {
  @override
  List<Object?> get props => [];
}

abstract class CryptoState extends Equatable {}

class CryptoInitial extends CryptoState {
  @override
  List<Object?> get props => [];
}

class CryptoLoaded extends CryptoState {
  final List<Data> cryptoCurrencies;

  CryptoLoaded(this.cryptoCurrencies);

  @override
  List<Object?> get props => [cryptoCurrencies];
}

class CryptoError extends CryptoState {
  final String errorMessage;

  CryptoError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
