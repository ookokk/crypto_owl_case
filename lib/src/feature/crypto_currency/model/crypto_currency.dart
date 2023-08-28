import 'package:json_annotation/json_annotation.dart';
part 'crypto_currency.g.dart';

@JsonSerializable()
class CryptoCurrency {
  final List<Data>? data;
  final int? timestamp;

  const CryptoCurrency(this.data, this.timestamp);

  factory CryptoCurrency.fromJson(Map<String, dynamic> json) =>
      _$CryptoCurrencyFromJson(json);
  Map<String, dynamic> toJson() => _$CryptoCurrencyToJson(this);
}

@JsonSerializable()
class Data {
  final String? id;
  final String? rank;
  final String? symbol;
  final String? name;
  final String? supply;
  final String? maxSupply;
  final String? marketCapUsd;
  final String? volumeUsd24Hr;
  final String? priceUsd;
  final String? changePercent24Hr;
  final String? vwap24Hr;
  final String? explorer;

  const Data(
      this.id,
      this.rank,
      this.symbol,
      this.name,
      this.supply,
      this.maxSupply,
      this.marketCapUsd,
      this.volumeUsd24Hr,
      this.priceUsd,
      this.changePercent24Hr,
      this.vwap24Hr,
      this.explorer);

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
  @override
  String toString() {
    return 'Data(id: $id, rank: $rank, symbol: $symbol, name: $name, supply: $supply, maxSupply: $maxSupply, marketCapUsd: $marketCapUsd, volumeUsd24Hr: $volumeUsd24Hr, priceUsd: $priceUsd, changePercent24Hr: $changePercent24Hr, vwap24Hr: $vwap24Hr, explorer: $explorer)';
  }

  String formatChangePercent(String? changePercent24Hr) {
    if (changePercent24Hr != null) {
      double changePercent = double.parse(changePercent24Hr);
      String formattedChange = changePercent.toStringAsFixed(3);
      return "$formattedChange%";
    }
    return "";
  }
}
