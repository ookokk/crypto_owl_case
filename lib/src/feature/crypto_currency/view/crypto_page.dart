import 'package:crypto_owl/src/feature/crypto_currency/view/crypto_bar_chart_page.dart';
import 'package:crypto_owl/src/feature/crypto_currency/view/crypto_line_chart_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_owl/src/feature/crypto_currency/bloc/crypto_bloc.dart';
import 'package:crypto_owl/src/feature/crypto_currency/model/crypto_currency.dart';

class CryptoPage extends StatelessWidget {
  const CryptoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        body: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              buildTabBarItems(),
              Expanded(
                child: TabBarView(
                  children: [
                    buildListViewBuilder(),
                    CryptoLineChartPage(
                      cryptoCurrencies: getCryptoCurrenciesFromState(context),
                    ),
                    CryptoBarChartPage(
                      cryptoCurrencies: getCryptoCurrenciesFromState(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // floatingActionButton: buildFloatingElevatedButton(context),
      ),
    );
  }

  TabBar buildTabBarItems() {
    return const TabBar(
      labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      labelColor: Colors.black,
      tabs: [
        Tab(
            icon: Icon(
              CupertinoIcons.list_bullet,
              color: Colors.black,
              size: 33,
            ),
            text: 'List'),
        Tab(
            icon: Icon(
              CupertinoIcons.graph_square,
              color: Colors.black,
              size: 33,
            ),
            text: 'Line Chart'),
        Tab(
            icon: Icon(
              CupertinoIcons.chart_bar_alt_fill,
              color: Colors.black,
              size: 33,
            ),
            text: 'Bar Chart'),
      ],
    );
  }

  List<Data> getCryptoCurrenciesFromState(BuildContext context) {
    final state = context.watch<CryptoBloc>().state;
    if (state is CryptoLoaded) {
      return state.cryptoCurrencies;
    }
    return [];
  }

  BlocBuilder<CryptoBloc, CryptoState> buildListViewBuilder() {
    return BlocBuilder<CryptoBloc, CryptoState>(
      builder: (context, state) {
        if (state is CryptoInitial) {
          return const Center(child: Text('state is crypto initial'));
        } else if (state is CryptoLoaded) {
          return _buildCryptoList(state.cryptoCurrencies);
        } else if (state is CryptoError) {
          return Center(child: Text(state.errorMessage));
        }
        return Container();
      },
    );
  }

  Widget _buildCryptoList(List<Data> cryptoCurrencies) {
    return ListView.builder(
      itemCount: cryptoCurrencies.length,
      itemBuilder: (context, index) {
        final crypto = cryptoCurrencies[index];
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.grey.shade300, width: 1),
          ),
          elevation: 3,
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: ListTile(
            title: Text(
              crypto.name ?? '',
              style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              crypto.symbol ?? '',
              style: const TextStyle(fontSize: 18),
            ),
            trailing: Text(
              crypto.formatChangePercent(
                crypto.changePercent24Hr,
              ),
              style: const TextStyle(fontSize: 20),
            ),
          ),
        );
      },
    );
  }
}
