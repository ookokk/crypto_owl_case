import 'package:crypto_owl/src/constants/device_size.dart';
import 'package:crypto_owl/src/feature/crypto_currency/widget/crypto_custom_app_bar.dart';
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
      appBar: cryptoCustomAppBar('Change Percent 24Hr'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: DeviceSize.dHeight(context) *
                    0.6, // Adjust the height as needed
                child: build24HrLineChart(),
              ),
              buildCoinIDSizedBox(context),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildCoinIDSizedBox(BuildContext context) {
    return SizedBox(
      height: DeviceSize.dHeight(context) * 0.2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          final crypto = cryptoCurrencies[index];
          return Container(
            height: 100,
            width: 55,
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              crypto.symbol ?? '',
              style: const TextStyle(
                  fontSize: 15, overflow: TextOverflow.ellipsis),
            )),
          );
        },
      ),
    );
  }

  LineChart build24HrLineChart() {
    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        minX: 0,
        maxX: 8,
        minY: -2,
        maxY: 5,
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
    );
  }
}
