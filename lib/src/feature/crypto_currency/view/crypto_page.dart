import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_owl/src/feature/crypto_currency/bloc/crypto_bloc.dart';
import 'package:crypto_owl/src/feature/crypto_currency/model/crypto_currency.dart';

class CryptoPage extends StatelessWidget {
  const CryptoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          context.read<CryptoBloc>().add(FetchCryptoCurrencies());
        },
        child: const Text('Fetch Datas'),
      ),
      body: BlocBuilder<CryptoBloc, CryptoState>(
        builder: (context, state) {
          print("Current State: $state");
          if (state is CryptoInitial) {
            return const Center(child: Text('state is crypto initial'));
          } else if (state is CryptoLoaded) {
            return _buildCryptoList(state.cryptoCurrencies);
          } else if (state is CryptoError) {
            return Center(child: Text(state.errorMessage));
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildCryptoList(List<Data> cryptoCurrencies) {
    return ListView.builder(
      itemCount: cryptoCurrencies.length,
      itemBuilder: (context, index) {
        final crypto = cryptoCurrencies[index];
        return ListTile(
          title: Text(crypto.name ?? ''),
          subtitle: Text(crypto.symbol ?? ''),
          trailing: Text(crypto.priceUsd ?? ''),
        );
      },
    );
  }
}
