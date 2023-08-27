// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoCurrency _$CryptoCurrencyFromJson(Map<String, dynamic> json) =>
    CryptoCurrency(
      (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['timestamp'] as int?,
    );

Map<String, dynamic> _$CryptoCurrencyToJson(CryptoCurrency instance) =>
    <String, dynamic>{
      'data': instance.data,
      'timestamp': instance.timestamp,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['id'] as String?,
      json['rank'] as String?,
      json['symbol'] as String?,
      json['name'] as String?,
      json['supply'] as String?,
      json['maxSupply'] as String?,
      json['marketCapUsd'] as String?,
      json['volumeUsd24Hr'] as String?,
      json['priceUsd'] as String?,
      json['changePercent24Hr'] as String?,
      json['vwap24Hr'] as String?,
      json['explorer'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'rank': instance.rank,
      'symbol': instance.symbol,
      'name': instance.name,
      'supply': instance.supply,
      'maxSupply': instance.maxSupply,
      'marketCapUsd': instance.marketCapUsd,
      'volumeUsd24Hr': instance.volumeUsd24Hr,
      'priceUsd': instance.priceUsd,
      'changePercent24Hr': instance.changePercent24Hr,
      'vwap24Hr': instance.vwap24Hr,
      'explorer': instance.explorer,
    };
