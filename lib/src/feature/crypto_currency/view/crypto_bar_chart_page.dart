import 'package:crypto_owl/src/feature/crypto_currency/widget/crypto_custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:crypto_owl/src/feature/crypto_currency/model/crypto_currency.dart';

class CryptoBarChartPage extends StatelessWidget {
  final List<Data> cryptoCurrencies;

  const CryptoBarChartPage({required this.cryptoCurrencies, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cryptoCustomAppBar('Price USD'),
      body: Center(
        child: BarChart(
          BarChartData(
            gridData: const FlGridData(show: false),
            titlesData: _createTitles(),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: const Color(0xff37434d), width: 1),
            ),
            alignment: BarChartAlignment.spaceAround,
            barGroups: _getBarGroups(),
          ),
        ),
      ),
    );
  }

  FlTitlesData _createTitles() {
    return FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, titleMeta) {
            if (value >= 0 && value < 5.toDouble()) {
              final cryptoCurrency = cryptoCurrencies[value.toInt()];
              return Text(
                cryptoCurrency.symbol ?? '',
                style: const TextStyle(fontSize: 16, color: Colors.black),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  List<BarChartGroupData> _getBarGroups() {
    List<BarChartGroupData> groups = [];

    for (int i = 0; i < 5; i++) {
      final cryptoCurrency = cryptoCurrencies[i];
      final double price = double.parse(cryptoCurrency.priceUsd ?? "0");
      groups.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              fromY: 0,
              width: 16,
              toY: price,
            ),
          ],
        ),
      );
    }

    return groups;
  }
}
