import 'package:equatable/equatable.dart';

abstract class CryptoEvent extends Equatable {}

class FetchCryptoCurrencies extends CryptoEvent {
  @override
  List<Object?> get props => [];
}

class UpdateCryptoInformation extends CryptoEvent {
  final String cryptoId;

  UpdateCryptoInformation(this.cryptoId);

  @override
  List<Object?> get props => [cryptoId];
}
