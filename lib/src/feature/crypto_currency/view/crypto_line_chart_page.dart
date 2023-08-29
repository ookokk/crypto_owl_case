import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:crypto_owl/src/feature/crypto_currency/model/crypto_currency.dart';

class CryptoLineChartPage extends StatelessWidget {
  final List<Data> cryptoCurrencies;

  const CryptoLineChartPage({required this.cryptoCurrencies, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Percent 24 Hour'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300, // Adjust the height as needed
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: const FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: cryptoCurrencies.length.toDouble() - 70,
                minY: -2,
                maxY: 2,
                lineBarsData: [
                  LineChartBarData(
                    spots: cryptoCurrencies.asMap().entries.map((entry) {
                      final data = entry.value;
                      final y = double.parse(data.changePercent24Hr ?? "0");
                      return FlSpot(entry.key.toDouble(), y);
                    }).toList(),
                    isCurved: true,
                    color: const Color(0xff183D3D),
                    dotData: const FlDotData(show: false),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (context, index) {
                final crypto = cryptoCurrencies[index];
                return Container(
                  height: 100,
                  width: 50,
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text(crypto.symbol ?? '')),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
