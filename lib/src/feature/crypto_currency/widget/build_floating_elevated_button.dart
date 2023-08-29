import 'package:crypto_owl/src/feature/crypto_currency/bloc/crypto_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

ElevatedButton buildFloatingElevatedButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      context.read<CryptoBloc>().add(FetchCryptoCurrencies());
    },
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: const Color(0xff183D3D),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 5,
    ),
    child: const Text(
      'Fetch Data',
      style: TextStyle(fontSize: 20),
    ),
  );
}
