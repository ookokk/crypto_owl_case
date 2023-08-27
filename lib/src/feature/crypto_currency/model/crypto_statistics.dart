import 'package:crypto_owl/src/feature/crypto_currency/model/crypto_currency.dart';

class CryptoStatistics {
  //  ortalama fiyatı hesaplar
  double calculateVWAP(List<Data> data) {
    double totalVolume = 0;
    double totalPrice = 0;

    for (var crypto in data) {
      totalVolume += double.parse(crypto.volumeUsd24Hr!);
      totalPrice +=
          double.parse(crypto.priceUsd!) * double.parse(crypto.volumeUsd24Hr!);
    }

    if (totalVolume != 0) {
      return totalPrice / totalVolume;
    } else {
      return 0; // Özel durumda VWAP sıfır dönebilir
    }
  }

  //  en yüksek fiyatı bulur
  double findMaxPrice(List<Data> data) {
    double maxPrice = double.parse(data[0].priceUsd!);

    for (var crypto in data) {
      double currentPrice = double.parse(crypto.priceUsd!);
      if (currentPrice > maxPrice) {
        maxPrice = currentPrice;
      }
    }

    return maxPrice;
  }

  //  en düşük fiyatı bulur
  double findMinPrice(List<Data> data) {
    double minPrice = double.parse(data[0].priceUsd!);

    for (var crypto in data) {
      double currentPrice = double.parse(crypto.priceUsd!);
      if (currentPrice < minPrice) {
        minPrice = currentPrice;
      }
    }

    return minPrice;
  }

  //  değişim yüzdesini hesaplar
  double calculateChangePercentage(List<Data> data) {
    double initialPrice = double.parse(data[0].priceUsd!);
    double latestPrice = double.parse(data[data.length - 1].priceUsd!);

    double changePercentage =
        ((latestPrice - initialPrice) / initialPrice) * 100;
    return changePercentage;
  }
}
