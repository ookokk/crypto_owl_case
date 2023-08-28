import 'package:crypto_owl/src/feature/crypto_currency/view/crypto_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto_owl/src/feature/crypto_currency/bloc/crypto_bloc.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final String _lottieAsset =
      'https://lottie.host/d7f18a56-3399-48a6-b3b6-3d6a67416036/ox15wy4XbW.json';

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CryptoBloc>(context).add(FetchCryptoCurrencies());
    _navigateToCryptoPage();
  }

  void _navigateToCryptoPage() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const CryptoPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [Expanded(child: Lottie.network(_lottieAsset))],
    )));
  }
}
