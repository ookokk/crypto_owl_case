import 'package:crypto_owl/src/feature/crypto_currency/model/crypto_currency.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CryptoBarChartPage extends StatelessWidget {
  final List<Data> cryptoCurrencies;

  const CryptoBarChartPage({Key? key, required this.cryptoCurrencies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BarChart(
          BarChartData(
            gridData: const FlGridData(show: false),
            titlesData: const FlTitlesData(show: false),
            borderData: FlBorderData(show: false),
            maxY: 3,
            barGroups: cryptoCurrencies.asMap().entries.map((entry) {
              final data = entry.value;
              final y = double.parse(data.changePercent24Hr ?? "0");
              return BarChartGroupData(
                x: entry.key,
                barRods: [
                  BarChartRodData(toY: y, color: const Color(0xff183D3D))
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
