import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:crypto_owl/src/feature/crypto_currency/model/crypto_currency.dart';

class CryptoPieChartPage extends StatelessWidget {
  final List<Data> cryptoCurrencies;

  const CryptoPieChartPage({required this.cryptoCurrencies, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PieChart(
          PieChartData(
            sections: _createPieSections(),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> _createPieSections() {
    List<PieChartSectionData> sections = [];

    for (int i = 0; i < 4; i++) {
      final cryptoCurrency = cryptoCurrencies[i];
      final double changePercent =
          double.parse(cryptoCurrency.changePercent24Hr ?? "0") / 100.0;

      sections.add(
        PieChartSectionData(
          value: changePercent,
          color: _getColorForIndex(i),
          title: cryptoCurrency.symbol,
          radius: 150,
          titleStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      );
    }

    return sections;
  }

  Color _getColorForIndex(int index) {
    List<Color> colors = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.orange,
      Colors.white70,
    ];
    return colors[index % colors.length];
  }
}
