import 'package:crypto_owl/src/feature/crypto_currency/model/crypto_currency.dart';
import 'package:flutter/material.dart';
import 'package:crypto_owl/src/feature/crypto_currency/repository/crypto_repository.dart';
import 'package:http/http.dart' as http;

class DenePage extends StatefulWidget {
  const DenePage({Key? key}) : super(key: key);

  @override
  _DenePageState createState() => _DenePageState();
}

class _DenePageState extends State<DenePage> {
  final CryptoRepository _cryptoRepository = CryptoRepositoryImpl(
    httpClient: http.Client(),
  );

  late Future<List<Data>> _cryptoCurrenciesFuture;

  @override
  void initState() {
    super.initState();
    _cryptoCurrenciesFuture = _fetchDataFromApi();
  }

  Future<List<Data>> _fetchDataFromApi() async {
    try {
      final cryptoCurrencies = await _cryptoRepository.getCryptoCurrencies();
      print(cryptoCurrencies);
      return cryptoCurrencies;
    } catch (e) {
      print("API Error: $e");
      return []; // Boş liste döndürme
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Currencies'),
      ),
      body: FutureBuilder<List<Data>>(
        future: _cryptoCurrenciesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No data available.'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final data = snapshot.data![index];
                return ListTile(
                  title: Text(data.name ?? ''),
                  subtitle: Text(data.symbol ?? ''),
                );
              },
            );
          }
        },
      ),
    );
  }
}
