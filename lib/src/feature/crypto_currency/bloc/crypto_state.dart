import 'package:crypto_owl/src/feature/crypto_currency/model/crypto_currency.dart';
import 'package:equatable/equatable.dart';

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
